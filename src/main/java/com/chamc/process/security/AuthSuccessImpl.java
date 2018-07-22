package com.chamc.process.security;

import com.alibaba.fastjson.JSON;
import com.chamc.process.utils.interceptor.ResponseModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaynnay on 2018/7/20
 * SavedRequestAwareAuthenticationSuccessHandler
 **/
@Component
public class AuthSuccessImpl implements AuthenticationSuccessHandler{

    private Logger logger = LoggerFactory.getLogger(AuthSuccessImpl.class);

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setHeader("Content-Type","application/json;charset=UTF-8");
        ResponseModel<Object> ok = ResponseModel.builder().code(200).msg("success").data("ok").build();
        httpServletResponse.getWriter().write(JSON.toJSONString(ok));
    }
}
