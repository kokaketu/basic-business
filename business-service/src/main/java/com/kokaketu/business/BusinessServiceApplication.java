package com.kokaketu.business;

import com.kokaketu.business.common.config.MybatisPlusConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Import;

/**
 * @Description Application 启动类
 * @Author admin
 * @Date 2020/11/26 11:01 上午
 */
@SpringBootApplication
@EnableFeignClients
@EnableDiscoveryClient
@Import(MybatisPlusConfig.class)
public class BusinessServiceApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BusinessServiceApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(BusinessServiceApplication.class, args);
    }

}
