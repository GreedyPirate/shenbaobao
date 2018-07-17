package com.chamc.process.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * Created by Jaynnay on 2018/7/11
 **/
@RestController
public class AuthController {

    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    private Logger logger = LoggerFactory.getLogger(AuthController.class);

    @PostMapping("auth")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public String auth(HttpServletRequest request, HttpServletResponse response) {
        SavedRequest savedRequest = Objects.requireNonNull(requestCache.getRequest(request, response), "获取SavedRequest失败");
        String targetUrl = savedRequest.getRedirectUrl();
        logger.info("targetUrl is", targetUrl);
        try {
            if (StringUtils.endsWithIgnoreCase(targetUrl, ".html")) {
                // TODO
                redirectStrategy.sendRedirect(request, response, "index.html");
            }
            return "请登陆";
        } catch (IOException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
}
