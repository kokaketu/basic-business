package com.kokaketu.business.common.exception;

import lombok.Getter;

import java.util.Arrays;
import java.util.function.Supplier;

/**
 * 业务异常，此异常需配合阿里宏观异常码使用
 *
 * @author admin
 */
@SuppressWarnings("unused")
@Getter
public class ApiException extends RuntimeException {

    /**
     * 异常枚举
     */
    private final IApiCode code;

    /**
     * 异常信息参数
     */
    private final Object[] param;

    /**
     * 定义一个异常
     *
     * @param code   错误码
     * @param param  错误消息参数
     * @param detail 错误细节，用于开发排查问题
     * @param cause  异常栈
     */
    public ApiException(String detail, IApiCode code, Throwable cause, Object... param) {
        super(code + ":" + detail + ":" + cause.getMessage(), cause);
        this.code = code;
        this.param = param;
    }

    public ApiException(IApiCode code, Throwable cause, Object... param) {
        super(code + ":" + code.getMsg() + ":" + cause.getMessage(), cause);
        this.code = code;
        this.param = param;
    }

    public ApiException(String detail, IApiCode code, Object... param) {
        super(code + ":" + detail + ":" + code.getMsg() + Arrays.toString(param));
        this.code = code;
        this.param = param;
    }

    public ApiException(IApiCode code, Object... param) {
        super(code + ":" + code.getMsg() + Arrays.toString(param));
        this.code = code;
        this.param = param;
    }

    public ApiException(IApiCode code) {
        super(code + ":" + code.getMsg());
        this.code = code;
        this.param = null;
    }

    public static ApiException of(String detail, IApiCode code, Throwable cause, Object... param) {
        return new ApiException(detail, code, cause, param);
    }

    public static ApiException of(IApiCode code, Throwable cause, Object... param) {
        return new ApiException(code, cause, param);
    }

    public static ApiException of(String detail, IApiCode code, Object... param) {
        return new ApiException(detail, code, param);
    }

    public static ApiException of(ApiCode code, Object... param) {
        return new ApiException(code, param);
    }

    public static ApiException of(ApiCode code) {
        return new ApiException(code);
    }

    public static Supplier<ApiException> supply(String detail, IApiCode code, Throwable cause, Object... param) {
        return () -> new ApiException(detail, code, cause, param);
    }

    public static Supplier<ApiException> supply(IApiCode code, Throwable cause, Object... param) {
        return () -> new ApiException(code, cause, param);
    }

    public static Supplier<ApiException> supply(String detail, IApiCode code, Object... param) {
        return () -> new ApiException(detail, code, param);
    }

    public static Supplier<ApiException> supply(IApiCode code, Object... param) {
        return () -> new ApiException(code, param);
    }

    public static Supplier<ApiException> supply(IApiCode code) {
        return () -> new ApiException(code);
    }

}
