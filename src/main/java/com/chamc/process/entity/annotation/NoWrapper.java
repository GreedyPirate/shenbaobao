package com.chamc.process.entity.annotation;

import java.lang.annotation.*;

/**
 * 不需要保证返回体，用于下载
 */
@Documented
@Inherited
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface NoWrapper {
}
