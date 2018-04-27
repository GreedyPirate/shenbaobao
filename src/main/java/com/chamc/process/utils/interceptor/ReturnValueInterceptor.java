package com.chamc.process.utils.interceptor;

import com.alibaba.fastjson.JSON;
import org.springframework.core.MethodParameter;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by Jaynnay on 2018/4/24
 * 没用
 * @deprecated
 **/
public class ReturnValueInterceptor implements HandlerMethodReturnValueHandler {
    @Override
    public boolean supportsReturnType(MethodParameter returnType) {
        return true;
    }

    @Override
    public void handleReturnValue(Object returnValue, MethodParameter returnType,
                                  ModelAndViewContainer mavContainer, NativeWebRequest webRequest) throws Exception {
        ResponseModel model = new ResponseModel();
        model.setMsg(null);
        model.setData(returnValue);
        model.setCode(200);
        mavContainer.setRequestHandled(true);
        HttpServletResponse response = webRequest.getNativeResponse(HttpServletResponse.class);
        response.setContentType("text/plain;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(model));
    }
}
