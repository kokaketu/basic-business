package com.kokaketu.business.common.response;

import com.kokaketu.business.common.constant.ErrorConstant;
import com.kokaketu.business.common.exception.ApiCode;
import com.kokaketu.business.common.exception.IApiCode;
import lombok.Getter;

/**
 * @Description 统一错误返回
 * @Author admin
 * @Date 2020/11/26 4:15 下午
 */
@Getter
public final class ApiErrorResponse<T> extends ApiResponse<T> {

    private final String detail;


    private ApiErrorResponse(String code, String msg, String detail) {
        super(code, msg, null);
        this.detail = detail;
    }

    public static <T> ApiResponse<T> error(String msg) {
        return error(ApiCode.A0001, msg, null);
    }

    public static <T> ApiResponse<T> error(IApiCode code, String msg) {
        return error(code, msg, null);
    }

    public static <T> ApiResponse<T> error(String code, String msg, String detail) {
        return new ApiErrorResponse<>(code, msg, detail);
    }

    public static <T> ApiResponse<T> error(IApiCode code, String msg, String detail) {
        return new ApiErrorResponse<>(code.getCode(), msg == null ? ErrorConstant.ERROR_MSG : msg, detail);
    }

}