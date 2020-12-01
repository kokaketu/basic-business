package com.kokaketu.business.common.exception;


/**
 * 阿里规范宏观异常码，desc是异常码的说明，使用前需阅读阿里规范
 *
 * @author admin
 */
@SuppressWarnings("unused")
public enum ApiCode implements IApiCode {
    /**
     * A：错误来源于用户
     */
    A0001(ApiCodeLevel.A, "用户端错误"),

    A0100(ApiCodeLevel.A, "用户注册错误"),
    A0101(ApiCodeLevel.A, "用户未同意隐私协议"),
    A0102(ApiCodeLevel.A, "注册国家或地区受限"),
    A0110(ApiCodeLevel.A, "用户名校验失败"),
    A0111(ApiCodeLevel.A, "用户名已存在"),
    A0112(ApiCodeLevel.A, "用户名包含敏感词"),
    A0113(ApiCodeLevel.A, "用户名包含特殊字符"),
    A0120(ApiCodeLevel.A, "密码校验失败"),
    A0121(ApiCodeLevel.A, "密码长度不够"),
    A0122(ApiCodeLevel.A, "密码强度不够"),
    A0130(ApiCodeLevel.A, "校验码输入错误"),
    A0131(ApiCodeLevel.A, "短信校验码输入错误"),
    A0132(ApiCodeLevel.A, "邮件校验码输入错误"),
    A0133(ApiCodeLevel.A, "语音校验码输入错误"),
    A0140(ApiCodeLevel.A, "用户证件异常"),
    A0141(ApiCodeLevel.A, "用户证件类型未选择"),
    A0142(ApiCodeLevel.A, "大陆身份证编号校验非法"),
    A0143(ApiCodeLevel.A, "护照编号校验非法"),
    A0144(ApiCodeLevel.A, "军官证编号校验非法"),
    A0150(ApiCodeLevel.A, "用户基本信息校验失败"),
    A0151(ApiCodeLevel.A, "手机格式校验失败"),
    A0152(ApiCodeLevel.A, "地址格式校验失败"),
    A0153(ApiCodeLevel.A, "邮箱格式校验失败"),

    A0200(ApiCodeLevel.A, "用户登陆异常"),
    A0201(ApiCodeLevel.A, "用户账户不存在"),
    A0202(ApiCodeLevel.A, "用户账户被冻结"),
    A0203(ApiCodeLevel.A, "用户账户已作废"),
    A0210(ApiCodeLevel.A, "用户密码错误"),
    A0211(ApiCodeLevel.A, "用户输入密码次数超限"),
    A0220(ApiCodeLevel.A, "用户身份校验失败"),
    A0221(ApiCodeLevel.A, "用户指纹识别失败"),
    A0222(ApiCodeLevel.A, "用户面容识别失败"),
    A0223(ApiCodeLevel.A, "用户未获得第三方登陆授权"),
    A0230(ApiCodeLevel.A, "用户登陆已过期"),
    A0240(ApiCodeLevel.A, "用户验证码错误"),
    A0241(ApiCodeLevel.A, "用户验证码尝试次数超限"),

    A0300(ApiCodeLevel.A, "访问权限异常"),
    A0301(ApiCodeLevel.A, "访问未授权"),
    A0302(ApiCodeLevel.A, "正在授权中"),
    A0303(ApiCodeLevel.A, "用户授权申请被拒绝"),
    A0310(ApiCodeLevel.A, "因访问对象隐私设置被拦截"),
    A0311(ApiCodeLevel.A, "授权已过期"),
    A0312(ApiCodeLevel.A, "无权限使用API"),
    A0320(ApiCodeLevel.A, "用户访问被拦截"),
    A0321(ApiCodeLevel.A, "黑名单用户"),
    A0322(ApiCodeLevel.A, "账号被冻结"),
    A0323(ApiCodeLevel.A, "非法IP地址"),
    A0324(ApiCodeLevel.A, "网关访问受限"),
    A0325(ApiCodeLevel.A, "地域黑名单"),
    A0330(ApiCodeLevel.A, "服务已欠费"),
    A0340(ApiCodeLevel.A, "用户签名异常"),
    A0341(ApiCodeLevel.A, "RSA签名错误"),

    A0400(ApiCodeLevel.A, "用户请求参数错误"),
    A0401(ApiCodeLevel.A, "包含非法恶意跳转链接"),
    A0402(ApiCodeLevel.A, "无效的用户输入"),
    A0410(ApiCodeLevel.A, "请求必填参数为空"),
    A0411(ApiCodeLevel.A, "用户订单号为空"),
    A0412(ApiCodeLevel.A, "订购数量为空"),
    A0413(ApiCodeLevel.A, "缺少时间戳参数"),
    A0414(ApiCodeLevel.A, "非法的时间戳参数"),
    A0420(ApiCodeLevel.A, "请求参数值超出允许的范围"),
    A0421(ApiCodeLevel.A, "参数格式不匹配"),
    A0422(ApiCodeLevel.A, "地址不在服务范围"),
    A0423(ApiCodeLevel.A, "时间不在服务范围"),
    A0424(ApiCodeLevel.A, "金额超出限制"),
    A0425(ApiCodeLevel.A, "数量超出限制"),
    A0426(ApiCodeLevel.A, "请求批量处理总个数超出限制"),
    A0427(ApiCodeLevel.A, "请求JSON解析失败"),
    A0430(ApiCodeLevel.A, "用户输入内容非法"),
    A0431(ApiCodeLevel.A, "包含违禁敏感词"),
    A0432(ApiCodeLevel.A, "图片包含违禁信息"),
    A0433(ApiCodeLevel.A, "文件侵犯版权"),
    A0440(ApiCodeLevel.A, "用户操作异常"),
    A0441(ApiCodeLevel.A, "用户支付超时"),
    A0442(ApiCodeLevel.A, "确认订单超时"),
    A0443(ApiCodeLevel.A, "订单已关闭"),

    A0500(ApiCodeLevel.A, "用户请求服务异常"),
    A0501(ApiCodeLevel.A, "请求次数超出限制"),
    A0502(ApiCodeLevel.A, "请求并发数超出限制"),
    A0503(ApiCodeLevel.A, "用户操作请等待"),
    A0504(ApiCodeLevel.A, "WebSocket连接异常"),
    A0505(ApiCodeLevel.A, "WebSocket连接断开"),
    A0506(ApiCodeLevel.A, "用户重复请求"),

    A0600(ApiCodeLevel.A, "用户资源异常"),
    A0601(ApiCodeLevel.A, "账户余额不足"),
    A0602(ApiCodeLevel.A, "用户磁盘空间不足"),
    A0603(ApiCodeLevel.A, "用户内存空间不足"),
    A0604(ApiCodeLevel.A, "用户OSS容量不足"),
    A0605(ApiCodeLevel.A, "用户配额已用光"),

    A0700(ApiCodeLevel.A, "用户上传文件异常"),
    A0701(ApiCodeLevel.A, "用户上传文件类型不匹配"),
    A0702(ApiCodeLevel.A, "用户上传文件太大"),
    A0703(ApiCodeLevel.A, "用户上传图片太大"),
    A0704(ApiCodeLevel.A, "用户上传视频太大"),
    A0705(ApiCodeLevel.A, "用户上传压缩文件太大"),

    A0800(ApiCodeLevel.A, "用户当前版本异常"),
    A0801(ApiCodeLevel.A, "用户安装版本与系统不匹配"),
    A0802(ApiCodeLevel.A, "用户安装版本过低"),
    A0803(ApiCodeLevel.A, "用户安装版本过高"),
    A0804(ApiCodeLevel.A, "用户安装版本已过期"),
    A0805(ApiCodeLevel.A, "用户API请求版本不匹配"),
    A0806(ApiCodeLevel.A, "用户API请求版本过高"),
    A0807(ApiCodeLevel.A, "用户API请求版本过低"),

    A0900(ApiCodeLevel.A, "用户隐私未授权"),
    A0901(ApiCodeLevel.A, "用户隐私未签署"),
    A0902(ApiCodeLevel.A, "用户摄像头未授权"),
    A0903(ApiCodeLevel.A, "用户相机未授权"),
    A0904(ApiCodeLevel.A, "用户图片库未授权"),
    A0905(ApiCodeLevel.A, "用户文件未授权"),
    A0906(ApiCodeLevel.A, "用户位置信息未授权"),
    A0907(ApiCodeLevel.A, "用户通讯录未授权"),

    A1000(ApiCodeLevel.A, "用户设备异常"),
    A1001(ApiCodeLevel.A, "用户相机异常"),
    A1002(ApiCodeLevel.A, "用户麦克风异常"),
    A1003(ApiCodeLevel.A, "用户听筒异常"),
    A1004(ApiCodeLevel.A, "用户扬声器异常"),
    A1005(ApiCodeLevel.A, "用户GPS定位异常"),
    A2001(ApiCodeLevel.A, "用户数量超出当前组织授权数"),


    /**
     * B：错误来源于当前系统，
     */
    B0001(ApiCodeLevel.B, "系统执行出错"),

    B0100(ApiCodeLevel.B, "系统执行超时"),
    B0101(ApiCodeLevel.B, "系统订单处理超时"),

    B0200(ApiCodeLevel.B, "系统容灾功能被触发"),
    B0210(ApiCodeLevel.B, "系统限流"),
    B0220(ApiCodeLevel.B, "系统功能降级"),

    B0300(ApiCodeLevel.B, "系统资源异常"),
    B0310(ApiCodeLevel.B, "系统资源耗尽"),
    B0311(ApiCodeLevel.B, "系统磁盘空间耗尽"),
    B0312(ApiCodeLevel.B, "系统内存耗尽"),
    B0313(ApiCodeLevel.B, "文件句柄耗尽"),
    B0314(ApiCodeLevel.B, "系统连接池耗尽"),
    B0315(ApiCodeLevel.B, "系统线程池耗尽"),
    B0320(ApiCodeLevel.B, "系统资源访问异常"),
    B0321(ApiCodeLevel.B, "系统读取磁盘文件失败"),

    /**
     * C：错误来源于第三方服务，
     */
    C0001(ApiCodeLevel.C, "调用第三方服务出错"),

    C0100(ApiCodeLevel.C, "中间件服务出错"),
    C0110(ApiCodeLevel.C, "RPC服务出错"),
    C0111(ApiCodeLevel.C, "RPC服务未找到"),
    C0112(ApiCodeLevel.C, "RPC服务未注册"),
    C0113(ApiCodeLevel.C, "接口不存在"),
    C0120(ApiCodeLevel.C, "消息服务出错"),
    C0121(ApiCodeLevel.C, "消息投递出错"),
    C0122(ApiCodeLevel.C, "消息消费出错"),
    C0123(ApiCodeLevel.C, "消息订阅出错"),
    C0124(ApiCodeLevel.C, "消息分组未查到"),
    C0130(ApiCodeLevel.C, "缓存服务出错"),
    C0131(ApiCodeLevel.C, "key长度超过限制"),
    C0132(ApiCodeLevel.C, "value长度超过限制"),
    C0133(ApiCodeLevel.C, "存储容量已满"),
    C0134(ApiCodeLevel.C, "不支持的数据格式"),
    C0140(ApiCodeLevel.C, "配置服务出错"),
    C0150(ApiCodeLevel.C, "网络资源服务出错"),
    C0151(ApiCodeLevel.C, "VPN服务出错"),
    C0152(ApiCodeLevel.C, "CDN服务出错"),
    C0153(ApiCodeLevel.C, "域名解析服务出错"),
    C0154(ApiCodeLevel.C, "网关服务出错"),

    C0200(ApiCodeLevel.C, "第三方系统执行超时"),
    C0210(ApiCodeLevel.C, "RPC执行超时"),
    C0220(ApiCodeLevel.C, "消息投递超时"),
    C0230(ApiCodeLevel.C, "缓存服务超时"),
    C0240(ApiCodeLevel.C, "配置服务超时"),
    C0250(ApiCodeLevel.C, "数据库服务超时"),

    C0300(ApiCodeLevel.C, "数据库服务出错"),
    C0311(ApiCodeLevel.C, "表不存在"),
    C0312(ApiCodeLevel.C, "列不存在"),
    C0321(ApiCodeLevel.C, "多表关联中存在多个相同名称的列"),
    C0331(ApiCodeLevel.C, "数据库死锁"),
    C0341(ApiCodeLevel.C, "主键冲突"),

    C0400(ApiCodeLevel.C, "第三方容灾系统被触发"),
    C0401(ApiCodeLevel.C, "第三方系统限流"),
    C0402(ApiCodeLevel.C, "第三方功能降级"),

    C0500(ApiCodeLevel.C, "通知服务出错"),
    C0501(ApiCodeLevel.C, "短信提醒服务失败"),
    C0502(ApiCodeLevel.C, "语音提醒服务失败"),
    C0503(ApiCodeLevel.C, "邮件提醒服务失败"),

    ;

    private final ApiCodeLevel level;
    private final String desc;

    public ApiCodeLevel getLevel() {
        return level;
    }

    ApiCode(ApiCodeLevel level, String desc) {
        this.level = level;
        this.desc = desc;
    }

    public String code() {
        return this.name();
    }

    @Override
    public ApiCodeType getType() {
        return ApiCodeType.CUSTOM;
    }

    @Override
    public String getCode() {
        return name();
    }

    @Override
    public String getMsg() {
        return desc;
    }
}
