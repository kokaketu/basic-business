package com.kokaketu.business.common.exception;

import com.kokaketu.business.common.response.ApiErrorResponse;
import com.kokaketu.business.common.response.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.util.Set;


/**
 * 全局统一异常处理
 *
 * <p>如果需要自定义，继承此类，然后加注解@RestControllerAdvice</p>
 *
 * <p>如果不需要自定义，在启动类上增加 {@link EnableExceptionHandler} 注解</p>
 *
 * @author admin
 */
@Slf4j
public class ApiExceptionHandler {

    /**
     * 绑定异常
     */
    @ExceptionHandler(BindException.class)
    public ApiResponse<?> handleBindException(BindException e) {
        return ApiErrorResponse.error(ApiCode.A0400, e.getFieldError() != null ? e.getFieldError().getField() : "");
    }

    /**
     * 不支持Http媒体类型的异常
     */
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ApiResponse<?> handleHttpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException e) {
        return ApiErrorResponse.error(ApiCode.A0400, null, getExceptionDetail(e));
    }

    /**
     * 方法参数类型不匹配异常
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ApiResponse<?> handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e) {
        return ApiErrorResponse.error(ApiCode.A0400, null, getExceptionDetail(e));
    }

    /**
     * Http请求方法不支持异常
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ApiResponse<?> handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        return ApiErrorResponse.error(ApiCode.A0001, null, getExceptionDetail(e));
    }

    /**
     * Http消息不可读异常
     */
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ApiResponse<?> handleHttpMessageNotReadableException(HttpMessageNotReadableException e) {
        return ApiErrorResponse.error(ApiCode.A0400, null, getExceptionDetail(e));
    }

    /**
     * 缺少Servlet请求参数异常
     */
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ApiResponse<?> handMissingServletRequestParameterException(MissingServletRequestParameterException e) {
        return ApiErrorResponse.error(ApiCode.A0410, null, getExceptionDetail(e));
    }

    /**
     * Validation异常
     */
    @ExceptionHandler(ValidationException.class)
    public ApiResponse<?> handValidationException(ValidationException e) {
        return ApiErrorResponse.error(ApiCode.A0400, e.getMessage(), getExceptionDetail(e));
    }

    /**
     * ConstraintViolation异常
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public ApiResponse<?> handConstraintViolationException(ConstraintViolationException e) {
        Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
        return ApiErrorResponse.error(ApiCode.A0400, !(violations == null || violations.isEmpty()) ? violations.iterator().next().getMessage() : e.getMessage(), this.getExceptionDetail(e));
    }

    /**
     * 方法参数无效异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ApiResponse<?> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        FieldError fieldError = e.getBindingResult().getFieldError();
        if (fieldError != null) {
            return ApiErrorResponse.error(ApiCode.A0400, fieldError.getDefaultMessage(), e.getMessage());
        }
        return ApiErrorResponse.error(ApiCode.A0400, null, getExceptionDetail(e));
    }

    /**
     * 最大上传大小超出异常
     */
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public ApiResponse<?> handleMaxUploadSizeExceededException(MaxUploadSizeExceededException e) {
        return ApiErrorResponse.error(ApiCode.A0702, "您上传的文件超过最大限制", getExceptionDetail(e));
    }

    /**
     * 自定义异常
     */
    @ExceptionHandler(ApiException.class)
    public ApiResponse<?> handleApiException(HttpServletRequest request, ApiException e) {
        switch (e.getCode().getType()) {
            case SYSTEM:
                log.error("系统异常: {}，URL：{}", e.getMessage(), request.getRequestURI(), e);
                return ApiErrorResponse.error(e.getCode(), null, getExceptionDetail(e));
            case USER:
                log.warn("业务异常: {}，URL：{}", e.getMessage(), request.getRequestURI());
                return ApiErrorResponse.error(e.getCode(), e.getCode().getMsg(e.getParam()), getExceptionDetail(e));
            case CUSTOM:
                log.warn("业务异常: {}，URL：{}", e.getMessage(), request.getRequestURI());
                return ApiErrorResponse.error(e.getCode(),
                        e.getParam() != null && e.getParam().length > 0 && e.getParam()[0] != null ? e.getParam()[0].toString() : null,
                        getExceptionDetail(e));
            default:
                log.error("其它异常: {}，URL：{}", e.getMessage(), request.getRequestURI(), e);
                return ApiErrorResponse.error(e.getCode(), null, getExceptionDetail(e));
        }
    }

    @ExceptionHandler(ServiceException.class)
    public ApiResponse<?> handleServiceException(ServiceException e) {
        return ApiErrorResponse.error(ApiCode.A0400, e.getMessage(), this.getExceptionDetail(e));
    }

    /**
     * 其它异常
     */
    @ExceptionHandler(Exception.class)
    public ApiResponse<?> handleException(HttpServletRequest request, Exception e) {
        log.error("系统异常：{}，URL：{}", e.getMessage(), request.getRequestURI(), e);
        return ApiErrorResponse.error(ApiCode.A0001, null, getExceptionDetail(e));
    }

    /**
     * 远程服务异常
     */
    @ExceptionHandler(CloudException.class)
    public ApiResponse<?> handleCloudException(HttpServletRequest request, CloudException e) {
        log.error("远程服务异常：{}，URL：{}", e.getMessage(), request.getRequestURI(), e);
        return ApiErrorResponse.error(e.getCode(), e.getMsg(), getExceptionDetail(e));
    }

    public String getExceptionDetail(Exception e) {

        StackTraceElement[] stackTrace = e.getStackTrace();
        if (stackTrace != null && stackTrace.length > 0) {
            StringBuilder detail = new StringBuilder();
            // 取3行
            detail.append(e.getMessage());
            for (int i = 0; i < 3 && i < stackTrace.length; i++) {
                detail.append(", ").append(stackTrace[i].toString());
            }
            return detail.toString();
        } else {
            return e.getMessage();
        }
    }
}
