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

INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (1, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (2, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (3, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (4, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (5, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (6, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (7, 0, '2020-12-02 10:16:58', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (8, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (9, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (10, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (11, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (12, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (13, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (14, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (15, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (16, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (17, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (18, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (19, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (20, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (21, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (22, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (23, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (24, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (25, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (26, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (27, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (28, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (29, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (30, 0, '2020-12-02 10:16:59', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (31, 0, '2020-12-02 10:17:00', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (32, 0, '2020-12-02 10:17:00', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (33, 0, '2020-12-02 10:17:00', 'admin', '管理员
INSERT INTO bcesdb.geo_province (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, province_name, province_code) VALUES (34, 0, '2020-12-02 10:17:00', 'admin', '管理员