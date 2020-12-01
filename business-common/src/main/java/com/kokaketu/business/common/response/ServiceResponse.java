package com.kokaketu.business.common.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kokaketu.business.common.constant.ErrorConstant;
import com.kokaketu.business.common.exception.ApiCode;
import com.kokaketu.business.common.exception.ApiException;
import com.kokaketu.business.common.exception.CloudException;
import lombok.Getter;

import java.util.Optional;

/**
 * @Description 统一返回
 * @Author admin
 * @Date 2020/11/26 4:17 下午
 */
@SuppressWarnings("unused")
@Getter
public class ServiceResponse<T> extends ApiResponse<T> {

    private String detail;

    @JsonIgnore
    public boolean isSuccess() {
        return ErrorConstant.SUCCESS_CODE.equals(responseCode);
    }

    public Optional<T> parse() {
        if (!isSuccess()) {
            throw new CloudException(responseCode, responseMsg, detail);
        }
        return Optional.ofNullable(data);
    }

    public T parseOrElseNull() {
        return parse().orElse(null);
    }

    public T parseOrElseThrow(ApiCode apiCode, String msg) {
        return parse().orElseThrow(() -> new ApiException(apiCode, msg));
    }

    public T parseOrElseThrow() {
        return parse().orElseThrow(() -> new ApiException(ApiCode.A0001));
    }

    public T parseOrElseThrow(String msg) {
        return parse().orElseThrow(() -> new ApiException(ApiCode.A0001, msg));
    }

    public T parseOrElse(T defaultValue) {
        return parse().orElse(defaultValue);
    }

}