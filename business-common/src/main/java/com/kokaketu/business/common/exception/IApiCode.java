package com.kokaketu.business.common.exception;


import java.text.MessageFormat;

/**
 * 异常枚举接口，自定义的枚举需要实现此接口
 * <p>
 * code码规范
 * <p>
 * 示例：IMC0000，SIG0842
 * <p>
 * 说明：7位，前3位服务标识位，范围000-ZZZ，不足3位的用0补位；后4位编码位，编码位从0000开始，到Z999结束，第1位范围0-9-A-Z，剩余3位000-999，共36000个
 * <p>
 * 特殊code码
 * 000:成功，无前缀，定义在sdk-web包ResponseCode中
 * 999:失败，无前缀，定义在sdk-web包ResponseCode中
 * <p>
 * 服务标识：
 * BS:business-service
 * BW:business-web
 * <p>
 * 模块名各服务内部自行定义，建议多分几个模块便于区分
 *
 * @author admin
 */
public interface IApiCode {
    /**
     * 获取异常类型
     *
     * @return 异常类型
     */
    ApiCodeType getType();

    /**
     * 获取异常码
     *
     * @return 异常码
     */
    String getCode();

    /**
     * 获取异常信息
     *
     * @return 异常信息
     */
    String getMsg();


    /**
     * 获取格式化后的异常信息
     *
     * @param params 参数
     * @return 异常信息
     */
    default String getMsg(Object... params) {
        if (params == null) {
            return getMsg();
        }
        return MessageFormat.format(getMsg(), params);
    }

}
