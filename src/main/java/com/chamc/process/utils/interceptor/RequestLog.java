package com.chamc.process.utils.interceptor;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.UUID;

@Aspect
@Slf4j
@Component
public class RequestLog {

    ThreadLocal<StopWatch> watchThreadLocal = new ThreadLocal<>();

    @Pointcut("(execution(* *..controller..*.*(..))) && (@within(org.springframework.web.bind.annotation.RestController))")
    public void express(){}

    @Before("express()")
    public void pre(JoinPoint joinPoint){
        StopWatch watch = new StopWatch(UUID.randomUUID().toString());
        watch.start("request log");
        watchThreadLocal.set(watch);


        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String url = request.getRequestURI();
        String method = request.getMethod();

        String remoteAddr = request.getRemoteAddr();
        log.info("Request begin: from {} url is {}, method is {}, params are {}",remoteAddr, url, method, Arrays.toString(joinPoint.getArgs()));
    }

    @AfterReturning(value = "express()", returning = "returnValue")
    public void post(JoinPoint joinPoint,Object returnValue){
        StopWatch stopWatch = watchThreadLocal.get();
        stopWatch.stop();
        log.info("request timing is \n{}",stopWatch.prettyPrint());

        log.info("Response is {}", JSONObject.toJSONString(returnValue));
    }

}
