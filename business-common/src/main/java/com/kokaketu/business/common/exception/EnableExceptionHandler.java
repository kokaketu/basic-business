package com.kokaketu.business.common.exception;

import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * 开启默认的异常拦截功能
 * <p>
 * 如果需要自定义异常拦截，不要使用此接口，参考{@link ApiExceptionHandler}
 *
 * @author xuyang
 */
@SuppressWarnings("unused")
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
@Documented
@Import(AutoConfiguration.class)
public @interface EnableExceptionHandler {

}
