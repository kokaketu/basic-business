package com.kokaketu.business.common.response;

import com.kokaketu.business.common.constant.ErrorConstant;
import lombok.Getter;
import lombok.NoArgsConstructor;


/**
 * 统一返回
 *
 * @author admin
 */
@SuppressWarnings("unused")
@Getter
@NoArgsConstructor
public class ApiResponse<T> {

    protected String responseCode;
    protected String responseMsg;
    protected T data;

    protected ApiResponse(String code, String msg, T data) {
        this.responseCode = code;
        this.responseMsg = msg;
        this.data = data;
    }

    public static <T> ApiResponse<T> success(String msg, T data) {
        return new ApiResponse<>(ErrorConstant.SUCCESS_CODE, msg, data);
    }

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(ErrorConstant.SUCCESS_CODE, ErrorConstant.SUCCESS_MSG, data);
    }

    public static <T> ApiResponse<T> success() {
        return new ApiResponse<>(ErrorConstant.SUCCESS_CODE, ErrorConstant.SUCCESS_MSG, null);
    }

    public static <T> ApiResponse<T> error(String msg) {
        return new ApiResponse<>(ErrorConstant.ERROR_CODE, msg, null);
    }
}