package com.chamc.process.security;

import com.alibaba.fastjson.JSON;
import com.chamc.process.utils.interceptor.ResponseModel;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaynnay on 2018/7/20
 **/
@Component
public class AuthFailureImpl implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        httpServletResponse.setHeader("Content-Type","application/json;charset=UTF-8");
        ResponseModel<Object> ok = ResponseModel.builder().code(401).msg("用户名或密码错误").data(null).build();
        httpServletResponse.setStatus(401);
        httpServletResponse.getWriter().write(JSON.toJSONString(ok));
    }
}
