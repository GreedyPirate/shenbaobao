package com.chamc.process.utils.interceptor;

import java.lang.annotation.*;

/**
 * 不需要检查是否已登陆
 */
@Documented
@Inherited
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface FreeAction {
}
