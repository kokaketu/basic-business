package com.kokaketu.business.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 区县表
 * </p>
 *
 * @author AutoGenerator
 * @since 2021-01-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("geo_district")
@ApiModel(value="GeoDistrictEntity对象", description="区县表")
public class GeoDistrictEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "是否逻辑删除:0.否 1.是")
    private Integer isDel;

    @ApiModelProperty(value = "创建时间")
    private Date createdDate;

    @ApiModelProperty(value = "创建者code")
    private String createdBy;

    @ApiModelProperty(value = "创建者名称")
    private String createdName;

    @ApiModelProperty(value = "更新时间")
    private Date updatedDate;

    @ApiModelProperty(value = "更新者code")
    private String updatedBy;

    @ApiModelProperty(value = "更新者名称")
    private String updatedName;

    @ApiModelProperty(value = "市adCode")
    private String cityCode;

    @ApiModelProperty(value = "区县名称")
    private String districtName;

    @ApiModelProperty(value = "区县adCode")
    private String districtCode;


}
