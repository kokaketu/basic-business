package com.kokaketu.business.common.exception;

public class ServiceException extends RuntimeException {

    public ServiceException(String errorMessage) {
        super(errorMessage);
    }

}
