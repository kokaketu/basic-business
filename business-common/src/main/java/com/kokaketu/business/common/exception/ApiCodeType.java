package com.kokaketu.business.common.exception;

/**
 * 异常类型
 *
 * @author admin
 */
public enum ApiCodeType {
    /**
     * 系统异常Code：显示系统异常
     */
    SYSTEM,
    /**
     * 用户异常Code：显示异常code上的msg信息
     */
    USER,
    /**
     * 自定义异常Code：需要传入自定义异常信息
     */
    CUSTOM,
    ;
}
