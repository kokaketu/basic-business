package com.kokaketu.business.common.page;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kokaketu.business.common.utils.BeanCopyUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 分页工具类
 */
@Data
@ApiModel(value = "分页数据")
public class PageData<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "总记录数")
    private int total;

    @ApiModelProperty(value = "列表数据")
    private List<T> list;

    @ApiModelProperty(value = "当前页")
    private int currentPage;

    @ApiModelProperty(value = "总页数")
    private int totalPage;

    public PageData() {
    }

    /**
     * 分页
     *
     * @param list  列表数据
     * @param total 总记录数
     */
    public PageData(List<T> list, long total) {
        this.list = list;
        this.total = (int) total;
    }

    public PageData(List<T> list, long total, long currentPage, long totalPage) {
        this.list = list;
        this.total = (int) total;
        this.currentPage = (int) currentPage;
        this.totalPage = (int) totalPage;
    }

    public static <T> PageData<T> byMybatisPlusPage(IPage<T> page) {
        return new PageData<>(page.getRecords(), page.getTotal());
    }

    public static <T> PageData<T> empty() {
        return new PageData<>(Collections.emptyList(), 0L);
    }

    @JsonIgnore
    public boolean isEmpty() {
        return list == null || list.isEmpty();
    }

    /**
     * 通过MybatisPlus转为本class，同时将数据类型转为参数resultClass的类型，注意，此处只是复制属性
     *
     * @param page        MybatisPlus的page
     * @param resultClass 需要返回的class
     * @param <T>         源类型
     * @param <R>         目标类型
     * @return 通用page
     */
    public static <T, R> PageData<R> byMybatisPlusPage(IPage<T> page, Class<R> resultClass) {
        List<R> rs = BeanCopyUtil.copyList(page.getRecords(), resultClass);
        return new PageData<>(rs, page.getTotal());
    }

    /**
     * 通过MybatisPlus转为本class，同时将数据类型转为参数resultClass的类型，注意，此处只是复制属性
     *
     * @param page     MybatisPlus的page
     * @param function 处理的方法
     * @param <T>      源类型
     * @param <R>      目标类型
     * @return 通用page
     */
    public static <T, R> PageData<R> byMybatisPlusPage(IPage<T> page, Function<T, R> function) {
        return new PageData<>(page.getRecords().stream().map(function).collect(Collectors.toList()), page.getTotal());
    }

    public static <T, R> PageData<R> byPageData(PageData<T> page, Function<T, R> function) {
        if (CollectionUtils.isEmpty(page.getList())) {
            return PageData.empty();
        }
        return new PageData<>(page.getList().stream().map(function).collect(Collectors.toList()), page.getTotal(),
                page.getCurrentPage(), page.getTotalPage());
    }

    public static <T, R> PageData<R> byPageData(PageData<T> page, List<R> list) {
        if (CollectionUtils.isEmpty(page.getList())) {
            return PageData.empty();
        }
        return new PageData<>(list, page.getTotal(), page.getCurrentPage(), page.getTotalPage());
    }
}