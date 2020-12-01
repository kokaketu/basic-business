package com.kokaketu.business.common.exception;

import lombok.Getter;

/**
 * 远程服务异常
 * <p>
 * 与ApiException不同，它没有异常枚举，只有code和msg
 *
 * @author admin
 */
@Getter
public final class CloudException extends RuntimeException {

    private final String code;
    private final String msg;
    private final String detail;

    public CloudException(String code, String msg, String detail) {
        super(code + ":" + msg + ":" + detail);
        this.code = code;
        this.msg = msg;
        this.detail = detail;
    }

}
