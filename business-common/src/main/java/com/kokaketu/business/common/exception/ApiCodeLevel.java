package com.kokaketu.business.common.exception;


/**
 * @author admin
 */
public enum ApiCodeLevel {
    /**
     * A：错误来源于用户
     */
    A,
    /**
     * B：错误来源于当前系统
     */
    B,
    /**
     * C：错误来源于第三方服务
     */
    C
}
