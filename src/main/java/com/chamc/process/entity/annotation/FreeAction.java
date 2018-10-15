package com.chamc.process.entity.annotation;

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
