package com.chamc.process.utils.interceptor;

import java.lang.annotation.*;

@Documented
@Inherited
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface NoWrapper {
}
