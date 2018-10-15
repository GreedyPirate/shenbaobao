package com.chamc.process.utils.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * Created by Jaynnay on 2018/4/16
 **/
@RestControllerAdvice(basePackages="com.chamc.process.controller",annotations={RestController.class})
@Slf4j
public class ControllerAdvisor extends ResponseEntityExceptionHandler implements ResponseBodyAdvice {
    @ExceptionHandler(ProcessException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseModel handleServiceExpcetion(ProcessException e){
        Integer code = e.getErrorCode().getCode();
        String message = e.getErrorCode().getMessage();

        ResponseModel model = new ResponseModel();
        model.setData(null);
        model.setCode(code);
        model.setMsg(message);
        log.error("ProcessException occured, code is {}, message is {}", code, message);
        return model;
    }

    //其他错误
    @ExceptionHandler({Exception.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseModel handleOrdinaryException(Exception ex) {
        ResponseModel model = new ResponseModel();
        model.setData(null);
        model.setCode(ErrorCode.INTERNAL_SERVER_ERROR.getCode());
        model.setMsg(ErrorCode.INTERNAL_SERVER_ERROR.getMessage());
        String classname = ex.getClass().getSimpleName();
        log.error("{} is occured, message is {}",classname, ex.getMessage());
        return model;
    }

    /**
     * 参数校验
     * @param ex
     * @return
     */
    @ExceptionHandler({BindException.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseModel handleParamValidException(BindException ex) {
        ResponseModel model = new ResponseModel();
        model.setData(null);
        model.setCode(HttpStatus.BAD_REQUEST.value());
        model.setMsg(ex.getFieldError().getDefaultMessage());
        String classname = ex.getClass().getSimpleName();
        log.error("{} is occured, message is {}",classname, ex.getMessage());
        return model;
    }

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        NoWrapper annotation = methodParameter.getMethod().getAnnotation(NoWrapper.class);
        if(annotation == null){
            ResponseModel model = new ResponseModel();
            model.setCode(200);
            model.setData(body);
            model.setMsg(null);
            return model;
        }
        return body;
    }
}
