package com.kokaketu.business.controller;

import com.kokaketu.business.common.response.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description: 地理controller
 * @Author: admin
 * @Datetime: 2020/12/14 9:53 上午
 */
@Slf4j
@RestController
@RequestMapping("/geo")
public class GeographyController {

    /**
     * 查询城市 联动数据
     *
     * @param req
     * @return
     */
    @PostMapping("/getCityByCondition")
    public ApiResponse<List<Object>> getCityByCondition(@RequestBody Object req) {
        return ApiResponse.success();
    }

}
