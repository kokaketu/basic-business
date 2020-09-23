package com.kokaketu.bces.common.constant;

/**
 * 常量
 */
public class Constant {
    /**
     * 成功
     */
    public static final int SUCCESS = 1;
    /**
     * 失败
     */
    public static final int FAIL = 0;
    /**
     * OK
     */
    public static final String OK = "OK";
    /**
     * 用户标识
     */
    public static final String USER_KEY = "userId";
    /**
     * 菜单根节点标识
     */
    public static final Long MENU_ROOT = 0L;
    /**
     * 部门根节点标识
     */
    public static final Long DEPT_ROOT = 0L;
    /**
     * 数据字典根节点标识
     */
    public static final Long DICT_ROOT = 0L;
    /**
     * 升序
     */
    public static final String ASC = "asc";
    /**
     * 降序
     */
    public static final String DESC = "desc";
    /**
     * 创建时间字段名
     */
    public static final String CREATED_DATE = "created_date";
    public static final String CREATE_TIME = "created_date";

    /**
     * 更新时间字段名
     */
    public static final String UPDATED_DATE = "updated_date";
    public static final String UPDATE_TIME = "updated_date";

    /**
     * 创建时间字段名
     */
    public static final String ID = "id";

    /**
     * 数据权限过滤
     */
    public static final String SQL_FILTER = "sqlFilter";

    /**
     * 当前页码
     */
    public static final String PAGE = "page";
    /**
     * 每页显示记录数
     */
    public static final String LIMIT = "limit";
    /**
     * 排序字段
     */
    public static final String ORDER_FIELD = "orderField";
    /**
     * 排序方式
     */
    public static final String ORDER = "order";
    /**
     * token header
     */
    public static final String TOKEN_HEADER = "token";
    /**
     * token过期
     */
    public static final String TOKEN_EXPIRE = "expire";
    /**
     * 云存储配置KEY
     */
    public static final String CLOUD_STORAGE_CONFIG_KEY = "CLOUD_STORAGE_CONFIG_KEY";
    /**
     * 短信配置KEY
     */
    public static final String SMS_CONFIG_KEY = "SMS_CONFIG_KEY";
    /**
     * 邮件配置KEY
     */
    public static final String MAIL_CONFIG_KEY = "MAIL_CONFIG_KEY";

    /**
     * 按用户推送消息
     */
    public static final String PUSH_USER_MESSAGE_KEY = "PUSH_USER_MESSAGE_KEY";

    /**
     * 移动端或pc端登陆
     */
    public static final String APP_OR_PC_LOGIN = "APP_OR_PC_LOGIN";
    public static final String IMPORTLOG = "import_log_";

    /**
     * 默认文件类型
     */
    public static final String DEFAULT_FILE_TYPE = ".jpg.jpeg.png.gif.svg.bmp.psd.dwg.doc.docx.txt.rtf.pdf.wma.wav.avi.rar.gz.zip.xlsx.xls.xltx.xltm.csv.ppt.pptx.ppt.pptx.html";

    /**
     * 定时任务状态
     */
    public enum ScheduleStatus {
        /**
         * 暂停
         */
        PAUSE(0),
        /**
         * 正常
         */
        NORMAL(1);

        private int value;

        ScheduleStatus(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    /**
     * 云服务商
     */
    public enum CloudService {
        /**
         * 云
         */
        QINIU(1),
        /**
         * 阿里云
         */
        ALIYUN(2),
        /**
         * 腾讯云
         */
        QCLOUD(3),
        /**
         * FASTDFS
         */
        FASTDFS(4),
        /**
         * 本地
         */
        LOCAL(5);

        private int value;

        CloudService(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }


    /**
     * 短信服务商
     */
    public enum SmsService {
        /**
         * 阿里云
         */
        ALIYUN(1),
        /**
         * 腾讯云
         */
        QCLOUD(2),
        /**
         * 希奥
         */
        XIAO(3),
        /**
         * 太保
         */
        TAIBAO(4);

        private int value;

        SmsService(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    /**
     * 文件上传目录
     */
    public enum UPLOAD_PATH {
        ORG("/org/"),

        MEMBER("/member/"),

        CMS("/cms/");


        private String value;

        UPLOAD_PATH(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    /**
     * 文件上传目录
     */
    public enum EXCEL {
        XLS("xls"),

        XLSX("xlsx");

        private String value;

        EXCEL(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }
}