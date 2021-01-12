package com.kokaketu.business.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kokaketu.business.entity.GeoCityEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author AutoGenerator
 * @since 2021-01-12
 */
@Mapper
@Repository
public interface GeoCityDao extends BaseMapper<GeoCityEntity> {

    /**
     * 分页查询
     * @param params 查询参数
     * @return 分页列表
     */
    List<GeoCityEntity> query(Map<String, Object> params);

    /**
     * 批量删除
     * @param entities 实体集合
     * @return 操作记录数
     */
    int deleteBatch(List<GeoCityEntity> entities);
}