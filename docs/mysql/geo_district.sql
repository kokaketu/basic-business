create table geo_district
(
    id            bigint auto_increment comment '主键id'
        primary key,
    is_del        tinyint  default 0                 not null comment '是否逻辑删除:0.否 1.是',
    created_date  datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    created_by    varchar(32)                        null comment '创建者code',
    created_name  varchar(32)                        not null comment '创建者名称',
    updated_date  datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    updated_by    varchar(32)                        not null comment '更新者code',
    updated_name  varchar(32)                        not null comment '更新者名称',
    city_code     varchar(32)                        not null comment '市adCode',
    district_name varchar(32)                        not null comment '区县名称',
    district_code varchar(32)                        not null comment '区县adCode'
)
    comment '区县表' charset = utf8mb4;

INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '东城区', '110101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '西城区', '110102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (3, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '朝阳区', '110105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (4, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '丰台区', '110106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (5, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '石景山区', '110107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (6, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '海淀区', '110108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (7, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '门头沟区', '110109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (8, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '房山区', '110111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (9, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '通州区', '110112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (10, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '顺义区', '110113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (11, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '昌平区', '110114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (12, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '大兴区', '110115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (13, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '怀柔区', '110116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (14, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '平谷区', '110117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (15, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '密云区', '110118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (16, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '110100', '延庆区', '110119
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (17, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '和平区', '120101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (18, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '河东区', '120102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (19, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '河西区', '120103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (20, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '南开区', '120104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (21, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '河北区', '120105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (22, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '红桥区', '120106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (23, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '东丽区', '120110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (24, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '西青区', '120111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (25, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '津南区', '120112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (26, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '北辰区', '120113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (27, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '武清区', '120114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (28, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '宝坻区', '120115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (29, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '滨海新区', '120116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (30, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '宁河区', '120117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (31, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '静海区', '120118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (32, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '120100', '蓟州区', '120119
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (33, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '长安区', '130102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (34, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '桥西区', '130104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (35, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '新华区', '130105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (36, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '井陉矿区', '130107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (37, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '裕华区', '130108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (38, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '藁城区', '130109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (39, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '鹿泉区', '130110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (40, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '栾城区', '130111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (41, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '井陉县', '130121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (42, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '正定县', '130123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (43, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '行唐县', '130125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (44, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '灵寿县', '130126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (45, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '高邑县', '130127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (46, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '深泽县', '130128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (47, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '赞皇县', '130129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (48, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '无极县', '130130
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (49, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '平山县', '130131
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (50, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '元氏县', '130132
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (51, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '赵县', '130133
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (52, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '辛集市', '130181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (53, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '晋州市', '130183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (54, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130100', '新乐市', '130184
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (55, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '路南区', '130202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (56, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '路北区', '130203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (57, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '古冶区', '130204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (58, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '开平区', '130205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (59, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '丰南区', '130207
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (60, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '丰润区', '130208
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (61, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '曹妃甸区', '130209
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (62, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '滦南县', '130224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (63, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '乐亭县', '130225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (64, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '迁西县', '130227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (65, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '玉田县', '130229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (66, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '遵化市', '130281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (67, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '迁安市', '130283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (68, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130200', '滦州市', '130284
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (69, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '海港区', '130302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (70, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '山海关区', '130303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (71, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '北戴河区', '130304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (72, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '抚宁区', '130306
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (73, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '青龙满族自治县', '130321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (74, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '昌黎县', '130322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (75, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130300', '卢龙县', '130324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (76, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '邯山区', '130402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (77, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '丛台区', '130403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (78, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '复兴区', '130404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (79, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '峰峰矿区', '130406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (80, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '肥乡区', '130407
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (81, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '永年区', '130408
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (82, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '临漳县', '130423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (83, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '成安县', '130424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (84, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '大名县', '130425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (85, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '涉县', '130426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (86, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '磁县', '130427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (87, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '邱县', '130430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (88, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '鸡泽县', '130431
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (89, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '广平县', '130432
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (90, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '馆陶县', '130433
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (91, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '魏县', '130434
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (92, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '曲周县', '130435
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (93, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130400', '武安市', '130481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (94, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '襄都区', '130502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (95, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '信都区', '130503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (96, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '任泽区', '130505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (97, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '南和区', '130506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (98, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '临城县', '130522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (99, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '内丘县', '130523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (100, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '柏乡县', '130524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (101, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '隆尧县', '130525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (102, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '宁晋县', '130528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (103, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '巨鹿县', '130529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (104, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '新河县', '130530
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (105, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '广宗县', '130531
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (106, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '平乡县', '130532
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (107, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '威县', '130533
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (108, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '清河县', '130534
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (109, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '临西县', '130535
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (110, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '南宫市', '130581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (111, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130500', '沙河市', '130582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (112, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '竞秀区', '130602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (113, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '莲池区', '130606
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (114, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '满城区', '130607
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (115, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '清苑区', '130608
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (116, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '徐水区', '130609
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (117, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '涞水县', '130623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (118, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '阜平县', '130624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (119, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '定兴县', '130626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (120, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '唐县', '130627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (121, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '高阳县', '130628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (122, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '容城县', '130629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (123, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '涞源县', '130630
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (124, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '望都县', '130631
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (125, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '安新县', '130632
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (126, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '易县', '130633
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (127, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '曲阳县', '130634
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (128, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '蠡县', '130635
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (129, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '顺平县', '130636
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (130, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '博野县', '130637
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (131, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '雄县', '130638
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (132, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '涿州市', '130681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (133, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '定州市', '130682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (134, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '安国市', '130683
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (135, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130600', '高碑店市', '130684
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (136, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '桥东区', '130702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (137, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '桥西区', '130703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (138, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '宣化区', '130705
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (139, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '下花园区', '130706
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (140, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '万全区', '130708
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (141, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '崇礼区', '130709
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (142, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '张北县', '130722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (143, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '康保县', '130723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (144, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '沽源县', '130724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (145, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '尚义县', '130725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (146, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '蔚县', '130726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (147, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '阳原县', '130727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (148, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '怀安县', '130728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (149, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '怀来县', '130730
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (150, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '涿鹿县', '130731
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (151, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130700', '赤城县', '130732
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (152, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '双桥区', '130802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (153, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '双滦区', '130803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (154, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '鹰手营子矿区', '130804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (155, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '承德县', '130821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (156, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '兴隆县', '130822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (157, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '滦平县', '130824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (158, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '隆化县', '130825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (159, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '丰宁满族自治县', '130826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (160, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '宽城满族自治县', '130827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (161, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '围场满族蒙古族自治县', '130828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (162, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130800', '平泉市', '130881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (163, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '新华区', '130902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (164, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '运河区', '130903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (165, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '沧县', '130921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (166, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '青县', '130922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (167, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '东光县', '130923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (168, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '海兴县', '130924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (169, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '盐山县', '130925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (170, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '肃宁县', '130926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (171, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '南皮县', '130927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (172, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '吴桥县', '130928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (173, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '献县', '130929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (174, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '孟村回族自治县', '130930
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (175, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '泊头市', '130981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (176, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '任丘市', '130982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (177, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '黄骅市', '130983
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (178, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '130900', '河间市', '130984
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (179, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '安次区', '131002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (180, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '广阳区', '131003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (181, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '固安县', '131022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (182, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '永清县', '131023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (183, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '香河县', '131024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (184, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '大城县', '131025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (185, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '文安县', '131026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (186, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '大厂回族自治县', '131028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (187, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '霸州市', '131081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (188, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131000', '三河市', '131082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (189, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '桃城区', '131102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (190, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '冀州区', '131103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (191, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '枣强县', '131121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (192, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '武邑县', '131122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (193, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '武强县', '131123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (194, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '饶阳县', '131124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (195, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '安平县', '131125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (196, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '故城县', '131126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (197, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '景县', '131127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (198, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '阜城县', '131128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (199, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '131100', '深州市', '131182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (200, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '小店区', '140105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (201, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '迎泽区', '140106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (202, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '杏花岭区', '140107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (203, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '尖草坪区', '140108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (204, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '万柏林区', '140109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (205, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '晋源区', '140110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (206, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '清徐县', '140121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (207, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '阳曲县', '140122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (208, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '娄烦县', '140123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (209, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140100', '古交市', '140181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (210, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '新荣区', '140212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (211, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '平城区', '140213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (212, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '云冈区', '140214
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (213, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '云州区', '140215
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (214, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '阳高县', '140221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (215, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '天镇县', '140222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (216, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '广灵县', '140223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (217, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '灵丘县', '140224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (218, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '浑源县', '140225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (219, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140200', '左云县', '140226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (220, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140300', '城区', '140302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (221, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140300', '矿区', '140303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (222, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140300', '郊区', '140311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (223, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140300', '平定县', '140321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (224, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140300', '盂县', '140322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (225, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '潞州区', '140403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (226, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '上党区', '140404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (227, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '屯留区', '140405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (228, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '潞城区', '140406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (229, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '襄垣县', '140423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (230, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '平顺县', '140425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (231, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '黎城县', '140426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (232, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '壶关县', '140427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (233, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '长子县', '140428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (234, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '武乡县', '140429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (235, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '沁县', '140430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (236, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140400', '沁源县', '140431
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (237, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '城区', '140502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (238, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '沁水县', '140521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (239, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '阳城县', '140522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (240, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '陵川县', '140524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (241, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '泽州县', '140525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (242, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140500', '高平市', '140581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (243, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '朔城区', '140602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (244, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '平鲁区', '140603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (245, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '山阴县', '140621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (246, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '应县', '140622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (247, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '右玉县', '140623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (248, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140600', '怀仁市', '140681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (249, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '榆次区', '140702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (250, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '太谷区', '140703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (251, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '榆社县', '140721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (252, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '左权县', '140722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (253, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '和顺县', '140723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (254, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '昔阳县', '140724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (255, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '寿阳县', '140725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (256, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '祁县', '140727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (257, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '平遥县', '140728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (258, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '灵石县', '140729
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (259, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140700', '介休市', '140781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (260, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '盐湖区', '140802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (261, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '临猗县', '140821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (262, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '万荣县', '140822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (263, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '闻喜县', '140823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (264, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '稷山县', '140824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (265, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '新绛县', '140825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (266, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '绛县', '140826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (267, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '垣曲县', '140827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (268, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '夏县', '140828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (269, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '平陆县', '140829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (270, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '芮城县', '140830
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (271, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '永济市', '140881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (272, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140800', '河津市', '140882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (273, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '忻府区', '140902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (274, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '定襄县', '140921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (275, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '五台县', '140922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (276, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '代县', '140923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (277, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '繁峙县', '140924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (278, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '宁武县', '140925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (279, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '静乐县', '140926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (280, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '神池县', '140927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (281, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '五寨县', '140928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (282, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '岢岚县', '140929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (283, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '河曲县', '140930
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (284, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '保德县', '140931
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (285, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '偏关县', '140932
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (286, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '140900', '原平市', '140981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (287, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '尧都区', '141002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (288, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '曲沃县', '141021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (289, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '翼城县', '141022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (290, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '襄汾县', '141023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (291, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '洪洞县', '141024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (292, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '古县', '141025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (293, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '安泽县', '141026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (294, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '浮山县', '141027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (295, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '吉县', '141028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (296, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '乡宁县', '141029
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (297, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '大宁县', '141030
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (298, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '隰县', '141031
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (299, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '永和县', '141032
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (300, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '蒲县', '141033
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (301, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '汾西县', '141034
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (302, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '侯马市', '141081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (303, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141000', '霍州市', '141082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (304, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '离石区', '141102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (305, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '文水县', '141121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (306, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '交城县', '141122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (307, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '兴县', '141123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (308, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '临县', '141124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (309, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '柳林县', '141125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (310, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '石楼县', '141126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (311, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '岚县', '141127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (312, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '方山县', '141128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (313, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '中阳县', '141129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (314, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '交口县', '141130
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (315, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '孝义市', '141181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (316, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '141100', '汾阳市', '141182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (317, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '新城区', '150102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (318, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '回民区', '150103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (319, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '玉泉区', '150104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (320, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '赛罕区', '150105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (321, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '土默特左旗', '150121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (322, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '托克托县', '150122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (323, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '和林格尔县', '150123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (324, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '清水河县', '150124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (325, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150100', '武川县', '150125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (326, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '东河区', '150202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (327, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '昆都仑区', '150203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (328, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '青山区', '150204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (329, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '石拐区', '150205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (330, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '白云鄂博矿区', '150206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (331, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '九原区', '150207
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (332, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '土默特右旗', '150221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (333, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '固阳县', '150222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (334, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150200', '达尔罕茂明安联合旗', '150223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (335, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150300', '海勃湾区', '150302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (336, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150300', '海南区', '150303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (337, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150300', '乌达区', '150304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (338, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '红山区', '150402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (339, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '元宝山区', '150403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (340, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '松山区', '150404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (341, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '阿鲁科尔沁旗', '150421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (342, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '巴林左旗', '150422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (343, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '巴林右旗', '150423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (344, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '林西县', '150424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (345, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '克什克腾旗', '150425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (346, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '翁牛特旗', '150426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (347, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '喀喇沁旗', '150428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (348, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '宁城县', '150429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (349, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150400', '敖汉旗', '150430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (350, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '科尔沁区', '150502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (351, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '科尔沁左翼中旗', '150521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (352, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '科尔沁左翼后旗', '150522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (353, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '开鲁县', '150523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (354, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '库伦旗', '150524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (355, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '奈曼旗', '150525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (356, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '扎鲁特旗', '150526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (357, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150500', '霍林郭勒市', '150581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (358, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '东胜区', '150602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (359, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '康巴什区', '150603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (360, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '达拉特旗', '150621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (361, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '准格尔旗', '150622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (362, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '鄂托克前旗', '150623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (363, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '鄂托克旗', '150624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (364, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '杭锦旗', '150625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (365, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '乌审旗', '150626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (366, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150600', '伊金霍洛旗', '150627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (367, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '海拉尔区', '150702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (368, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '扎赉诺尔区', '150703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (369, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '阿荣旗', '150721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (370, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '莫力达瓦达斡尔族自治旗', '150722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (371, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '鄂伦春自治旗', '150723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (372, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '鄂温克族自治旗', '150724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (373, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '陈巴尔虎旗', '150725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (374, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '新巴尔虎左旗', '150726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (375, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '新巴尔虎右旗', '150727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (376, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '满洲里市', '150781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (377, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '牙克石市', '150782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (378, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '扎兰屯市', '150783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (379, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '额尔古纳市', '150784
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (380, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150700', '根河市', '150785
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (381, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '临河区', '150802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (382, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '五原县', '150821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (383, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '磴口县', '150822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (384, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '乌拉特前旗', '150823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (385, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '乌拉特中旗', '150824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (386, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '乌拉特后旗', '150825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (387, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150800', '杭锦后旗', '150826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (388, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '集宁区', '150902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (389, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '卓资县', '150921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (390, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '化德县', '150922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (391, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '商都县', '150923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (392, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '兴和县', '150924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (393, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '凉城县', '150925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (394, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '察哈尔右翼前旗', '150926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (395, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '察哈尔右翼中旗', '150927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (396, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '察哈尔右翼后旗', '150928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (397, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '四子王旗', '150929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (398, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '150900', '丰镇市', '150981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (399, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '乌兰浩特市', '152201
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (400, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '阿尔山市', '152202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (401, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '科尔沁右翼前旗', '152221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (402, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '科尔沁右翼中旗', '152222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (403, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '扎赉特旗', '152223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (404, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152200', '突泉县', '152224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (405, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '二连浩特市', '152501
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (406, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '锡林浩特市', '152502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (407, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '阿巴嘎旗', '152522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (408, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '苏尼特左旗', '152523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (409, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '苏尼特右旗', '152524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (410, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '东乌珠穆沁旗', '152525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (411, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '西乌珠穆沁旗', '152526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (412, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '太仆寺旗', '152527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (413, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '镶黄旗', '152528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (414, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '正镶白旗', '152529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (415, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '正蓝旗', '152530
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (416, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152500', '多伦县', '152531
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (417, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152900', '阿拉善左旗', '152921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (418, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152900', '阿拉善右旗', '152922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (419, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '152900', '额济纳旗', '152923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (420, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '和平区', '210102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (421, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '沈河区', '210103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (422, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '大东区', '210104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (423, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '皇姑区', '210105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (424, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '铁西区', '210106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (425, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '苏家屯区', '210111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (426, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '浑南区', '210112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (427, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '沈北新区', '210113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (428, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '于洪区', '210114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (429, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '辽中区', '210115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (430, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '康平县', '210123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (431, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '法库县', '210124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (432, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210100', '新民市', '210181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (433, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '中山区', '210202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (434, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '西岗区', '210203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (435, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '沙河口区', '210204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (436, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '甘井子区', '210211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (437, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '旅顺口区', '210212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (438, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '金州区', '210213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (439, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '普兰店区', '210214
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (440, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '长海县', '210224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (441, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '瓦房店市', '210281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (442, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210200', '庄河市', '210283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (443, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '铁东区', '210302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (444, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '铁西区', '210303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (445, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '立山区', '210304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (446, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '千山区', '210311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (447, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '台安县', '210321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (448, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '岫岩满族自治县', '210323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (449, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210300', '海城市', '210381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (450, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '新抚区', '210402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (451, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '东洲区', '210403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (452, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '望花区', '210404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (453, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '顺城区', '210411
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (454, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '抚顺县', '210421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (455, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '新宾满族自治县', '210422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (456, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210400', '清原满族自治县', '210423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (457, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '平山区', '210502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (458, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '溪湖区', '210503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (459, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '明山区', '210504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (460, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '南芬区', '210505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (461, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '本溪满族自治县', '210521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (462, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210500', '桓仁满族自治县', '210522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (463, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '元宝区', '210602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (464, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '振兴区', '210603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (465, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '振安区', '210604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (466, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '宽甸满族自治县', '210624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (467, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '东港市', '210681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (468, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210600', '凤城市', '210682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (469, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '古塔区', '210702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (470, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '凌河区', '210703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (471, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '太和区', '210711
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (472, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '黑山县', '210726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (473, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '义县', '210727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (474, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '凌海市', '210781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (475, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210700', '北镇市', '210782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (476, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '站前区', '210802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (477, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '西市区', '210803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (478, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '鲅鱼圈区', '210804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (479, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '老边区', '210811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (480, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '盖州市', '210881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (481, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210800', '大石桥市', '210882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (482, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '海州区', '210902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (483, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '新邱区', '210903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (484, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '太平区', '210904
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (485, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '清河门区', '210905
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (486, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '细河区', '210911
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (487, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '阜新蒙古族自治县', '210921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (488, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '210900', '彰武县', '210922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (489, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '白塔区', '211002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (490, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '文圣区', '211003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (491, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '宏伟区', '211004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (492, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '弓长岭区', '211005
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (493, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '太子河区', '211011
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (494, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '辽阳县', '211021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (495, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211000', '灯塔市', '211081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (496, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211100', '双台子区', '211102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (497, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211100', '兴隆台区', '211103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (498, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211100', '大洼区', '211104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (499, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211100', '盘山县', '211122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (500, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '银州区', '211202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (501, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '清河区', '211204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (502, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '铁岭县', '211221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (503, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '西丰县', '211223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (504, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '昌图县', '211224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (505, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '调兵山市', '211281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (506, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211200', '开原市', '211282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (507, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '双塔区', '211302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (508, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '龙城区', '211303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (509, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '朝阳县', '211321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (510, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '建平县', '211322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (511, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '喀喇沁左翼蒙古族自治县', '211324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (512, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '北票市', '211381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (513, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211300', '凌源市', '211382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (514, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '连山区', '211402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (515, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '龙港区', '211403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (516, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '南票区', '211404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (517, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '绥中县', '211421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (518, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '建昌县', '211422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (519, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '211400', '兴城市', '211481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (520, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '南关区', '220102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (521, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '宽城区', '220103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (522, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '朝阳区', '220104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (523, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '二道区', '220105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (524, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '绿园区', '220106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (525, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '双阳区', '220112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (526, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '九台区', '220113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (527, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '农安县', '220122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (528, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '榆树市', '220182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (529, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '德惠市', '220183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (530, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220100', '公主岭市', '220184
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (531, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '昌邑区', '220202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (532, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '龙潭区', '220203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (533, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '船营区', '220204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (534, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '丰满区', '220211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (535, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '永吉县', '220221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (536, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '蛟河市', '220281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (537, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '桦甸市', '220282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (538, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '舒兰市', '220283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (539, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220200', '磐石市', '220284
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (540, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220300', '铁西区', '220302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (541, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220300', '铁东区', '220303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (542, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220300', '梨树县', '220322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (543, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220300', '伊通满族自治县', '220323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (544, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220300', '双辽市', '220382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (545, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220400', '龙山区', '220402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (546, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220400', '西安区', '220403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (547, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220400', '东丰县', '220421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (548, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220400', '东辽县', '220422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (549, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '东昌区', '220502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (550, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '二道江区', '220503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (551, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '通化县', '220521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (552, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '辉南县', '220523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (553, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '柳河县', '220524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (554, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '梅河口市', '220581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (555, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220500', '集安市', '220582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (556, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '浑江区', '220602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (557, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '江源区', '220605
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (558, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '抚松县', '220621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (559, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '靖宇县', '220622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (560, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '长白朝鲜族自治县', '220623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (561, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220600', '临江市', '220681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (562, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220700', '宁江区', '220702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (563, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220700', '前郭尔罗斯蒙古族自治县', '220721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (564, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220700', '长岭县', '220722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (565, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220700', '乾安县', '220723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (566, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220700', '扶余市', '220781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (567, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220800', '洮北区', '220802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (568, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220800', '镇赉县', '220821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (569, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220800', '通榆县', '220822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (570, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220800', '洮南市', '220881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (571, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '220800', '大安市', '220882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (572, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '延吉市', '222401
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (573, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '图们市', '222402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (574, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '敦化市', '222403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (575, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '珲春市', '222404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (576, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '龙井市', '222405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (577, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '和龙市', '222406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (578, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '汪清县', '222424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (579, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '222400', '安图县', '222426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (580, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '道里区', '230102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (581, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '南岗区', '230103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (582, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '道外区', '230104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (583, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '平房区', '230108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (584, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '松北区', '230109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (585, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '香坊区', '230110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (586, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '呼兰区', '230111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (587, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '阿城区', '230112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (588, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '双城区', '230113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (589, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '依兰县', '230123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (590, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '方正县', '230124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (591, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '宾县', '230125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (592, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '巴彦县', '230126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (593, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '木兰县', '230127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (594, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '通河县', '230128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (595, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '延寿县', '230129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (596, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '尚志市', '230183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (597, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230100', '五常市', '230184
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (598, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '龙沙区', '230202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (599, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '建华区', '230203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (600, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '铁锋区', '230204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (601, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '昂昂溪区', '230205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (602, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '富拉尔基区', '230206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (603, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '碾子山区', '230207
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (604, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '梅里斯达斡尔族区', '230208
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (605, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '龙江县', '230221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (606, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '依安县', '230223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (607, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '泰来县', '230224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (608, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '甘南县', '230225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (609, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '富裕县', '230227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (610, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '克山县', '230229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (611, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '克东县', '230230
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (612, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '拜泉县', '230231
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (613, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230200', '讷河市', '230281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (614, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '鸡冠区', '230302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (615, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '恒山区', '230303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (616, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '滴道区', '230304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (617, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '梨树区', '230305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (618, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '城子河区', '230306
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (619, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '麻山区', '230307
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (620, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '鸡东县', '230321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (621, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '虎林市', '230381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (622, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230300', '密山市', '230382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (623, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '向阳区', '230402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (624, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '工农区', '230403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (625, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '南山区', '230404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (626, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '兴安区', '230405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (627, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '东山区', '230406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (628, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '兴山区', '230407
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (629, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '萝北县', '230421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (630, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230400', '绥滨县', '230422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (631, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '尖山区', '230502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (632, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '岭东区', '230503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (633, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '四方台区', '230505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (634, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '宝山区', '230506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (635, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '集贤县', '230521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (636, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '友谊县', '230522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (637, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '宝清县', '230523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (638, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230500', '饶河县', '230524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (639, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '萨尔图区', '230602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (640, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '龙凤区', '230603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (641, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '让胡路区', '230604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (642, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '红岗区', '230605
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (643, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '大同区', '230606
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (644, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '肇州县', '230621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (645, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '肇源县', '230622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (646, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '林甸县', '230623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (647, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230600', '杜尔伯特蒙古族自治县', '230624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (648, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '伊美区', '230717
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (649, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '乌翠区', '230718
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (650, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '友好区', '230719
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (651, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '嘉荫县', '230722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (652, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '汤旺县', '230723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (653, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '丰林县', '230724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (654, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '大箐山县', '230725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (655, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '南岔县', '230726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (656, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '金林区', '230751
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (657, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230700', '铁力市', '230781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (658, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '向阳区', '230803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (659, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '前进区', '230804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (660, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '东风区', '230805
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (661, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '郊区', '230811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (662, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '桦南县', '230822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (663, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '桦川县', '230826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (664, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '汤原县', '230828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (665, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '同江市', '230881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (666, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '富锦市', '230882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (667, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230800', '抚远市', '230883
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (668, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230900', '新兴区', '230902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (669, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230900', '桃山区', '230903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (670, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230900', '茄子河区', '230904
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (671, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '230900', '勃利县', '230921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (672, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '东安区', '231002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (673, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '阳明区', '231003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (674, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '爱民区', '231004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (675, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '西安区', '231005
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (676, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '林口县', '231025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (677, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '绥芬河市', '231081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (678, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '海林市', '231083
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (679, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '宁安市', '231084
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (680, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '穆棱市', '231085
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (681, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231000', '东宁市', '231086
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (682, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '爱辉区', '231102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (683, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '逊克县', '231123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (684, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '孙吴县', '231124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (685, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '北安市', '231181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (686, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '五大连池市', '231182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (687, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231100', '嫩江市', '231183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (688, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '北林区', '231202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (689, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '望奎县', '231221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (690, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '兰西县', '231222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (691, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '青冈县', '231223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (692, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '庆安县', '231224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (693, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '明水县', '231225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (694, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '绥棱县', '231226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (695, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '安达市', '231281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (696, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '肇东市', '231282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (697, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '231200', '海伦市', '231283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (698, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '232700', '漠河市', '232701
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (699, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '232700', '呼玛县', '232721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (700, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '232700', '塔河县', '232722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (701, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '黄浦区', '310101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (702, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '徐汇区', '310104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (703, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '长宁区', '310105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (704, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '静安区', '310106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (705, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '普陀区', '310107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (706, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '虹口区', '310109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (707, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '杨浦区', '310110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (708, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '闵行区', '310112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (709, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '宝山区', '310113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (710, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '嘉定区', '310114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (711, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '浦东新区', '310115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (712, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '金山区', '310116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (713, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '松江区', '310117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (714, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '青浦区', '310118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (715, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '奉贤区', '310120
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (716, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '310100', '崇明区', '310151
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (717, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '玄武区', '320102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (718, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '秦淮区', '320104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (719, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '建邺区', '320105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (720, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '鼓楼区', '320106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (721, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '浦口区', '320111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (722, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '栖霞区', '320113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (723, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '雨花台区', '320114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (724, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '江宁区', '320115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (725, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '六合区', '320116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (726, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '溧水区', '320117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (727, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320100', '高淳区', '320118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (728, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '锡山区', '320205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (729, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '惠山区', '320206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (730, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '滨湖区', '320211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (731, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '梁溪区', '320213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (732, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '新吴区', '320214
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (733, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '江阴市', '320281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (734, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320200', '宜兴市', '320282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (735, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '鼓楼区', '320302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (736, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '云龙区', '320303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (737, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '贾汪区', '320305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (738, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '泉山区', '320311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (739, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '铜山区', '320312
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (740, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '丰县', '320321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (741, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '沛县', '320322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (742, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '睢宁县', '320324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (743, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '新沂市', '320381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (744, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320300', '邳州市', '320382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (745, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '天宁区', '320402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (746, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '钟楼区', '320404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (747, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '新北区', '320411
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (748, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '武进区', '320412
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (749, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '金坛区', '320413
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (750, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320400', '溧阳市', '320481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (751, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '虎丘区', '320505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (752, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '吴中区', '320506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (753, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '相城区', '320507
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (754, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '姑苏区', '320508
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (755, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '吴江区', '320509
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (756, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '常熟市', '320581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (757, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '张家港市', '320582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (758, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '昆山市', '320583
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (759, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320500', '太仓市', '320585
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (760, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '崇川区', '320602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (761, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '港闸区', '320611
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (762, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '通州区', '320612
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (763, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '如东县', '320623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (764, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '启东市', '320681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (765, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '如皋市', '320682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (766, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '海门市', '320684
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (767, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320600', '海安市', '320685
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (768, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '连云区', '320703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (769, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '海州区', '320706
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (770, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '赣榆区', '320707
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (771, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '东海县', '320722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (772, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '灌云县', '320723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (773, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320700', '灌南县', '320724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (774, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '淮安区', '320803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (775, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '淮阴区', '320804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (776, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '清江浦区', '320812
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (777, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '洪泽区', '320813
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (778, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '涟水县', '320826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (779, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '盱眙县', '320830
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (780, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320800', '金湖县', '320831
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (781, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '亭湖区', '320902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (782, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '盐都区', '320903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (783, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '大丰区', '320904
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (784, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '响水县', '320921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (785, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '滨海县', '320922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (786, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '阜宁县', '320923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (787, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '射阳县', '320924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (788, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '建湖县', '320925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (789, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '320900', '东台市', '320981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (790, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '广陵区', '321002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (791, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '邗江区', '321003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (792, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '江都区', '321012
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (793, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '宝应县', '321023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (794, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '仪征市', '321081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (795, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321000', '高邮市', '321084
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (796, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '京口区', '321102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (797, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '润州区', '321111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (798, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '丹徒区', '321112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (799, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '丹阳市', '321181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (800, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '扬中市', '321182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (801, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321100', '句容市', '321183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (802, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '海陵区', '321202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (803, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '高港区', '321203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (804, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '姜堰区', '321204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (805, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '兴化市', '321281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (806, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '靖江市', '321282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (807, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321200', '泰兴市', '321283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (808, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321300', '宿城区', '321302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (809, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321300', '宿豫区', '321311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (810, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321300', '沭阳县', '321322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (811, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321300', '泗阳县', '321323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (812, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '321300', '泗洪县', '321324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (813, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '上城区', '330102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (814, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '下城区', '330103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (815, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '江干区', '330104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (816, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '拱墅区', '330105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (817, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '西湖区', '330106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (818, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '滨江区', '330108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (819, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '萧山区', '330109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (820, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '余杭区', '330110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (821, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '富阳区', '330111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (822, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '临安区', '330112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (823, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '桐庐县', '330122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (824, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '淳安县', '330127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (825, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330100', '建德市', '330182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (826, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '海曙区', '330203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (827, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '江北区', '330205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (828, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '北仑区', '330206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (829, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '镇海区', '330211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (830, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '鄞州区', '330212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (831, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '奉化区', '330213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (832, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '象山县', '330225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (833, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '宁海县', '330226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (834, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '余姚市', '330281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (835, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330200', '慈溪市', '330282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (836, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '鹿城区', '330302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (837, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '龙湾区', '330303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (838, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '瓯海区', '330304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (839, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '洞头区', '330305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (840, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '永嘉县', '330324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (841, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '平阳县', '330326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (842, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '苍南县', '330327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (843, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '文成县', '330328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (844, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '泰顺县', '330329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (845, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '瑞安市', '330381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (846, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '乐清市', '330382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (847, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330300', '龙港市', '330383
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (848, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '南湖区', '330402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (849, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '秀洲区', '330411
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (850, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '嘉善县', '330421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (851, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '海盐县', '330424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (852, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '海宁市', '330481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (853, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '平湖市', '330482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (854, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330400', '桐乡市', '330483
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (855, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330500', '吴兴区', '330502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (856, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330500', '南浔区', '330503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (857, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330500', '德清县', '330521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (858, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330500', '长兴县', '330522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (859, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330500', '安吉县', '330523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (860, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '越城区', '330602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (861, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '柯桥区', '330603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (862, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '上虞区', '330604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (863, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '新昌县', '330624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (864, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '诸暨市', '330681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (865, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330600', '嵊州市', '330683
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (866, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '婺城区', '330702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (867, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '金东区', '330703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (868, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '武义县', '330723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (869, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '浦江县', '330726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (870, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '磐安县', '330727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (871, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '兰溪市', '330781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (872, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '义乌市', '330782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (873, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '东阳市', '330783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (874, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330700', '永康市', '330784
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (875, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '柯城区', '330802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (876, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '衢江区', '330803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (877, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '常山县', '330822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (878, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '开化县', '330824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (879, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '龙游县', '330825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (880, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330800', '江山市', '330881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (881, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330900', '定海区', '330902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (882, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330900', '普陀区', '330903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (883, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330900', '岱山县', '330921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (884, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '330900', '嵊泗县', '330922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (885, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '椒江区', '331002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (886, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '黄岩区', '331003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (887, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '路桥区', '331004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (888, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '三门县', '331022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (889, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '天台县', '331023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (890, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '仙居县', '331024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (891, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '温岭市', '331081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (892, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '临海市', '331082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (893, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331000', '玉环市', '331083
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (894, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '莲都区', '331102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (895, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '青田县', '331121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (896, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '缙云县', '331122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (897, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '遂昌县', '331123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (898, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '松阳县', '331124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (899, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '云和县', '331125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (900, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '庆元县', '331126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (901, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '景宁畲族自治县', '331127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (902, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '331100', '龙泉市', '331181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (903, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '瑶海区', '340102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (904, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '庐阳区', '340103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (905, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '蜀山区', '340104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (906, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '包河区', '340111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (907, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '长丰县', '340121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (908, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '肥东县', '340122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (909, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '肥西县', '340123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (910, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '庐江县', '340124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (911, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340100', '巢湖市', '340181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (912, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '镜湖区', '340202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (913, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '弋江区', '340203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (914, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '鸠江区', '340207
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (915, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '三山区', '340208
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (916, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '芜湖县', '340221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (917, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '繁昌县', '340222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (918, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '南陵县', '340223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (919, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340200', '无为市', '340281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (920, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '龙子湖区', '340302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (921, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '蚌山区', '340303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (922, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '禹会区', '340304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (923, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '淮上区', '340311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (924, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '怀远县', '340321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (925, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '五河县', '340322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (926, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340300', '固镇县', '340323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (927, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '大通区', '340402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (928, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '田家庵区', '340403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (929, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '谢家集区', '340404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (930, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '八公山区', '340405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (931, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '潘集区', '340406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (932, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '凤台县', '340421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (933, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340400', '寿县', '340422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (934, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '花山区', '340503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (935, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '雨山区', '340504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (936, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '博望区', '340506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (937, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '当涂县', '340521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (938, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '含山县', '340522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (939, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340500', '和县', '340523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (940, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340600', '杜集区', '340602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (941, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340600', '相山区', '340603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (942, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340600', '烈山区', '340604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (943, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340600', '濉溪县', '340621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (944, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340700', '铜官区', '340705
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (945, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340700', '义安区', '340706
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (946, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340700', '郊区', '340711
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (947, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340700', '枞阳县', '340722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (948, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '迎江区', '340802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (949, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '大观区', '340803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (950, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '宜秀区', '340811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (951, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '怀宁县', '340822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (952, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '太湖县', '340825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (953, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '宿松县', '340826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (954, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '望江县', '340827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (955, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '岳西县', '340828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (956, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '桐城市', '340881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (957, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '340800', '潜山市', '340882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (958, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '屯溪区', '341002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (959, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '黄山区', '341003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (960, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '徽州区', '341004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (961, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '歙县', '341021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (962, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '休宁县', '341022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (963, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '黟县', '341023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (964, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341000', '祁门县', '341024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (965, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '琅琊区', '341102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (966, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '南谯区', '341103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (967, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '来安县', '341122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (968, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '全椒县', '341124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (969, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '定远县', '341125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (970, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '凤阳县', '341126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (971, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '天长市', '341181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (972, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341100', '明光市', '341182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (973, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '颍州区', '341202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (974, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '颍东区', '341203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (975, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '颍泉区', '341204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (976, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '临泉县', '341221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (977, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '太和县', '341222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (978, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '阜南县', '341225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (979, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '颍上县', '341226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (980, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341200', '界首市', '341282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (981, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341300', '埇桥区', '341302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (982, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341300', '砀山县', '341321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (983, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341300', '萧县', '341322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (984, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341300', '灵璧县', '341323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (985, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341300', '泗县', '341324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (986, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '金安区', '341502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (987, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '裕安区', '341503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (988, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '叶集区', '341504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (989, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '霍邱县', '341522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (990, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '舒城县', '341523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (991, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '金寨县', '341524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (992, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341500', '霍山县', '341525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (993, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341600', '谯城区', '341602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (994, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341600', '涡阳县', '341621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (995, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341600', '蒙城县', '341622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (996, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341600', '利辛县', '341623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (997, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341700', '贵池区', '341702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (998, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341700', '东至县', '341721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (999, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341700', '石台县', '341722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1000, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341700', '青阳县', '341723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1001, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '宣州区', '341802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1002, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '郎溪县', '341821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1003, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '泾县', '341823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1004, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '绩溪县', '341824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1005, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '旌德县', '341825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1006, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '宁国市', '341881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1007, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '341800', '广德市', '341882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1008, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '鼓楼区', '350102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1009, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '台江区', '350103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1010, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '仓山区', '350104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1011, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '马尾区', '350105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1012, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '晋安区', '350111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1013, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '长乐区', '350112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1014, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '闽侯县', '350121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1015, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '连江县', '350122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1016, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '罗源县', '350123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1017, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '闽清县', '350124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1018, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '永泰县', '350125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1019, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '平潭县', '350128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1020, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350100', '福清市', '350181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1021, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '思明区', '350203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1022, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '海沧区', '350205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1023, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '湖里区', '350206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1024, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '集美区', '350211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1025, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '同安区', '350212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1026, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350200', '翔安区', '350213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1027, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350300', '城厢区', '350302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1028, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350300', '涵江区', '350303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1029, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350300', '荔城区', '350304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1030, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350300', '秀屿区', '350305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1031, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350300', '仙游县', '350322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1032, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '梅列区', '350402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1033, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '三元区', '350403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1034, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '明溪县', '350421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1035, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '清流县', '350423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1036, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '宁化县', '350424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1037, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '大田县', '350425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1038, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '尤溪县', '350426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1039, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '沙县', '350427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1040, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '将乐县', '350428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1041, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '泰宁县', '350429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1042, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '建宁县', '350430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1043, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350400', '永安市', '350481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1044, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '鲤城区', '350502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1045, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '丰泽区', '350503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1046, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '洛江区', '350504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1047, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '泉港区', '350505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1048, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '惠安县', '350521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1049, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '安溪县', '350524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1050, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '永春县', '350525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1051, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '德化县', '350526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1052, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '金门县', '350527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1053, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '石狮市', '350581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1054, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '晋江市', '350582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1055, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350500', '南安市', '350583
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1056, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '芗城区', '350602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1057, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '龙文区', '350603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1058, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '云霄县', '350622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1059, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '漳浦县', '350623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1060, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '诏安县', '350624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1061, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '长泰县', '350625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1062, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '东山县', '350626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1063, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '南靖县', '350627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1064, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '平和县', '350628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1065, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '华安县', '350629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1066, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350600', '龙海市', '350681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1067, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '延平区', '350702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1068, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '建阳区', '350703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1069, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '顺昌县', '350721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1070, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '浦城县', '350722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1071, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '光泽县', '350723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1072, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '松溪县', '350724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1073, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '政和县', '350725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1074, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '邵武市', '350781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1075, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '武夷山市', '350782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1076, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350700', '建瓯市', '350783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1077, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '新罗区', '350802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1078, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '永定区', '350803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1079, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '长汀县', '350821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1080, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '上杭县', '350823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1081, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '武平县', '350824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1082, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '连城县', '350825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1083, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350800', '漳平市', '350881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1084, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '蕉城区', '350902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1085, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '霞浦县', '350921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1086, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '古田县', '350922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1087, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '屏南县', '350923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1088, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '寿宁县', '350924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1089, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '周宁县', '350925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1090, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '柘荣县', '350926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1091, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '福安市', '350981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1092, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '350900', '福鼎市', '350982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1093, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '东湖区', '360102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1094, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '西湖区', '360103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1095, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '青云谱区', '360104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1096, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '青山湖区', '360111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1097, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '新建区', '360112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1098, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '红谷滩区', '360113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1099, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '南昌县', '360121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1100, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '安义县', '360123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1101, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360100', '进贤县', '360124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1102, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360200', '昌江区', '360202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1103, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360200', '珠山区', '360203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1104, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360200', '浮梁县', '360222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1105, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360200', '乐平市', '360281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1106, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360300', '安源区', '360302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1107, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360300', '湘东区', '360313
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1108, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360300', '莲花县', '360321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1109, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360300', '上栗县', '360322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1110, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360300', '芦溪县', '360323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1111, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '濂溪区', '360402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1112, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '浔阳区', '360403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1113, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '柴桑区', '360404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1114, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '武宁县', '360423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1115, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '修水县', '360424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1116, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '永修县', '360425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1117, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '德安县', '360426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1118, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '都昌县', '360428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1119, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '湖口县', '360429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1120, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '彭泽县', '360430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1121, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '瑞昌市', '360481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1122, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '共青城市', '360482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1123, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360400', '庐山市', '360483
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1124, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360500', '渝水区', '360502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1125, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360500', '分宜县', '360521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1126, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360600', '月湖区', '360602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1127, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360600', '余江区', '360603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1128, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360600', '贵溪市', '360681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1129, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '章贡区', '360702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1130, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '南康区', '360703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1131, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '赣县区', '360704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1132, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '信丰县', '360722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1133, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '大余县', '360723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1134, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '上犹县', '360724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1135, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '崇义县', '360725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1136, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '安远县', '360726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1137, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '定南县', '360728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1138, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '全南县', '360729
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1139, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '宁都县', '360730
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1140, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '于都县', '360731
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1141, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '兴国县', '360732
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1142, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '会昌县', '360733
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1143, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '寻乌县', '360734
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1144, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '石城县', '360735
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1145, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '瑞金市', '360781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1146, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360700', '龙南市', '360783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1147, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '吉州区', '360802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1148, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '青原区', '360803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1149, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '吉安县', '360821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1150, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '吉水县', '360822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1151, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '峡江县', '360823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1152, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '新干县', '360824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1153, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '永丰县', '360825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1154, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '泰和县', '360826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1155, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '遂川县', '360827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1156, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '万安县', '360828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1157, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '安福县', '360829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1158, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '永新县', '360830
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1159, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360800', '井冈山市', '360881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1160, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '袁州区', '360902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1161, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '奉新县', '360921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1162, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '万载县', '360922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1163, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '上高县', '360923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1164, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '宜丰县', '360924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1165, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '靖安县', '360925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1166, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '铜鼓县', '360926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1167, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '丰城市', '360981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1168, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '樟树市', '360982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1169, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '360900', '高安市', '360983
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1170, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '临川区', '361002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1171, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '东乡区', '361003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1172, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '南城县', '361021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1173, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '黎川县', '361022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1174, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '南丰县', '361023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1175, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '崇仁县', '361024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1176, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '乐安县', '361025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1177, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '宜黄县', '361026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1178, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '金溪县', '361027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1179, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '资溪县', '361028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1180, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361000', '广昌县', '361030
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1181, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '信州区', '361102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1182, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '广丰区', '361103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1183, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '广信区', '361104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1184, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '玉山县', '361123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1185, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '铅山县', '361124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1186, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '横峰县', '361125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1187, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '弋阳县', '361126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1188, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '余干县', '361127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1189, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '鄱阳县', '361128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1190, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '万年县', '361129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1191, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '婺源县', '361130
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1192, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '361100', '德兴市', '361181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1193, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '历下区', '370102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1194, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '市中区', '370103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1195, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '槐荫区', '370104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1196, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '天桥区', '370105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1197, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '历城区', '370112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1198, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '长清区', '370113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1199, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '章丘区', '370114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1200, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '济阳区', '370115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1201, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '莱芜区', '370116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1202, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '钢城区', '370117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1203, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '平阴县', '370124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1204, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370100', '商河县', '370126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1205, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '市南区', '370202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1206, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '市北区', '370203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1207, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '黄岛区', '370211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1208, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '崂山区', '370212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1209, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '李沧区', '370213
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1210, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '城阳区', '370214
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1211, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '即墨区', '370215
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1212, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '胶州市', '370281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1213, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '平度市', '370283
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1214, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370200', '莱西市', '370285
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1215, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '淄川区', '370302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1216, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '张店区', '370303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1217, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '博山区', '370304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1218, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '临淄区', '370305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1219, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '周村区', '370306
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1220, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '桓台县', '370321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1221, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '高青县', '370322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1222, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370300', '沂源县', '370323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1223, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '市中区', '370402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1224, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '薛城区', '370403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1225, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '峄城区', '370404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1226, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '台儿庄区', '370405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1227, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '山亭区', '370406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1228, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370400', '滕州市', '370481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1229, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370500', '东营区', '370502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1230, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370500', '河口区', '370503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1231, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370500', '垦利区', '370505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1232, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370500', '利津县', '370522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1233, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370500', '广饶县', '370523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1234, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '芝罘区', '370602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1235, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '福山区', '370611
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1236, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '牟平区', '370612
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1237, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '莱山区', '370613
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1238, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '蓬莱区', '370614
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1239, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '龙口市', '370681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1240, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '莱阳市', '370682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1241, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '莱州市', '370683
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1242, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '招远市', '370685
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1243, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '栖霞市', '370686
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1244, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370600', '海阳市', '370687
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1245, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '潍城区', '370702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1246, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '寒亭区', '370703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1247, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '坊子区', '370704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1248, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '奎文区', '370705
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1249, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '临朐县', '370724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1250, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '昌乐县', '370725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1251, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '青州市', '370781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1252, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '诸城市', '370782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1253, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '寿光市', '370783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1254, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '安丘市', '370784
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1255, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '高密市', '370785
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1256, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370700', '昌邑市', '370786
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1257, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '任城区', '370811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1258, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '兖州区', '370812
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1259, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '微山县', '370826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1260, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '鱼台县', '370827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1261, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '金乡县', '370828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1262, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '嘉祥县', '370829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1263, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '汶上县', '370830
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1264, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '泗水县', '370831
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1265, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '梁山县', '370832
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1266, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '曲阜市', '370881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1267, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370800', '邹城市', '370883
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1268, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '泰山区', '370902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1269, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '岱岳区', '370911
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1270, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '宁阳县', '370921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1271, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '东平县', '370923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1272, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '新泰市', '370982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1273, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '370900', '肥城市', '370983
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1274, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371000', '环翠区', '371002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1275, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371000', '文登区', '371003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1276, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371000', '荣成市', '371082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1277, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371000', '乳山市', '371083
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1278, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371100', '东港区', '371102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1279, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371100', '岚山区', '371103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1280, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371100', '五莲县', '371121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1281, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371100', '莒县', '371122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1282, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '兰山区', '371302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1283, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '罗庄区', '371311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1284, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '河东区', '371312
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1285, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '沂南县', '371321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1286, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '郯城县', '371322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1287, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '沂水县', '371323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1288, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '兰陵县', '371324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1289, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '费县', '371325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1290, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '平邑县', '371326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1291, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '莒南县', '371327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1292, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '蒙阴县', '371328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1293, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371300', '临沭县', '371329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1294, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '德城区', '371402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1295, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '陵城区', '371403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1296, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '宁津县', '371422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1297, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '庆云县', '371423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1298, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '临邑县', '371424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1299, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '齐河县', '371425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1300, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '平原县', '371426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1301, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '夏津县', '371427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1302, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '武城县', '371428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1303, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '乐陵市', '371481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1304, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371400', '禹城市', '371482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1305, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '东昌府区', '371502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1306, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '茌平区', '371503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1307, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '阳谷县', '371521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1308, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '莘县', '371522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1309, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '东阿县', '371524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1310, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '冠县', '371525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1311, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '高唐县', '371526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1312, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371500', '临清市', '371581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1313, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '滨城区', '371602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1314, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '沾化区', '371603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1315, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '惠民县', '371621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1316, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '阳信县', '371622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1317, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '无棣县', '371623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1318, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '博兴县', '371625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1319, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371600', '邹平市', '371681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1320, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '牡丹区', '371702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1321, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '定陶区', '371703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1322, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '曹县', '371721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1323, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '单县', '371722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1324, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '成武县', '371723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1325, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '巨野县', '371724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1326, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '郓城县', '371725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1327, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '鄄城县', '371726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1328, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '371700', '东明县', '371728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1329, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '中原区', '410102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1330, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '二七区', '410103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1331, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '管城回族区', '410104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1332, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '金水区', '410105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1333, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '上街区', '410106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1334, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '惠济区', '410108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1335, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '中牟县', '410122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1336, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '巩义市', '410181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1337, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '荥阳市', '410182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1338, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '新密市', '410183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1339, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '新郑市', '410184
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1340, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410100', '登封市', '410185
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1341, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '龙亭区', '410202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1342, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '顺河回族区', '410203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1343, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '鼓楼区', '410204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1344, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '禹王台区', '410205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1345, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '祥符区', '410212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1346, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '杞县', '410221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1347, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '通许县', '410222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1348, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '尉氏县', '410223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1349, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410200', '兰考县', '410225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1350, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '老城区', '410302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1351, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '西工区', '410303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1352, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '瀍河回族区', '410304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1353, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '涧西区', '410305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1354, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '吉利区', '410306
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1355, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '洛龙区', '410311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1356, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '孟津县', '410322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1357, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '新安县', '410323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1358, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '栾川县', '410324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1359, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '嵩县', '410325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1360, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '汝阳县', '410326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1361, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '宜阳县', '410327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1362, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '洛宁县', '410328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1363, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '伊川县', '410329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1364, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410300', '偃师市', '410381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1365, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '新华区', '410402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1366, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '卫东区', '410403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1367, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '石龙区', '410404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1368, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '湛河区', '410411
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1369, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '宝丰县', '410421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1370, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '叶县', '410422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1371, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '鲁山县', '410423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1372, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '郏县', '410425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1373, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '舞钢市', '410481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1374, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410400', '汝州市', '410482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1375, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '文峰区', '410502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1376, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '北关区', '410503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1377, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '殷都区', '410505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1378, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '龙安区', '410506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1379, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '安阳县', '410522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1380, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '汤阴县', '410523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1381, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '滑县', '410526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1382, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '内黄县', '410527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1383, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410500', '林州市', '410581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1384, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410600', '鹤山区', '410602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1385, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410600', '山城区', '410603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1386, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410600', '淇滨区', '410611
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1387, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410600', '浚县', '410621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1388, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410600', '淇县', '410622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1389, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '红旗区', '410702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1390, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '卫滨区', '410703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1391, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '凤泉区', '410704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1392, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '牧野区', '410711
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1393, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '新乡县', '410721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1394, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '获嘉县', '410724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1395, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '原阳县', '410725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1396, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '延津县', '410726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1397, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '封丘县', '410727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1398, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '卫辉市', '410781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1399, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '辉县市', '410782
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1400, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410700', '长垣市', '410783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1401, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '解放区', '410802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1402, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '中站区', '410803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1403, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '马村区', '410804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1404, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '山阳区', '410811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1405, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '修武县', '410821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1406, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '博爱县', '410822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1407, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '武陟县', '410823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1408, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '温县', '410825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1409, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '沁阳市', '410882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1410, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410800', '孟州市', '410883
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1411, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '华龙区', '410902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1412, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '清丰县', '410922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1413, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '南乐县', '410923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1414, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '范县', '410926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1415, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '台前县', '410927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1416, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '410900', '濮阳县', '410928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1417, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '魏都区', '411002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1418, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '建安区', '411003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1419, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '鄢陵县', '411024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1420, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '襄城县', '411025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1421, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '禹州市', '411081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1422, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411000', '长葛市', '411082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1423, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411100', '源汇区', '411102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1424, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411100', '郾城区', '411103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1425, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411100', '召陵区', '411104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1426, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411100', '舞阳县', '411121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1427, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411100', '临颍县', '411122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1428, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '湖滨区', '411202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1429, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '陕州区', '411203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1430, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '渑池县', '411221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1431, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '卢氏县', '411224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1432, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '义马市', '411281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1433, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411200', '灵宝市', '411282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1434, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '宛城区', '411302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1435, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '卧龙区', '411303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1436, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '南召县', '411321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1437, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '方城县', '411322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1438, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '西峡县', '411323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1439, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '镇平县', '411324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1440, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '内乡县', '411325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1441, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '淅川县', '411326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1442, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '社旗县', '411327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1443, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '唐河县', '411328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1444, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '新野县', '411329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1445, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '桐柏县', '411330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1446, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411300', '邓州市', '411381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1447, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '梁园区', '411402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1448, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '睢阳区', '411403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1449, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '民权县', '411421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1450, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '睢县', '411422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1451, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '宁陵县', '411423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1452, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '柘城县', '411424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1453, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '虞城县', '411425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1454, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '夏邑县', '411426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1455, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411400', '永城市', '411481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1456, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '浉河区', '411502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1457, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '平桥区', '411503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1458, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '罗山县', '411521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1459, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '光山县', '411522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1460, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '新县', '411523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1461, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '商城县', '411524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1462, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '固始县', '411525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1463, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '潢川县', '411526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1464, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '淮滨县', '411527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1465, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411500', '息县', '411528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1466, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '川汇区', '411602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1467, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '淮阳区', '411603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1468, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '扶沟县', '411621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1469, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '西华县', '411622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1470, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '商水县', '411623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1471, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '沈丘县', '411624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1472, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '郸城县', '411625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1473, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '太康县', '411627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1474, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '鹿邑县', '411628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1475, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411600', '项城市', '411681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1476, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '驿城区', '411702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1477, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '西平县', '411721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1478, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '上蔡县', '411722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1479, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '平舆县', '411723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1480, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '正阳县', '411724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1481, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '确山县', '411725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1482, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '泌阳县', '411726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1483, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '汝南县', '411727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1484, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '遂平县', '411728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1485, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '411700', '新蔡县', '411729
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1486, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '419000', '济源市', '419001
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1487, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '江岸区', '420102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1488, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '江汉区', '420103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1489, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '硚口区', '420104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1490, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '汉阳区', '420105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1491, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '武昌区', '420106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1492, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '青山区', '420107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1493, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '洪山区', '420111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1494, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '东西湖区', '420112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1495, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '汉南区', '420113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1496, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '蔡甸区', '420114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1497, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '江夏区', '420115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1498, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '黄陂区', '420116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1499, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420100', '新洲区', '420117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1500, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '黄石港区', '420202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1501, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '西塞山区', '420203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1502, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '下陆区', '420204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1503, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '铁山区', '420205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1504, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '阳新县', '420222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1505, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420200', '大冶市', '420281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1506, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '茅箭区', '420302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1507, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '张湾区', '420303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1508, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '郧阳区', '420304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1509, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '郧西县', '420322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1510, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '竹山县', '420323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1511, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '竹溪县', '420324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1512, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '房县', '420325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1513, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420300', '丹江口市', '420381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1514, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '西陵区', '420502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1515, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '伍家岗区', '420503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1516, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '点军区', '420504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1517, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '猇亭区', '420505
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1518, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '夷陵区', '420506
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1519, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '远安县', '420525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1520, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '兴山县', '420526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1521, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '秭归县', '420527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1522, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '长阳土家族自治县', '420528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1523, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '五峰土家族自治县', '420529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1524, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '宜都市', '420581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1525, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '当阳市', '420582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1526, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420500', '枝江市', '420583
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1527, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '襄城区', '420602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1528, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '樊城区', '420606
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1529, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '襄州区', '420607
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1530, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '南漳县', '420624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1531, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '谷城县', '420625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1532, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '保康县', '420626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1533, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '老河口市', '420682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1534, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '枣阳市', '420683
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1535, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420600', '宜城市', '420684
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1536, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420700', '梁子湖区', '420702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1537, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420700', '华容区', '420703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1538, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420700', '鄂城区', '420704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1539, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420800', '东宝区', '420802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1540, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420800', '掇刀区', '420804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1541, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420800', '沙洋县', '420822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1542, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420800', '钟祥市', '420881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1543, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420800', '京山市', '420882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1544, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '孝南区', '420902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1545, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '孝昌县', '420921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1546, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '大悟县', '420922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1547, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '云梦县', '420923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1548, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '应城市', '420981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1549, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '安陆市', '420982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1550, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '420900', '汉川市', '420984
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1551, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '沙市区', '421002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1552, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '荆州区', '421003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1553, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '公安县', '421022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1554, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '监利县', '421023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1555, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '江陵县', '421024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1556, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '石首市', '421081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1557, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '洪湖市', '421083
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1558, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421000', '松滋市', '421087
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1559, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '黄州区', '421102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1560, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '团风县', '421121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1561, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '红安县', '421122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1562, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '罗田县', '421123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1563, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '英山县', '421124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1564, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '浠水县', '421125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1565, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '蕲春县', '421126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1566, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '黄梅县', '421127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1567, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '麻城市', '421181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1568, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421100', '武穴市', '421182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1569, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '咸安区', '421202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1570, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '嘉鱼县', '421221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1571, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '通城县', '421222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1572, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '崇阳县', '421223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1573, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '通山县', '421224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1574, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421200', '赤壁市', '421281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1575, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421300', '曾都区', '421303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1576, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421300', '随县', '421321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1577, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '421300', '广水市', '421381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1578, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '恩施市', '422801
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1579, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '利川市', '422802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1580, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '建始县', '422822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1581, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '巴东县', '422823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1582, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '宣恩县', '422825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1583, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '咸丰县', '422826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1584, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '来凤县', '422827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1585, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '422800', '鹤峰县', '422828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1586, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '429000', '仙桃市', '429004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1587, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '429000', '潜江市', '429005
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1588, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '429000', '天门市', '429006
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1589, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '429000', '神农架林区', '429021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1590, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '芙蓉区', '430102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1591, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '天心区', '430103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1592, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '岳麓区', '430104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1593, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '开福区', '430105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1594, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '雨花区', '430111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1595, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '望城区', '430112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1596, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '长沙县', '430121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1597, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '浏阳市', '430181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1598, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430100', '宁乡市', '430182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1599, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '荷塘区', '430202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1600, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '芦淞区', '430203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1601, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '石峰区', '430204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1602, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '天元区', '430211
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1603, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '渌口区', '430212
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1604, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '攸县', '430223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1605, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '茶陵县', '430224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1606, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '炎陵县', '430225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1607, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430200', '醴陵市', '430281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1608, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430300', '雨湖区', '430302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1609, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430300', '岳塘区', '430304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1610, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430300', '湘潭县', '430321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1611, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430300', '湘乡市', '430381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1612, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430300', '韶山市', '430382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1613, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '珠晖区', '430405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1614, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '雁峰区', '430406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1615, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '石鼓区', '430407
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1616, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '蒸湘区', '430408
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1617, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '南岳区', '430412
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1618, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '衡阳县', '430421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1619, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '衡南县', '430422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1620, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '衡山县', '430423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1621, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '衡东县', '430424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1622, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '祁东县', '430426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1623, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '耒阳市', '430481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1624, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430400', '常宁市', '430482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1625, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '双清区', '430502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1626, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '大祥区', '430503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1627, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '北塔区', '430511
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1628, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '新邵县', '430522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1629, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '邵阳县', '430523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1630, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '隆回县', '430524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1631, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '洞口县', '430525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1632, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '绥宁县', '430527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1633, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '新宁县', '430528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1634, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '城步苗族自治县', '430529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1635, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '武冈市', '430581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1636, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430500', '邵东市', '430582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1637, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '岳阳楼区', '430602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1638, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '云溪区', '430603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1639, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '君山区', '430611
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1640, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '岳阳县', '430621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1641, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '华容县', '430623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1642, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '湘阴县', '430624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1643, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '平江县', '430626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1644, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '汨罗市', '430681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1645, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430600', '临湘市', '430682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1646, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '武陵区', '430702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1647, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '鼎城区', '430703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1648, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '安乡县', '430721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1649, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '汉寿县', '430722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1650, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '澧县', '430723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1651, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '临澧县', '430724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1652, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '桃源县', '430725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1653, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '石门县', '430726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1654, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430700', '津市市', '430781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1655, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430800', '永定区', '430802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1656, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430800', '武陵源区', '430811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1657, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430800', '慈利县', '430821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1658, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430800', '桑植县', '430822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1659, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '资阳区', '430902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1660, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '赫山区', '430903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1661, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '南县', '430921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1662, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '桃江县', '430922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1663, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '安化县', '430923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1664, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '430900', '沅江市', '430981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1665, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '北湖区', '431002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1666, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '苏仙区', '431003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1667, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '桂阳县', '431021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1668, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '宜章县', '431022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1669, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '永兴县', '431023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1670, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '嘉禾县', '431024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1671, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '临武县', '431025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1672, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '汝城县', '431026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1673, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '桂东县', '431027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1674, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '安仁县', '431028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1675, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431000', '资兴市', '431081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1676, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '零陵区', '431102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1677, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '冷水滩区', '431103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1678, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '祁阳县', '431121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1679, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '东安县', '431122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1680, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '双牌县', '431123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1681, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '道县', '431124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1682, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '江永县', '431125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1683, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '宁远县', '431126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1684, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '蓝山县', '431127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1685, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '新田县', '431128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1686, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431100', '江华瑶族自治县', '431129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1687, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '鹤城区', '431202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1688, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '中方县', '431221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1689, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '沅陵县', '431222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1690, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '辰溪县', '431223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1691, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '溆浦县', '431224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1692, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '会同县', '431225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1693, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '麻阳苗族自治县', '431226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1694, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '新晃侗族自治县', '431227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1695, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '芷江侗族自治县', '431228
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1696, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '靖州苗族侗族自治县', '431229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1697, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '通道侗族自治县', '431230
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1698, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431200', '洪江市', '431281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1699, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431300', '娄星区', '431302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1700, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431300', '双峰县', '431321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1701, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431300', '新化县', '431322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1702, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431300', '冷水江市', '431381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1703, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '431300', '涟源市', '431382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1704, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '吉首市', '433101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1705, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '泸溪县', '433122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1706, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '凤凰县', '433123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1707, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '花垣县', '433124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1708, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '保靖县', '433125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1709, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '古丈县', '433126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1710, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '永顺县', '433127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1711, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '433100', '龙山县', '433130
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1712, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '荔湾区', '440103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1713, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '越秀区', '440104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1714, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '海珠区', '440105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1715, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '天河区', '440106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1716, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '白云区', '440111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1717, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '黄埔区', '440112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1718, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '番禺区', '440113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1719, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '花都区', '440114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1720, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '南沙区', '440115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1721, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '从化区', '440117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1722, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440100', '增城区', '440118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1723, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '武江区', '440203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1724, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '浈江区', '440204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1725, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '曲江区', '440205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1726, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '始兴县', '440222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1727, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '仁化县', '440224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1728, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '翁源县', '440229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1729, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '乳源瑶族自治县', '440232
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1730, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '新丰县', '440233
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1731, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '乐昌市', '440281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1732, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440200', '南雄市', '440282
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1733, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '罗湖区', '440303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1734, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '福田区', '440304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1735, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '南山区', '440305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1736, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '宝安区', '440306
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1737, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '龙岗区', '440307
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1738, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '盐田区', '440308
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1739, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '龙华区', '440309
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1740, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '坪山区', '440310
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1741, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440300', '光明区', '440311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1742, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440400', '香洲区', '440402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1743, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440400', '斗门区', '440403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1744, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440400', '金湾区', '440404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1745, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '龙湖区', '440507
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1746, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '金平区', '440511
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1747, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '濠江区', '440512
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1748, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '潮阳区', '440513
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1749, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '潮南区', '440514
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1750, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '澄海区', '440515
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1751, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440500', '南澳县', '440523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1752, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440600', '禅城区', '440604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1753, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440600', '南海区', '440605
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1754, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440600', '顺德区', '440606
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1755, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440600', '三水区', '440607
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1756, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440600', '高明区', '440608
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1757, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '蓬江区', '440703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1758, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '江海区', '440704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1759, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '新会区', '440705
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1760, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '台山市', '440781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1761, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '开平市', '440783
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1762, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '鹤山市', '440784
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1763, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440700', '恩平市', '440785
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1764, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '赤坎区', '440802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1765, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '霞山区', '440803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1766, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '坡头区', '440804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1767, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '麻章区', '440811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1768, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '遂溪县', '440823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1769, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '徐闻县', '440825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1770, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '廉江市', '440881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1771, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '雷州市', '440882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1772, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440800', '吴川市', '440883
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1773, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440900', '茂南区', '440902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1774, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440900', '电白区', '440904
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1775, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440900', '高州市', '440981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1776, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440900', '化州市', '440982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1777, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '440900', '信宜市', '440983
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1778, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '端州区', '441202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1779, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '鼎湖区', '441203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1780, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '高要区', '441204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1781, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '广宁县', '441223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1782, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '怀集县', '441224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1783, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '封开县', '441225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1784, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '德庆县', '441226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1785, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441200', '四会市', '441284
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1786, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441300', '惠城区', '441302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1787, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441300', '惠阳区', '441303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1788, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441300', '博罗县', '441322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1789, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441300', '惠东县', '441323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1790, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441300', '龙门县', '441324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1791, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '梅江区', '441402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1792, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '梅县区', '441403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1793, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '大埔县', '441422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1794, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '丰顺县', '441423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1795, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '五华县', '441424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1796, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '平远县', '441426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1797, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '蕉岭县', '441427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1798, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441400', '兴宁市', '441481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1799, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441500', '城区', '441502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1800, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441500', '海丰县', '441521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1801, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441500', '陆河县', '441523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1802, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441500', '陆丰市', '441581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1803, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '源城区', '441602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1804, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '紫金县', '441621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1805, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '龙川县', '441622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1806, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '连平县', '441623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1807, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '和平县', '441624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1808, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441600', '东源县', '441625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1809, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441700', '江城区', '441702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1810, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441700', '阳东区', '441704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1811, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441700', '阳西县', '441721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1812, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441700', '阳春市', '441781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1813, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '清城区', '441802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1814, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '清新区', '441803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1815, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '佛冈县', '441821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1816, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '阳山县', '441823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1817, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '连山壮族瑶族自治县', '441825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1818, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '连南瑶族自治县', '441826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1819, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '英德市', '441881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1820, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '441800', '连州市', '441882
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1821, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445100', '湘桥区', '445102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1822, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445100', '潮安区', '445103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1823, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445100', '饶平县', '445122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1824, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445200', '榕城区', '445202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1825, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445200', '揭东区', '445203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1826, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445200', '揭西县', '445222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1827, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445200', '惠来县', '445224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1828, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445200', '普宁市', '445281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1829, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445300', '云城区', '445302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1830, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445300', '云安区', '445303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1831, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445300', '新兴县', '445321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1832, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445300', '郁南县', '445322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1833, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '445300', '罗定市', '445381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1834, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '兴宁区', '450102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1835, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '青秀区', '450103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1836, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '江南区', '450105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1837, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '西乡塘区', '450107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1838, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '良庆区', '450108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1839, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '邕宁区', '450109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1840, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '武鸣区', '450110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1841, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '隆安县', '450123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1842, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '马山县', '450124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1843, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '上林县', '450125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1844, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '宾阳县', '450126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1845, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450100', '横县', '450127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1846, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '城中区', '450202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1847, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '鱼峰区', '450203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1848, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '柳南区', '450204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1849, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '柳北区', '450205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1850, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '柳江区', '450206
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1851, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '柳城县', '450222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1852, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '鹿寨县', '450223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1853, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '融安县', '450224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1854, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '融水苗族自治县', '450225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1855, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450200', '三江侗族自治县', '450226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1856, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '秀峰区', '450302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1857, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '叠彩区', '450303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1858, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '象山区', '450304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1859, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '七星区', '450305
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1860, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '雁山区', '450311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1861, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '临桂区', '450312
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1862, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '阳朔县', '450321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1863, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '灵川县', '450323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1864, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '全州县', '450324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1865, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '兴安县', '450325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1866, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '永福县', '450326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1867, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '灌阳县', '450327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1868, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '龙胜各族自治县', '450328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1869, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '资源县', '450329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1870, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '平乐县', '450330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1871, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '荔浦市', '450381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1872, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450300', '恭城瑶族自治县', '450332
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1873, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '万秀区', '450403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1874, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '长洲区', '450405
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1875, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '龙圩区', '450406
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1876, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '苍梧县', '450421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1877, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '藤县', '450422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1878, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '蒙山县', '450423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1879, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450400', '岑溪市', '450481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1880, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450500', '海城区', '450502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1881, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450500', '银海区', '450503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1882, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450500', '铁山港区', '450512
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1883, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450500', '合浦县', '450521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1884, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450600', '港口区', '450602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1885, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450600', '防城区', '450603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1886, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450600', '上思县', '450621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1887, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450600', '东兴市', '450681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1888, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450700', '钦南区', '450702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1889, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450700', '钦北区', '450703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1890, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450700', '灵山县', '450721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1891, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450700', '浦北县', '450722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1892, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450800', '港北区', '450802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1893, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450800', '港南区', '450803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1894, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450800', '覃塘区', '450804
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1895, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450800', '平南县', '450821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1896, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450800', '桂平市', '450881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1897, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '玉州区', '450902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1898, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '福绵区', '450903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1899, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '容县', '450921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1900, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '陆川县', '450922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1901, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '博白县', '450923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1902, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '兴业县', '450924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1903, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '450900', '北流市', '450981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1904, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '右江区', '451002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1905, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '田阳区', '451003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1906, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '田东县', '451022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1907, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '德保县', '451024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1908, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '那坡县', '451026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1909, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '凌云县', '451027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1910, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '乐业县', '451028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1911, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '田林县', '451029
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1912, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '西林县', '451030
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1913, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '隆林各族自治县', '451031
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1914, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '靖西市', '451081
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1915, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451000', '平果市', '451082
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1916, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451100', '八步区', '451102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1917, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451100', '平桂区', '451103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1918, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451100', '昭平县', '451121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1919, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451100', '钟山县', '451122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1920, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451100', '富川瑶族自治县', '451123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1921, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '金城江区', '451202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1922, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '宜州区', '451203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1923, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '南丹县', '451221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1924, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '天峨县', '451222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1925, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '凤山县', '451223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1926, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '东兰县', '451224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1927, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '罗城仫佬族自治县', '451225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1928, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '环江毛南族自治县', '451226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1929, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '巴马瑶族自治县', '451227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1930, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '都安瑶族自治县', '451228
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1931, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451200', '大化瑶族自治县', '451229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1932, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '兴宾区', '451302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1933, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '忻城县', '451321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1934, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '象州县', '451322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1935, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '武宣县', '451323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1936, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '金秀瑶族自治县', '451324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1937, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451300', '合山市', '451381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1938, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '江州区', '451402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1939, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '扶绥县', '451421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1940, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '宁明县', '451422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1941, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '龙州县', '451423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1942, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '大新县', '451424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1943, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '天等县', '451425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1944, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '451400', '凭祥市', '451481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1945, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460100', '秀英区', '460105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1946, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460100', '龙华区', '460106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1947, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460100', '琼山区', '460107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1948, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460100', '美兰区', '460108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1949, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460200', '海棠区', '460202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1950, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460200', '吉阳区', '460203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1951, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460200', '天涯区', '460204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1952, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '460200', '崖州区', '460205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1953, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '五指山市', '469001
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1954, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '琼海市', '469002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1955, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '文昌市', '469005
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1956, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '万宁市', '469006
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1957, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '东方市', '469007
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1958, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '定安县', '469021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1959, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '屯昌县', '469022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1960, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '澄迈县', '469023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1961, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '临高县', '469024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1962, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '白沙黎族自治县', '469025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1963, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '昌江黎族自治县', '469026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1964, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '乐东黎族自治县', '469027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1965, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '陵水黎族自治县', '469028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1966, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '保亭黎族苗族自治县', '469029
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1967, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '469000', '琼中黎族苗族自治县', '469030
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1968, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '万州区', '500101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1969, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '涪陵区', '500102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1970, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '渝中区', '500103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1971, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '大渡口区', '500104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1972, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '江北区', '500105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1973, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '沙坪坝区', '500106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1974, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '九龙坡区', '500107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1975, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '南岸区', '500108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1976, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '北碚区', '500109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1977, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '綦江区', '500110
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1978, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '大足区', '500111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1979, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '渝北区', '500112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1980, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '巴南区', '500113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1981, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '黔江区', '500114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1982, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '长寿区', '500115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1983, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '江津区', '500116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1984, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '合川区', '500117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1985, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '永川区', '500118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1986, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '南川区', '500119
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1987, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '璧山区', '500120
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1988, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '铜梁区', '500151
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1989, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '潼南区', '500152
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1990, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '荣昌区', '500153
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1991, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '开州区', '500154
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1992, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '梁平区', '500155
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1993, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500100', '武隆区', '500156
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1994, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '城口县', '500229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1995, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '丰都县', '500230
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1996, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '垫江县', '500231
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1997, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '忠县', '500233
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1998, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '云阳县', '500235
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (1999, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '奉节县', '500236
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2000, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '巫山县', '500237
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2001, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '巫溪县', '500238
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2002, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '石柱土家族自治县', '500240
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2003, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '秀山土家族苗族自治县', '500241
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2004, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '酉阳土家族苗族自治县', '500242
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2005, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '500200', '彭水苗族土家族自治县', '500243
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2006, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '锦江区', '510104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2007, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '青羊区', '510105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2008, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '金牛区', '510106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2009, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '武侯区', '510107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2010, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '成华区', '510108
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2011, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '龙泉驿区', '510112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2012, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '青白江区', '510113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2013, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '新都区', '510114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2014, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '温江区', '510115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2015, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '双流区', '510116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2016, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '郫都区', '510117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2017, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '新津区', '510118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2018, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '金堂县', '510121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2019, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '大邑县', '510129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2020, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '蒲江县', '510131
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2021, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '都江堰市', '510181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2022, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '彭州市', '510182
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2023, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '邛崃市', '510183
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2024, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '崇州市', '510184
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2025, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510100', '简阳市', '510185
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2026, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '自流井区', '510302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2027, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '贡井区', '510303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2028, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '大安区', '510304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2029, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '沿滩区', '510311
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2030, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '荣县', '510321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2031, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510300', '富顺县', '510322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2032, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510400', '东区', '510402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2033, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510400', '西区', '510403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2034, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510400', '仁和区', '510411
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2035, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510400', '米易县', '510421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2036, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510400', '盐边县', '510422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2037, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '江阳区', '510502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2038, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '纳溪区', '510503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2039, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '龙马潭区', '510504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2040, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '泸县', '510521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2041, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '合江县', '510522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2042, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '叙永县', '510524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2043, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510500', '古蔺县', '510525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2044, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '旌阳区', '510603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2045, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '罗江区', '510604
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2046, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '中江县', '510623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2047, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '广汉市', '510681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2048, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '什邡市', '510682
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2049, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510600', '绵竹市', '510683
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2050, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '涪城区', '510703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2051, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '游仙区', '510704
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2052, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '安州区', '510705
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2053, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '三台县', '510722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2054, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '盐亭县', '510723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2055, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '梓潼县', '510725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2056, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '北川羌族自治县', '510726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2057, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '平武县', '510727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2058, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510700', '江油市', '510781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2059, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '利州区', '510802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2060, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '昭化区', '510811
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2061, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '朝天区', '510812
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2062, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '旺苍县', '510821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2063, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '青川县', '510822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2064, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '剑阁县', '510823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2065, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510800', '苍溪县', '510824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2066, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510900', '船山区', '510903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2067, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510900', '安居区', '510904
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2068, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510900', '蓬溪县', '510921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2069, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510900', '大英县', '510923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2070, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '510900', '射洪市', '510981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2071, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511000', '市中区', '511002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2072, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511000', '东兴区', '511011
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2073, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511000', '威远县', '511024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2074, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511000', '资中县', '511025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2075, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511000', '隆昌市', '511083
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2076, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '市中区', '511102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2077, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '沙湾区', '511111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2078, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '五通桥区', '511112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2079, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '金口河区', '511113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2080, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '犍为县', '511123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2081, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '井研县', '511124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2082, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '夹江县', '511126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2083, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '沐川县', '511129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2084, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '峨边彝族自治县', '511132
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2085, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '马边彝族自治县', '511133
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2086, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511100', '峨眉山市', '511181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2087, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '顺庆区', '511302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2088, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '高坪区', '511303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2089, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '嘉陵区', '511304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2090, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '南部县', '511321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2091, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '营山县', '511322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2092, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '蓬安县', '511323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2093, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '仪陇县', '511324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2094, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '西充县', '511325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2095, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511300', '阆中市', '511381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2096, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '东坡区', '511402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2097, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '彭山区', '511403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2098, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '仁寿县', '511421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2099, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '洪雅县', '511423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2100, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '丹棱县', '511424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2101, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511400', '青神县', '511425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2102, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '翠屏区', '511502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2103, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '南溪区', '511503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2104, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '叙州区', '511504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2105, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '江安县', '511523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2106, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '长宁县', '511524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2107, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '高县', '511525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2108, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '珙县', '511526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2109, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '筠连县', '511527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2110, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '兴文县', '511528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2111, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511500', '屏山县', '511529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2112, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '广安区', '511602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2113, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '前锋区', '511603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2114, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '岳池县', '511621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2115, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '武胜县', '511622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2116, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '邻水县', '511623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2117, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511600', '华蓥市', '511681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2118, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '通川区', '511702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2119, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '达川区', '511703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2120, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '宣汉县', '511722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2121, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '开江县', '511723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2122, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '大竹县', '511724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2123, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '渠县', '511725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2124, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511700', '万源市', '511781
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2125, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '雨城区', '511802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2126, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '名山区', '511803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2127, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '荥经县', '511822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2128, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '汉源县', '511823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2129, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '石棉县', '511824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2130, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '天全县', '511825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2131, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '芦山县', '511826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2132, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511800', '宝兴县', '511827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2133, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511900', '巴州区', '511902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2134, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511900', '恩阳区', '511903
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2135, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511900', '通江县', '511921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2136, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511900', '南江县', '511922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2137, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '511900', '平昌县', '511923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2138, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '512000', '雁江区', '512002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2139, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '512000', '安岳县', '512021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2140, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '512000', '乐至县', '512022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2141, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '马尔康市', '513201
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2142, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '汶川县', '513221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2143, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '理县', '513222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2144, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '茂县', '513223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2145, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '松潘县', '513224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2146, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '九寨沟县', '513225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2147, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '金川县', '513226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2148, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '小金县', '513227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2149, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '黑水县', '513228
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2150, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '壤塘县', '513230
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2151, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '阿坝县', '513231
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2152, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '若尔盖县', '513232
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2153, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513200', '红原县', '513233
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2154, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '康定市', '513301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2155, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '泸定县', '513322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2156, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '丹巴县', '513323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2157, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '九龙县', '513324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2158, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '雅江县', '513325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2159, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '道孚县', '513326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2160, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '炉霍县', '513327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2161, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '甘孜县', '513328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2162, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '新龙县', '513329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2163, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '德格县', '513330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2164, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '白玉县', '513331
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2165, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '石渠县', '513332
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2166, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '色达县', '513333
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2167, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '理塘县', '513334
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2168, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '巴塘县', '513335
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2169, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '乡城县', '513336
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2170, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '稻城县', '513337
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2171, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513300', '得荣县', '513338
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2172, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '西昌市', '513401
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2173, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '木里藏族自治县', '513422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2174, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '盐源县', '513423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2175, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '德昌县', '513424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2176, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '会理县', '513425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2177, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '会东县', '513426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2178, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '宁南县', '513427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2179, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '普格县', '513428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2180, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '布拖县', '513429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2181, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '金阳县', '513430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2182, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '昭觉县', '513431
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2183, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '喜德县', '513432
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2184, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '冕宁县', '513433
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2185, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '越西县', '513434
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2186, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '甘洛县', '513435
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2187, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '美姑县', '513436
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2188, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '513400', '雷波县', '513437
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2189, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '南明区', '520102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2190, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '云岩区', '520103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2191, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '花溪区', '520111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2192, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '乌当区', '520112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2193, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '白云区', '520113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2194, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '观山湖区', '520115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2195, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '开阳县', '520121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2196, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '息烽县', '520122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2197, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '修文县', '520123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2198, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520100', '清镇市', '520181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2199, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520200', '钟山区', '520201
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2200, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520200', '六枝特区', '520203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2201, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520200', '水城县', '520221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2202, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520200', '盘州市', '520281
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2203, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '红花岗区', '520302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2204, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '汇川区', '520303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2205, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '播州区', '520304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2206, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '桐梓县', '520322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2207, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '绥阳县', '520323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2208, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '正安县', '520324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2209, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '道真仡佬族苗族自治县', '520325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2210, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '务川仡佬族苗族自治县', '520326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2211, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '凤冈县', '520327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2212, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '湄潭县', '520328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2213, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '余庆县', '520329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2214, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '习水县', '520330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2215, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '赤水市', '520381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2216, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520300', '仁怀市', '520382
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2217, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '西秀区', '520402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2218, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '平坝区', '520403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2219, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '普定县', '520422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2220, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '镇宁布依族苗族自治县', '520423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2221, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '关岭布依族苗族自治县', '520424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2222, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520400', '紫云苗族布依族自治县', '520425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2223, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '七星关区', '520502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2224, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '大方县', '520521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2225, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '黔西县', '520522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2226, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '金沙县', '520523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2227, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '织金县', '520524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2228, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '纳雍县', '520525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2229, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '威宁彝族回族苗族自治县', '520526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2230, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520500', '赫章县', '520527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2231, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '碧江区', '520602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2232, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '万山区', '520603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2233, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '江口县', '520621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2234, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '玉屏侗族自治县', '520622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2235, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '石阡县', '520623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2236, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '思南县', '520624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2237, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '印江土家族苗族自治县', '520625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2238, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '德江县', '520626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2239, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '沿河土家族自治县', '520627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2240, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '520600', '松桃苗族自治县', '520628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2241, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '兴义市', '522301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2242, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '兴仁市', '522302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2243, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '普安县', '522323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2244, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '晴隆县', '522324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2245, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '贞丰县', '522325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2246, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '望谟县', '522326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2247, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '册亨县', '522327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2248, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522300', '安龙县', '522328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2249, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '凯里市', '522601
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2250, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '黄平县', '522622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2251, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '施秉县', '522623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2252, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '三穗县', '522624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2253, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '镇远县', '522625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2254, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '岑巩县', '522626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2255, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '天柱县', '522627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2256, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '锦屏县', '522628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2257, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '剑河县', '522629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2258, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '台江县', '522630
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2259, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '黎平县', '522631
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2260, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '榕江县', '522632
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2261, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '从江县', '522633
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2262, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '雷山县', '522634
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2263, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '麻江县', '522635
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2264, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522600', '丹寨县', '522636
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2265, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '都匀市', '522701
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2266, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '福泉市', '522702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2267, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '荔波县', '522722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2268, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '贵定县', '522723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2269, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '瓮安县', '522725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2270, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '独山县', '522726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2271, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '平塘县', '522727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2272, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '罗甸县', '522728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2273, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '长顺县', '522729
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2274, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '龙里县', '522730
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2275, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '惠水县', '522731
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2276, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '522700', '三都水族自治县', '522732
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2277, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '五华区', '530102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2278, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '盘龙区', '530103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2279, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '官渡区', '530111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2280, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '西山区', '530112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2281, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '东川区', '530113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2282, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '呈贡区', '530114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2283, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '晋宁区', '530115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2284, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '富民县', '530124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2285, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '宜良县', '530125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2286, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '石林彝族自治县', '530126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2287, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '嵩明县', '530127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2288, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '禄劝彝族苗族自治县', '530128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2289, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '寻甸回族彝族自治县', '530129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2290, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530100', '安宁市', '530181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2291, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '麒麟区', '530302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2292, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '沾益区', '530303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2293, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '马龙区', '530304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2294, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '陆良县', '530322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2295, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '师宗县', '530323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2296, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '罗平县', '530324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2297, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '富源县', '530325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2298, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '会泽县', '530326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2299, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530300', '宣威市', '530381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2300, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '红塔区', '530402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2301, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '江川区', '530403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2302, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '通海县', '530423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2303, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '华宁县', '530424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2304, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '易门县', '530425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2305, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '峨山彝族自治县', '530426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2306, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '新平彝族傣族自治县', '530427
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2307, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '元江哈尼族彝族傣族自治县', '530428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2308, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530400', '澄江市', '530481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2309, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530500', '隆阳区', '530502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2310, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530500', '施甸县', '530521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2311, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530500', '龙陵县', '530523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2312, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530500', '昌宁县', '530524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2313, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530500', '腾冲市', '530581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2314, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '昭阳区', '530602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2315, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '鲁甸县', '530621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2316, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '巧家县', '530622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2317, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '盐津县', '530623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2318, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '大关县', '530624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2319, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '永善县', '530625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2320, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '绥江县', '530626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2321, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '镇雄县', '530627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2322, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '彝良县', '530628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2323, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '威信县', '530629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2324, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530600', '水富市', '530681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2325, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530700', '古城区', '530702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2326, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530700', '玉龙纳西族自治县', '530721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2327, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530700', '永胜县', '530722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2328, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530700', '华坪县', '530723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2329, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530700', '宁蒗彝族自治县', '530724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2330, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '思茅区', '530802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2331, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '宁洱哈尼族彝族自治县', '530821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2332, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '墨江哈尼族自治县', '530822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2333, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '景东彝族自治县', '530823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2334, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '景谷傣族彝族自治县', '530824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2335, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '镇沅彝族哈尼族拉祜族自治县', '530825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2336, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '江城哈尼族彝族自治县', '530826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2337, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '孟连傣族拉祜族佤族自治县', '530827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2338, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '澜沧拉祜族自治县', '530828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2339, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530800', '西盟佤族自治县', '530829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2340, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '临翔区', '530902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2341, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '凤庆县', '530921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2342, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '云县', '530922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2343, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '永德县', '530923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2344, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '镇康县', '530924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2345, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '双江拉祜族佤族布朗族傣族自治县', '530925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2346, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '耿马傣族佤族自治县', '530926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2347, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '530900', '沧源佤族自治县', '530927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2348, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '楚雄市', '532301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2349, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '双柏县', '532322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2350, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '牟定县', '532323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2351, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '南华县', '532324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2352, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '姚安县', '532325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2353, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '大姚县', '532326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2354, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '永仁县', '532327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2355, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '元谋县', '532328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2356, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '武定县', '532329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2357, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532300', '禄丰县', '532331
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2358, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '个旧市', '532501
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2359, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '开远市', '532502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2360, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '蒙自市', '532503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2361, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '弥勒市', '532504
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2362, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '屏边苗族自治县', '532523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2363, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '建水县', '532524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2364, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '石屏县', '532525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2365, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '泸西县', '532527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2366, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '元阳县', '532528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2367, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '红河县', '532529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2368, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '金平苗族瑶族傣族自治县', '532530
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2369, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '绿春县', '532531
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2370, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532500', '河口瑶族自治县', '532532
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2371, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '文山市', '532601
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2372, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '砚山县', '532622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2373, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '西畴县', '532623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2374, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '麻栗坡县', '532624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2375, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '马关县', '532625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2376, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '丘北县', '532626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2377, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '广南县', '532627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2378, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532600', '富宁县', '532628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2379, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532800', '景洪市', '532801
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2380, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532800', '勐海县', '532822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2381, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532800', '勐腊县', '532823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2382, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '大理市', '532901
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2383, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '漾濞彝族自治县', '532922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2384, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '祥云县', '532923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2385, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '宾川县', '532924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2386, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '弥渡县', '532925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2387, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '南涧彝族自治县', '532926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2388, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '巍山彝族回族自治县', '532927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2389, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '永平县', '532928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2390, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '云龙县', '532929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2391, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '洱源县', '532930
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2392, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '剑川县', '532931
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2393, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '532900', '鹤庆县', '532932
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2394, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533100', '瑞丽市', '533102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2395, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533100', '芒市', '533103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2396, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533100', '梁河县', '533122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2397, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533100', '盈江县', '533123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2398, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533100', '陇川县', '533124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2399, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533300', '泸水市', '533301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2400, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533300', '福贡县', '533323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2401, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533300', '贡山独龙族怒族自治县', '533324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2402, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533300', '兰坪白族普米族自治县', '533325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2403, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533400', '香格里拉市', '533401
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2404, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533400', '德钦县', '533422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2405, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '533400', '维西傈僳族自治县', '533423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2406, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '城关区', '540102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2407, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '堆龙德庆区', '540103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2408, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '达孜区', '540104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2409, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '林周县', '540121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2410, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '当雄县', '540122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2411, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '尼木县', '540123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2412, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '曲水县', '540124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2413, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540100', '墨竹工卡县', '540127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2414, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '桑珠孜区', '540202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2415, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '南木林县', '540221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2416, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '江孜县', '540222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2417, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '定日县', '540223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2418, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '萨迦县', '540224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2419, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '拉孜县', '540225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2420, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '昂仁县', '540226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2421, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '谢通门县', '540227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2422, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '白朗县', '540228
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2423, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '仁布县', '540229
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2424, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '康马县', '540230
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2425, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '定结县', '540231
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2426, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '仲巴县', '540232
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2427, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '亚东县', '540233
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2428, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '吉隆县', '540234
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2429, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '聂拉木县', '540235
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2430, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '萨嘎县', '540236
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2431, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540200', '岗巴县', '540237
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2432, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '卡若区', '540302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2433, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '江达县', '540321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2434, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '贡觉县', '540322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2435, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '类乌齐县', '540323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2436, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '丁青县', '540324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2437, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '察雅县', '540325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2438, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '八宿县', '540326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2439, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '左贡县', '540327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2440, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '芒康县', '540328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2441, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '洛隆县', '540329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2442, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540300', '边坝县', '540330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2443, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '巴宜区', '540402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2444, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '工布江达县', '540421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2445, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '米林县', '540422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2446, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '墨脱县', '540423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2447, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '波密县', '540424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2448, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '察隅县', '540425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2449, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540400', '朗县', '540426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2450, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '乃东区', '540502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2451, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '扎囊县', '540521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2452, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '贡嘎县', '540522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2453, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '桑日县', '540523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2454, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '琼结县', '540524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2455, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '曲松县', '540525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2456, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '措美县', '540526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2457, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '洛扎县', '540527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2458, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '加查县', '540528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2459, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '隆子县', '540529
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2460, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '错那县', '540530
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2461, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540500', '浪卡子县', '540531
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2462, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '色尼区', '540602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2463, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '嘉黎县 ', '540621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2464, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '比如县 ', '540622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2465, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '聂荣县 ', '540623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2466, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '安多县 ', '540624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2467, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '申扎县 ', '540625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2468, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '索县', '540626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2469, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '班戈县 ', '540627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2470, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '巴青县 ', '540628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2471, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '尼玛县 ', '540629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2472, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '540600', '双湖县 ', '540630
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2473, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '普兰县', '542521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2474, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '札达县', '542522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2475, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '噶尔县', '542523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2476, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '日土县', '542524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2477, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '革吉县', '542525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2478, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '改则县', '542526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2479, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '542500', '措勤县', '542527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2480, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '新城区', '610102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2481, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '碑林区', '610103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2482, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '莲湖区', '610104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2483, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '灞桥区', '610111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2484, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '未央区', '610112
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2485, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '雁塔区', '610113
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2486, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '阎良区', '610114
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2487, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '临潼区', '610115
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2488, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '长安区', '610116
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2489, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '高陵区', '610117
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2490, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '鄠邑区', '610118
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2491, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '蓝田县', '610122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2492, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610100', '周至县', '610124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2493, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610200', '王益区', '610202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2494, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610200', '印台区', '610203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2495, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610200', '耀州区', '610204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2496, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610200', '宜君县', '610222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2497, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '渭滨区', '610302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2498, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '金台区', '610303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2499, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '陈仓区', '610304
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2500, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '凤翔县', '610322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2501, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '岐山县', '610323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2502, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '扶风县', '610324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2503, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '眉县', '610326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2504, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '陇县', '610327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2505, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '千阳县', '610328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2506, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '麟游县', '610329
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2507, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '凤县', '610330
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2508, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610300', '太白县', '610331
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2509, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '秦都区', '610402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2510, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '杨陵区', '610403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2511, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '渭城区', '610404
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2512, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '三原县', '610422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2513, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '泾阳县', '610423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2514, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '乾县', '610424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2515, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '礼泉县', '610425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2516, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '永寿县', '610426
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2517, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '长武县', '610428
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2518, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '旬邑县', '610429
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2519, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '淳化县', '610430
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2520, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '武功县', '610431
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2521, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '兴平市', '610481
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2522, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610400', '彬州市', '610482
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2523, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '临渭区', '610502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2524, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '华州区', '610503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2525, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '潼关县', '610522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2526, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '大荔县', '610523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2527, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '合阳县', '610524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2528, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '澄城县', '610525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2529, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '蒲城县', '610526
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2530, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '白水县', '610527
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2531, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '富平县', '610528
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2532, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '韩城市', '610581
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2533, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610500', '华阴市', '610582
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2534, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '宝塔区', '610602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2535, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '安塞区', '610603
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2536, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '延长县', '610621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2537, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '延川县', '610622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2538, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '志丹县', '610625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2539, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '吴起县', '610626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2540, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '甘泉县', '610627
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2541, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '富县', '610628
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2542, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '洛川县', '610629
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2543, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '宜川县', '610630
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2544, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '黄龙县', '610631
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2545, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '黄陵县', '610632
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2546, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610600', '子长市', '610681
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2547, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '汉台区', '610702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2548, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '南郑区', '610703
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2549, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '城固县', '610722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2550, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '洋县', '610723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2551, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '西乡县', '610724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2552, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '勉县', '610725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2553, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '宁强县', '610726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2554, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '略阳县', '610727
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2555, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '镇巴县', '610728
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2556, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '留坝县', '610729
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2557, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610700', '佛坪县', '610730
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2558, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '榆阳区', '610802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2559, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '横山区', '610803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2560, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '府谷县', '610822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2561, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '靖边县', '610824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2562, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '定边县', '610825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2563, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '绥德县', '610826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2564, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '米脂县', '610827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2565, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '佳县', '610828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2566, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '吴堡县', '610829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2567, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '清涧县', '610830
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2568, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '子洲县', '610831
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2569, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610800', '神木市', '610881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2570, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '汉滨区', '610902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2571, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '汉阴县', '610921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2572, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '石泉县', '610922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2573, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '宁陕县', '610923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2574, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '紫阳县', '610924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2575, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '岚皋县', '610925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2576, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '平利县', '610926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2577, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '镇坪县', '610927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2578, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '旬阳县', '610928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2579, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '610900', '白河县', '610929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2580, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '商州区', '611002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2581, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '洛南县', '611021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2582, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '丹凤县', '611022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2583, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '商南县', '611023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2584, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '山阳县', '611024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2585, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '镇安县', '611025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2586, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '611000', '柞水县', '611026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2587, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '城关区', '620102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2588, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '七里河区', '620103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2589, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '西固区', '620104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2590, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '安宁区', '620105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2591, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '红古区', '620111
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2592, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '永登县', '620121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2593, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '皋兰县', '620122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2594, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620100', '榆中县', '620123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2595, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620300', '金川区', '620302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2596, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620300', '永昌县', '620321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2597, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620400', '白银区', '620402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2598, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620400', '平川区', '620403
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2599, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620400', '靖远县', '620421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2600, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620400', '会宁县', '620422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2601, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620400', '景泰县', '620423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2602, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '秦州区', '620502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2603, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '麦积区', '620503
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2604, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '清水县', '620521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2605, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '秦安县', '620522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2606, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '甘谷县', '620523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2607, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '武山县', '620524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2608, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620500', '张家川回族自治县', '620525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2609, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620600', '凉州区', '620602
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2610, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620600', '民勤县', '620621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2611, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620600', '古浪县', '620622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2612, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620600', '天祝藏族自治县', '620623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2613, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '甘州区', '620702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2614, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '肃南裕固族自治县', '620721
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2615, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '民乐县', '620722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2616, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '临泽县', '620723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2617, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '高台县', '620724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2618, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620700', '山丹县', '620725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2619, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '崆峒区', '620802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2620, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '泾川县', '620821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2621, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '灵台县', '620822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2622, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '崇信县', '620823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2623, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '庄浪县', '620825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2624, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '静宁县', '620826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2625, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620800', '华亭市', '620881
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2626, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '肃州区', '620902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2627, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '金塔县', '620921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2628, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '瓜州县', '620922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2629, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '肃北蒙古族自治县', '620923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2630, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '阿克塞哈萨克族自治县', '620924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2631, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '玉门市', '620981
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2632, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '620900', '敦煌市', '620982
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2633, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '西峰区', '621002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2634, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '庆城县', '621021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2635, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '环县', '621022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2636, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '华池县', '621023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2637, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '合水县', '621024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2638, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '正宁县', '621025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2639, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '宁县', '621026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2640, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621000', '镇原县', '621027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2641, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '安定区', '621102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2642, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '通渭县', '621121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2643, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '陇西县', '621122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2644, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '渭源县', '621123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2645, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '临洮县', '621124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2646, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '漳县', '621125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2647, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621100', '岷县', '621126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2648, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '武都区', '621202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2649, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '成县', '621221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2650, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '文县', '621222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2651, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '宕昌县', '621223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2652, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '康县', '621224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2653, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '西和县', '621225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2654, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '礼县', '621226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2655, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '徽县', '621227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2656, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '621200', '两当县', '621228
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2657, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '临夏市', '622901
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2658, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '临夏县', '622921
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2659, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '康乐县', '622922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2660, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '永靖县', '622923
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2661, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '广河县', '622924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2662, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '和政县', '622925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2663, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '东乡族自治县', '622926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2664, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '622900', '积石山保安族东乡族撒拉族自治县', '622927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2665, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '合作市', '623001
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2666, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '临潭县', '623021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2667, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '卓尼县', '623022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2668, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '舟曲县', '623023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2669, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '迭部县', '623024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2670, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '玛曲县', '623025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2671, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '碌曲县', '623026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2672, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '623000', '夏河县', '623027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2673, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '城东区', '630102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2674, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '城中区', '630103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2675, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '城西区', '630104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2676, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '城北区', '630105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2677, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '湟中区', '630106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2678, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '大通回族土族自治县', '630121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2679, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630100', '湟源县', '630123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2680, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '乐都区', '630202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2681, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '平安区', '630203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2682, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '民和回族土族自治县', '630222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2683, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '互助土族自治县', '630223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2684, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '化隆回族自治县', '630224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2685, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '630200', '循化撒拉族自治县', '630225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2686, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632200', '门源回族自治县', '632221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2687, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632200', '祁连县', '632222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2688, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632200', '海晏县', '632223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2689, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632200', '刚察县', '632224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2690, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632300', '同仁市', '632301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2691, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632300', '尖扎县', '632322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2692, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632300', '泽库县', '632323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2693, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632300', '河南蒙古族自治县', '632324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2694, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632500', '共和县', '632521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2695, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632500', '同德县', '632522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2696, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632500', '贵德县', '632523
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2697, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632500', '兴海县', '632524
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2698, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632500', '贵南县', '632525
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2699, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '玛沁县', '632621
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2700, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '班玛县', '632622
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2701, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '甘德县', '632623
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2702, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '达日县', '632624
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2703, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '久治县', '632625
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2704, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632600', '玛多县', '632626
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2705, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '玉树市', '632701
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2706, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '杂多县', '632722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2707, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '称多县', '632723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2708, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '治多县', '632724
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2709, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '囊谦县', '632725
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2710, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632700', '曲麻莱县', '632726
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2711, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '格尔木市', '632801
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2712, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '德令哈市', '632802
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2713, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '茫崖市', '632803
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2714, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '乌兰县', '632821
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2715, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '都兰县', '632822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2716, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '632800', '天峻县', '632823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2717, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '兴庆区', '640104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2718, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '西夏区', '640105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2719, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '金凤区', '640106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2720, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '永宁县', '640121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2721, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '贺兰县', '640122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2722, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640100', '灵武市', '640181
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2723, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640200', '大武口区', '640202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2724, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640200', '惠农区', '640205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2725, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640200', '平罗县', '640221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2726, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640300', '利通区', '640302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2727, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640300', '红寺堡区', '640303
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2728, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640300', '盐池县', '640323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2729, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640300', '同心县', '640324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2730, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640300', '青铜峡市', '640381
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2731, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640400', '原州区', '640402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2732, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640400', '西吉县', '640422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2733, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640400', '隆德县', '640423
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2734, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640400', '泾源县', '640424
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2735, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640400', '彭阳县', '640425
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2736, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640500', '沙坡头区', '640502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2737, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640500', '中宁县', '640521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2738, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '640500', '海原县', '640522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2739, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '天山区', '650102
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2740, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '沙依巴克区', '650103
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2741, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '新市区', '650104
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2742, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '水磨沟区', '650105
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2743, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '头屯河区', '650106
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2744, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '达坂城区', '650107
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2745, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '米东区', '650109
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2746, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650100', '乌鲁木齐县', '650121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2747, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650200', '独山子区', '650202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2748, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650200', '克拉玛依区', '650203
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2749, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650200', '白碱滩区', '650204
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2750, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650200', '乌尔禾区', '650205
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2751, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650400', '高昌区', '650402
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2752, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650400', '鄯善县', '650421
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2753, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650400', '托克逊县', '650422
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2754, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650500', '伊州区', '650502
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2755, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650500', '巴里坤哈萨克自治县', '650521
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2756, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '650500', '伊吾县', '650522
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2757, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '昌吉市', '652301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2758, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '阜康市', '652302
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2759, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '呼图壁县', '652323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2760, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '玛纳斯县', '652324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2761, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '奇台县', '652325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2762, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '吉木萨尔县', '652327
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2763, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652300', '木垒哈萨克自治县', '652328
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2764, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652700', '博乐市', '652701
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2765, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652700', '阿拉山口市', '652702
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2766, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652700', '精河县', '652722
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2767, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652700', '温泉县', '652723
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2768, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '库尔勒市', '652801
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2769, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '轮台县', '652822
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2770, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '尉犁县', '652823
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2771, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '若羌县', '652824
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2772, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '且末县', '652825
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2773, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '焉耆回族自治县', '652826
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2774, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '和静县', '652827
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2775, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '和硕县', '652828
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2776, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652800', '博湖县', '652829
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2777, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '阿克苏市', '652901
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2778, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '库车市', '652902
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2779, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '温宿县', '652922
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2780, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '沙雅县', '652924
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2781, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '新和县', '652925
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2782, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '拜城县', '652926
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2783, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '乌什县', '652927
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2784, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '阿瓦提县', '652928
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2785, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '652900', '柯坪县', '652929
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2786, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653000', '阿图什市', '653001
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2787, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653000', '阿克陶县', '653022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2788, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653000', '阿合奇县', '653023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2789, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653000', '乌恰县', '653024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2790, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '喀什市', '653101
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2791, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '疏附县', '653121
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2792, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '疏勒县', '653122
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2793, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '英吉沙县', '653123
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2794, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '泽普县', '653124
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2795, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '莎车县', '653125
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2796, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '叶城县', '653126
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2797, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '麦盖提县', '653127
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2798, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '岳普湖县', '653128
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2799, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '伽师县', '653129
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2800, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '巴楚县', '653130
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2801, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653100', '塔什库尔干塔吉克自治县', '653131
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2802, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '和田市', '653201
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2803, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '和田县', '653221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2804, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '墨玉县', '653222
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2805, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '皮山县', '653223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2806, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '洛浦县', '653224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2807, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '策勒县', '653225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2808, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '于田县', '653226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2809, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '653200', '民丰县', '653227
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2810, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '伊宁市', '654002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2811, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '奎屯市', '654003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2812, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '霍尔果斯市', '654004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2813, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '伊宁县', '654021
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2814, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '察布查尔锡伯自治县', '654022
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2815, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '霍城县', '654023
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2816, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '巩留县', '654024
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2817, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '新源县', '654025
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2818, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '昭苏县', '654026
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2819, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '特克斯县', '654027
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2820, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654000', '尼勒克县', '654028
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2821, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '塔城市', '654201
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2822, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '乌苏市', '654202
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2823, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '额敏县', '654221
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2824, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '沙湾县', '654223
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2825, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '托里县', '654224
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2826, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '裕民县', '654225
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2827, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654200', '和布克赛尔蒙古自治县', '654226
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2828, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '阿勒泰市', '654301
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2829, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '布尔津县', '654321
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2830, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '富蕴县', '654322
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2831, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '福海县', '654323
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2832, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '哈巴河县', '654324
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2833, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '青河县', '654325
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2834, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '654300', '吉木乃县', '654326
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2835, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '石河子市', '659001
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2836, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '阿拉尔市', '659002
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2837, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '图木舒克市', '659003
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2838, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '五家渠市', '659004
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2839, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '北屯市', '659005
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2840, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '铁门关市', '659006
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2841, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '双河市', '659007
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2842, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '可克达拉市', '659008
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2843, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '昆玉市', '659009
');
INSERT INTO geo_district (id, is_del, created_date, created_by, created_name, updated_date, updated_by, updated_name, city_code, district_name, district_code) VALUES (2844, 0, '2020-12-02 15:59:14', 'admin', '管理员', '2020-12-02 15:59:14', 'admin', '管理员', '659000', '胡杨河市', '659010
');