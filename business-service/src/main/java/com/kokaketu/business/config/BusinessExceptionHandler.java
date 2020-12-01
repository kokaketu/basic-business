package com.kokaketu.business.config;

import com.kokaketu.business.common.exception.ApiExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @Description 异常捕捉handler
 * @Author admin
 * @Date 2020/11/26 4:19 下午
 */
@RestControllerAdvice
public class BusinessExceptionHandler extends ApiExceptionHandler {
}
