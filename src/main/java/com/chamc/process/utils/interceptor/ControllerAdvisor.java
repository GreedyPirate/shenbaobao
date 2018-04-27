package com.chamc.process.utils.interceptor;

import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * Created by Jaynnay on 2018/4/16
 **/
@ControllerAdvice(basePackages="com.chamc.process.controller",annotations={RestController.class})
public class ControllerAdvisor implements ResponseBodyAdvice {
    @ExceptionHandler(ProcessException.class)
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public ResponseModel handleServiceExpcetion(ProcessException e){
        ResponseModel model = new ResponseModel();
        model.setData(null);
        model.setCode(e.getErrorCode().getCode());
        model.setMsg(e.getErrorCode().getMessage());
        return model;
    }

    //其他错误
    @ExceptionHandler({Exception.class})
    @ResponseBody
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseModel exception(Exception ex) {
        ResponseModel model = new ResponseModel();
        model.setData(null);
        model.setCode(ErrorCode.INTERNAL_SERVER_ERROR.getCode());
        model.setMsg(ErrorCode.INTERNAL_SERVER_ERROR.getMessage());
        return model;
    }

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        ResponseModel model = new ResponseModel();
        model.setCode(20000);
        model.setData(body);
        model.setMsg(null);
        return model;
    }
}
