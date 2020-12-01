package com.kokaketu.business.common.exception;

import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 自动配置
 *
 * @author admin
 */
public class AutoConfiguration {

    @RestControllerAdvice
    private interface IAutoExceptionHandler {

    }

    private static class AutoExceptionHandler extends ApiExceptionHandler implements IAutoExceptionHandler {

    }

    @Bean
    public Object autoExceptionHandler() {
        return new AutoExceptionHandler();
    }
}
