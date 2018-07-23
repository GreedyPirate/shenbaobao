package com.chamc.process.utils.interceptor;

import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Jaynnay on 2018/4/16
 **/
@ControllerAdvice(basePackages="com.chamc.process.controller",annotations={RestController.class})
public class ControllerAdvisor implements ResponseBodyAdvice {
    @ExceptionHandler(ProcessException.class)
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public ResponseModel handleServiceExpcetion(ProcessException e){
        return ResponseModel
                .builder().data(null)
                .code(e.getErrorCode().getCode())
                .msg(e.getErrorCode().getMessage())
                .build();
    }

    //其他错误
    @ExceptionHandler({Exception.class})
    @ResponseBody
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseModel exception(Exception ex) {
        return ResponseModel
                .builder().data(null)
                .code(ErrorCode.INTERNAL_SERVER_ERROR.getCode())
                .msg(ErrorCode.INTERNAL_SERVER_ERROR.getMessage())
                .build();
    }

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        NoWrapper annotation = methodParameter.getMethod().getAnnotation(NoWrapper.class);
        ResponseStatus status = methodParameter.getMethod().getAnnotation(ResponseStatus.class);
        Integer code = 200;
        if(status != null){
            code = status.value().value();
        }
        if(annotation == null){
            return ResponseModel.builder().code(code).data(body).msg(null).build();
        }
        return body;
    }
}
