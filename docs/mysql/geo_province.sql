create table geo_province
(
    id            bigint auto_increment comment '主键id'
        primary key,
    is_del        tinyint  default 0                 not null comment '是否逻辑删除:0.否 1.是',
    created_date  datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    created_by    varchar(32)                        not null comment '创建者code',
    created_name  varchar(32)                        not null comment '创建者名称',
    updated_date  datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    updated_by    varchar(32)                        not null comment '更新者code',
    updated_name  varchar(32)                        not null comment '更新者名称',
    province_name varchar(32)                        not null comment '省名称',
    province_code varchar(32)                        not null comment '省adCode',
    constraint province_uk
        unique (province_code)
)
    comment '省份表' charset = utf8mb4;

INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (1, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '北京市', '110000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (2, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '天津市', '120000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (3, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '河北省', '130000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (4, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '山西省', '140000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (5, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '内蒙古自治区', '150000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (6, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '辽宁省', '210000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (7, 0, '2020-12-02 10:16:58', 'admin', '管理员', '2020-12-02 10:16:58', 'admin', '管理员', '吉林省', '220000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (8, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '黑龙江省', '230000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (9, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '上海市', '310000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (10, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '江苏省', '320000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (11, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '浙江省', '330000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (12, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '安徽省', '340000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (13, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '福建省', '350000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (14, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '江西省', '360000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (15, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '山东省', '370000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (16, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '河南省', '410000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (17, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '湖北省', '420000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (18, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '湖南省', '430000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (19, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '广东省', '440000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (20, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '广西壮族自治区', '450000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (21, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '海南省', '460000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (22, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '重庆市', '500000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (23, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '四川省', '510000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (24, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '贵州省', '520000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (25, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '云南省', '530000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (26, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '西藏自治区', '540000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (27, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '陕西省', '610000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (28, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '甘肃省', '620000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (29, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '青海省', '630000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (30, 0, '2020-12-02 10:16:59', 'admin', '管理员', '2020-12-02 10:16:59', 'admin', '管理员', '宁夏回族自治区', '640000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (31, 0, '2020-12-02 10:17:00', 'admin', '管理员', '2020-12-02 10:17:00', 'admin', '管理员', '新疆维吾尔自治区', '650000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (32, 0, '2020-12-02 10:17:00', 'admin', '管理员', '2020-12-02 10:17:00', 'admin', '管理员', '台湾省', '710000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (33, 0, '2020-12-02 10:17:00', 'admin', '管理员', '2020-12-02 10:17:00', 'admin', '管理员', '香港特别行政区', '810000');
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (34, 0, '2020-12-02 10:17:00', 'admin', '管理员', '2020-12-02 10:17:00', 'admin', '管理员', '澳门特别行政区', '820000');