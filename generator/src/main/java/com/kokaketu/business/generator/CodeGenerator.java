package com.kokaketu.business.generator;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;

public class CodeGenerator {

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    private static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入" + tip + "：");
        if (scanner.hasNext()) {
            String next = scanner.next();
            if (StringUtils.isNotEmpty(next)) {
                return next;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    private Properties getProperties(){
        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("config.properties");
        Properties properties = new Properties();
        try{
            properties.load(inputStream);
        }catch (IOException ioE){
            ioE.printStackTrace();
        }finally{
            try {
                assert inputStream != null;
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        System.out.println("dataSource.url: "+properties.getProperty("dataSource.url"));
        return properties;
    }

    public static void main(String[] args) {
        CodeGenerator codeGenerator = new CodeGenerator();

        Properties properties = codeGenerator.getProperties();

        // 代码生成器
        AutoGenerator autoGenerator = new AutoGenerator();

        // 全局配置
        GlobalConfig global = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
//        System.out.println(projectPath);
        global.setOutputDir(projectPath + "/generator/src/main/java");
        global.setAuthor("AutoGenerator");
        global.setOpen(false);
        global.setSwagger2(true); // 实体属性 Swagger2 注解
        global.setIdType(IdType.AUTO);
        global.setEntityName("%sEntity");
        global.setMapperName("%sDao");
        global.setServiceName("%sService");
        global.setXmlName("%sDao");
        global.setDateType(DateType.ONLY_DATE);
        autoGenerator.setGlobalConfig(global);

        // 数据源配置
        DataSourceConfig dataSource = new DataSourceConfig();
        dataSource.setUrl(properties.getProperty("dataSource.url"));
        // dsc.setSchemaName("public");
        dataSource.setDriverName(properties.getProperty("datasource.driver-class-name"));
        dataSource.setUsername(properties.getProperty("dataSource.username"));
        dataSource.setPassword(properties.getProperty("dataSource.password"));
        autoGenerator.setDataSource(dataSource);

        // 包配置
        PackageConfig packageConfig = new PackageConfig();
        packageConfig.setModuleName(scanner("模块名"));
        packageConfig.setParent("com.caicchina.caicinvest");
        packageConfig.setMapper("dao");
        autoGenerator.setPackageInfo(packageConfig);

        // 自定义配置
        InjectionConfig injection = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };

        // 如果模板引擎是 velocity
        String templatePath = "/templates/mapper.xml.vm";

        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/generator/src/main/resources/mapper/" + packageConfig.getModuleName()
                        + "/" + tableInfo.getXmlName() + StringPool.DOT_XML;
            }
        });
        /*
        cfg.setFileCreate(new IFileCreate() {
            @Override
            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {
                // 判断自定义文件夹是否需要创建
                checkDir("调用默认方法创建的目录");
                return false;
            }
        });
        */
        injection.setFileOutConfigList(focList);
        autoGenerator.setCfg(injection);

        // 配置模板
        TemplateConfig template = new TemplateConfig();

        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        template.setXml(null);
        template.setMapper("templates/dao.java");
        template.setService("templates/service.java");
        template.setServiceImpl("templates/serviceImpl.java");
//        template.setController("templates/controller.java");
        template.setController(null);
        autoGenerator.setTemplate(template);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        strategy.setEntityBooleanColumnRemoveIsPrefix(true);//Boolean类型字段是否移除is前缀（默认 false）
        // 公共父类
        // 写于父类中的公共字段
        strategy.setInclude(scanner("表名，多个英文逗号分割").replaceAll(" ", "").split(","));
//        strategy.setSuperMapperClass("com.caicchina.caicinvest.dao.BaseDao");
        strategy.setSuperServiceClass("com.caicchina.caicinvest.common.service.BaseService");
        strategy.setSuperServiceImplClass("com.caicchina.caicinvest.common.service.impl.BaseServiceImpl");
//        strategy.setSuperControllerClass("com.caicchina.caicinvest.controller.ApiBaseController");
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix(packageConfig.getModuleName() + "_");
        autoGenerator.setStrategy(strategy);
        autoGenerator.execute();
    }

}