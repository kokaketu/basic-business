<!--
 * @Author: your name
 * @Date: 2020-07-30 09:36:09
 * @LastEditTime: 2020-09-14 14:20:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\detail.vue
-->
<template>
  <div id="diagnosis-detail" class="page">
    <div class="dia-title-container">
      <div class="dia-title-container-title" style="position: relative;">
        <h3>诊断综述</h3>
        <span style="position: absolute;right: 0;">
          <a style="display:block;text-decoration: none;min-width: 66px;
                    height: 24px;
                    background: #2960ff;
                    border-radius: 12px;
                    font-size: 10px;
                    font-family: PingFangSC;
                    font-weight: 400;
                    color: #fff;
                    line-height: 24px;
                    text-align: center;" class="btn" target="_blank"
                    href="https://asset.caicchina.com/fileservice/group1/M00/00/00/CoC3KV8jjx2AK9xAAB9kfOecRT8519.pdf">下载报告
          </a>
        </span>
      </div>
      <div class="dia-title-container-conent">
        <div>
          <div class="ant-divider ant-divider-horizontal" style="margin-top: 0px;"></div>
          <div class="zhenduanzongshu"><img class="img1"
              src="http://qiushilian.ess.ejucloud.cn/1583374593479/%E5%8D%93%E8%B6%8A%E5%95%86%E4%B8%9A%E5%B9%BF%E5%9C%BA.jpg"
              alt="">
            <div class="fir">
              <div class="title">
                <div class="margin-title">吾月广场demo</div>
                <div class="margin-dengji">四钻</div>
              </div>
              <div class="name">
                <div class="one">
                  <div class="name-size">本体信息: <span class="value-size">175000m²</span></div>
                  <div class="name-size">市场分析: <span class="value-size">新增3个</span></div>
                  <div class="name-size">竞品分析: <span class="value-size">4.4元/m²/天</span></div>
                  <div class="name-size">资产评级: <span class="value-size">四钻</span></div>
                  <div class="name-size">运营诊断: <span class="value-size">3个指标,预警提示</span></div>
                  <div class="name-size">设备诊断: <span class="value-size">空调系统</span></div>
                  <div class="name-size">交易诊断: <span class="value-size">增值型</span></div>
                  <div class="name-size">融资诊断: <span class="value-size">11亿元</span></div>
                  <div class="name-size">价值诊断: <span class="value-size">13.35亿元</span></div>
                </div>
              </div>
            </div>
          </div><span class="jieshaospan">诊断建议：</span>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>本体信息</h3><span></span>
      </div>
      <div class="dia-title-container-conent">
        <div class="title-bg">
          <div class="shuxian">
            <div class="shuxiantwo">
              <div class="bentititle">吾月广场demo <div class="bentizizhi">四钻</div>
              </div>
              <div class="bentiaddress">地址：上海市青浦区淀山湖大道218号上海青浦吾悦广场F1</div>
            </div>
          </div>
          <ul>
            <li>
              <div>建筑面积</div>
              <div>124748㎡</div>
            </li>
            <li>
              <div>竣工时间</div>
              <div>2014-01-01</div>
            </li>
            <li>
              <div>土地剩余年限</div>
              <div>30年</div>
            </li>
            <li>
              <div>土地属性</div>
              <div>B1商业用地</div>
            </li>
            <li>
              <div>翻新时间</div>
              <div>未翻新</div>
            </li>
          </ul>
        </div>
        <div class="table-div">
          <div class="ant-table-wrapper tablelist">
            <div class="ant-spin-nested-loading">
              <div class="ant-spin-container">
                <div class="ant-table ant-table-default ant-table-scroll-position-left">
                  <div class="ant-table-content">
                    <div class="ant-table-body">
                      <table class="">
                        <colgroup>
                          <col>
                          <col>
                        </colgroup>
                        <thead class="ant-table-thead">
                          <tr>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title">土地信息</span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title"></span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                          </tr>
                        </thead>
                        <tbody class="ant-table-tbody">
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="0">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>土地属性</td>
                            <td class="" style="text-align: left;">B1商业用地</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>土地获取时间</td>
                            <td class="" style="text-align: left;">2010年</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>土地成交价格</td>
                            <td class="" style="text-align: left;">12.0亿</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>产权年限</td>
                            <td class="" style="text-align: left;">40年</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>占地面积</td>
                            <td class="" style="text-align: left;">137046.4m²</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="5">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>容积率</td>
                            <td class="" style="text-align: left;">2.0</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="ant-table-wrapper table-two">
            <div class="ant-spin-nested-loading">
              <div class="ant-spin-container">
                <div class="ant-table ant-table-default ant-table-scroll-position-left">
                  <div class="ant-table-content">
                    <div class="ant-table-body">
                      <table class="">
                        <colgroup>
                          <col>
                          <col>
                        </colgroup>
                        <thead class="ant-table-thead">
                          <tr>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title">建筑信息</span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title"></span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                          </tr>
                        </thead>
                        <tbody class="ant-table-tbody">
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="0">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">建筑面积</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">175000m²</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">竣工时间</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">2014年</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">开业时间</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">2014年</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">翻新时间</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">未翻新</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">功能分区</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">商业、商业街及精品酒店</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="5">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">层高</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">首层4.1m 标准层3.3m</div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="ant-table-wrapper table-three">
            <div class="ant-spin-nested-loading">
              <div class="ant-spin-container">
                <div class="ant-table ant-table-default ant-table-scroll-position-left">
                  <div class="ant-table-content">
                    <div class="ant-table-body">
                      <table class="">
                        <colgroup>
                          <col>
                          <col>
                        </colgroup>
                        <thead class="ant-table-thead">
                          <tr>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title"></span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                            <th class="ant-table-align-left" style="text-align: left;"><span
                                class="ant-table-header-column">
                                <div><span class="ant-table-column-title"></span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                          </tr>
                        </thead>
                        <tbody class="ant-table-tbody">
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="0">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>层数</td>
                            <td class="" style="text-align: left;">3层</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>停车库面积</td>
                            <td class="" style="text-align: left;">52815m²</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>停车位数量</td>
                            <td class="" style="text-align: left;">960个</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="jtpt-css">
          <h3>交通配套</h3>
        </div>
        <div class="map">
          <img style="width: 100%" src="./img/WechatIMG794.png" alt="">
        </div>
        <div class="pttabs">
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">股东信息</li>
                <li><span>项目公司股东</span><i>金城控股集团</i></li>
                <li><span>企业属性</span><i>民营</i></li>
                <li><span>企业占位</span><i>TOP8</i></li>
                <li><span>企业市值</span><i>876亿</i></li>
                <li><span>销售额</span><i>2200亿</i></li>
                <li><span>信用评级</span><i>AAA</i></li>
                <li><span>主营业务</span><i>房地产</i></li>
              </ul>
            </div>
          </div>
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">业主信息</li>
                <li><span>业主</span><i>金城控股集团</i></li>
                <li><span>信用评级</span><i>AAA</i></li>
              </ul>
            </div>
            <div style="padding: 10px;"></div>
          </div>
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">相关公司</li>
                <li><span>开发商</span><i>金城控股集团</i></li>
                <li><span>设计公司</span><i>江苏筑森建筑设计有限公司</i></li>
                <li><span>运营公司</span><i>金城控股集团</i></li>
                <li><span>物管公司</span><i>金城控股集团</i></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>市场分析</h3><span>上海商业-2019年第一季度市场分析报告</span>
      </div>
      <div class="dia-title-container-conent">
        <div class="title-bg">
          <div class="title-bg-list"><span>宏观</span><span>上海经济开局平稳，社会零售总额增速放缓</span></div>
          <div class="title-bg-list"><span>市场</span><span>租金增速放缓，首店效应仍占主流</span></div>
          <div class="title-bg-list"><span>政策</span><span>本季无重大政策</span></div>
          <div class="title-bg-list"><span>交易</span><span>虹口区、青浦区表现活跃</span></div>
        </div>
        <div>
          <img style="width: 100%;" src="./img/WechatIMG796.png" alt="">
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>竞品分析</h3><span></span>
      </div>
      <img  style="width: 100%;" src="./img/WechatIMG795.png" alt="">
      <ul class="dia-tabs-contanier">
        <li class="active">均值分析</li>
      </ul>
      <div style="display: block;">
        <div class="table-container jzfx-table">
          <table class="zd-table-common" width="100%">
            <thead>
              <tr class="grey">
                <th class="text-left">指标名称</th>
                <th>平均值</th>
                <th>中位数</th>
                <th>最高</th>
                <th>最低</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-left">资产星级</td>
                <td class="text-left">3.7</td>
                <td class="text-left">4</td>
                <td class="text-left">4</td>
                <td class="text-left">3</td>
              </tr>
              <tr>
                <td class="text-left">开业年限</td>
                <td class="text-left">2013</td>
                <td class="text-left">2016</td>
                <td class="text-left">2018</td>
                <td class="text-left">2005</td>
              </tr>
              <tr>
                <td class="text-left">经营建筑面积</td>
                <td class="text-left">56666.7㎡</td>
                <td class="text-left">85000.0㎡</td>
                <td class="text-left">71500.0㎡</td>
                <td class="text-left">13500.0㎡</td>
              </tr>
              <tr>
                <td class="text-left">楼层数</td>
                <td class="text-left">4</td>
                <td class="text-left">4</td>
                <td class="text-left">5</td>
                <td class="text-left">2</td>
              </tr>
              <tr>
                <td class="text-left">主力店面积占比</td>
                <td class="text-left">18%</td>
                <td class="text-left">20%</td>
                <td class="text-left">21%</td>
                <td class="text-left">18%</td>
              </tr>
              <tr>
                <td class="text-left">零售业态面积占比</td>
                <td class="text-left">58%</td>
                <td class="text-left">80%</td>
                <td class="text-left">85%</td>
                <td class="text-left">15%</td>
              </tr>
              <tr>
                <td class="text-left">出租率</td>
                <td class="text-left">99%</td>
                <td class="text-left">100%</td>
                <td class="text-left">100%</td>
                <td class="text-left">97%</td>
              </tr>
              <tr>
                <td class="text-left">开业率</td>
                <td class="text-left">98%</td>
                <td class="text-left">99%</td>
                <td class="text-left">100%</td>
                <td class="text-left">95%</td>
              </tr>
              <tr>
                <td class="text-left">平均租金</td>
                <td class="text-left">4.4元/㎡/天</td>
                <td class="text-left">4.4元/㎡/天</td>
                <td class="text-left">6.0元/㎡/天</td>
                <td class="text-left">2.7元/㎡/天</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>资产诊断</h3><span></span>
      </div>
      <div class="dia-title-container-conent">
        <div class="zczd-container">
          <div class="zczd-left" style="max-height: 400px; overflow: auto;">
            <ul>
              <li>
                <h3>商用价值：</h3>
                <p>周边3km以内居住区人口50万以上，但在外环线以外地区级商业中心，区位价值一般；</p>
              </li>
              <li>
                <h3>交通价值：</h3>
                <p>与轨交距离较远，但自驾及公交系统较为便捷</p>
              </li>
              <li>
                <h3>外部条件：</h3>
                <p>建筑立面辨识度高，外广场视野开阔，但与周边商业链接不强</p>
              </li>
              <li>
                <h3>建筑指标：</h3>
                <p>建筑规模较大；楼龄较新；商铺切分较为合理</p>
              </li>
              <li>
                <h3>动向设计：</h3>
                <p>动线整体较清晰，人车货分流，出入口数量合理且通达性强；电梯、电力、中央空调基础设备配置标准较高，支撑高人流量</p>
              </li>
              <li>
                <h3>配套设施：</h3>
                <p>导视系统清晰，兼顾特殊人群需要，卫生间功能较齐全；停车位配不足</p>
              </li>
              <li>
                <h3>运营水平：</h3>
                <p>运营较好，出租率较高；项目人气位于所在商圈或区域TOP20%；商场坪效较略低</p>
              </li>
              <li>
                <h3>管理：</h3>
                <p>运营公司及物业公司均为国内知名物业品牌公司、优秀品牌企业</p>
              </li>
            </ul>
          </div>
          <div class="zczd-right">
            <img style="margin-left: 20%;width: 60%;" src="./img/WechatIMG797.png" alt="">
          </div>
        </div>
        <ul class="dia-tabs-contanier">
          <li class="active">地缘</li>
          <li class="">建筑</li>
          <li class="">服务</li>
        </ul>
        <div style="max-height: 350px; overflow: auto;">
          <div class="ant-table-wrapper">
            <div class="ant-spin-nested-loading">
              <div class="ant-spin-container">
                <div class="ant-table ant-table-default ant-table-scroll-position-left">
                  <div class="ant-table-content">
                    <div class="ant-table-body">
                      <table class="">
                        <colgroup>
                          <col>
                          <col>
                          <col>
                        </colgroup>
                        <thead class="ant-table-thead">
                          <tr>
                            <th class=""><span class="ant-table-header-column">
                                <div><span class="ant-table-column-title">指标名称</span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                            <th class=""><span class="ant-table-header-column">
                                <div><span class="ant-table-column-title">实际情况</span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                            <th class=""><span class="ant-table-header-column">
                                <div><span class="ant-table-column-title">测评</span><span
                                    class="ant-table-column-sorter"></span></div>
                              </span></th>
                          </tr>
                        </thead>
                        <tbody class="ant-table-tbody">
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="0">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>区位价值</td>
                            <td class="">外环外区级商业</td>
                            <td class="">地区级商圈</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>客群价值</td>
                            <td class="">3km内客群成熟</td>
                            <td class="">优秀</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>地铁系统</td>
                            <td class="">距离地铁&gt;1000m</td>
                            <td class="">通达性差</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>自驾系统</td>
                            <td class="">临3条主干道</td>
                            <td class="">通达性好</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>公交系统</td>
                            <td class="">1-2条公交主干线</td>
                            <td class="">通达性好</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>运营诊断</h3><span></span>
      </div>
      <div class="dia-title-container-conent">
        <div class="yyzd-chart-sb">
          <div class="chart">
            <img style="margin-left: 20%;width: 60%;" src="./img/WechatIMG798.png" alt="">
          </div>
          <ul class="sb">
            <li>
              <h3>收入表现：</h3>
              <p>出租率 93.5%，表现健康。收入维度下50%指标表现优秀，50%指标表现健康。</p>
            </li>
            <li>
              <h3>支出表现：</h3>
              <p>经营毛利率56%，表现优秀。支出维度下67%指标表现优秀，33%指标表现不健康。</p>
            </li>
            <li>
              <h3>可持续性：</h3>
              <p>租售比6.8%，表现优秀。可持续性维度下40%指标表现优秀，20%指标表现健康，40%指标表现不健康。</p>
            </li>
          </ul>
        </div>
        <ul class="dia-tabs-contanier">
          <li class="active">收入表现</li>
          <li class="">支出表现</li>
          <li class="">可持续性</li>
        </ul>
        <div>
          <img style="width: 100%;" src="./img/WechatIMG799.png" alt="">
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>交易诊断</h3>
      </div>
      <div class="ant-row" style="margin-left: -16px; margin-right: -16px;">
        <div class="ant-col ant-col-12" style="padding-left: 16px; padding-right: 16px;">
          <img style="margin-left: 20%;width: 60%;" src="./img/WechatIMG800.png" alt="">
        </div>
        <div class="ant-col ant-col-12" style="padding-left: 16px; padding-right: 16px;">
          <div class="trade-chart-explain">
            <div class="explain-title">增值型</div>
            <div class="explain-title-tip">(风险中立型买家)</div>
            <div class="explain-title" style="margin-top: 20px;">总结：</div>
            <div class="explain-title-tip">该资产属于增值型资产（Value
              Added），位于核心城市潜力板块，城市活跃度较高，但板块活跃度欠佳，资产运营良好；该资产受风险中立型买家欢迎，近年来商业地产大宗交易买家以外资及险资为主，但基本集中在核心区及次核心区。</div>
          </div>
        </div>
      </div>
      <div style="margin-top: 30px;">
        <div class="ant-table-wrapper">
          <div class="ant-spin-nested-loading">
            <div class="ant-spin-container">
              <div class="ant-table ant-table-default ant-table-scroll-position-left">
                <div class="ant-table-content">
                  <div class="ant-table-body">
                    <table class="">
                      <colgroup>
                        <col style="width: 15%; min-width: 15%;">
                        <col>
                        <col style="width: 10%; min-width: 10%;">
                      </colgroup>
                      <thead class="ant-table-thead">
                        <tr>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">指标名称</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">说明</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">评价</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                        </tr>
                      </thead>
                      <tbody class="ant-table-tbody">
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="城市交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>城市交易活跃度</td>
                          <td class="">该资产位于上海，近三年城市交易100宗以上，活跃度位于境内城市首位</td>
                          <td class="">活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="城市增长潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>城市增长潜力</td>
                          <td class="">该资产位于上海，城市增长潜力仅次于深圳和北京，位于境内城市TOP3</td>
                          <td class="">大</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="板块交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>板块交易活跃度</td>
                          <td class="">该资产位于青浦镇板块，板块内近三年无大宗成交，板块交易活跃度低</td>
                          <td class="">不活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="板块增长潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>板块增长潜力</td>
                          <td class="">该资产位于青浦镇板块，距离上海2040年规划五个新城中心之一的青浦新城中心小于3km，板块增长潜力一般</td>
                          <td class="">一般</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="类型交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>类型交易活跃度</td>
                          <td class="">该资产为商业类型，该类型物业近三年大宗交易频繁</td>
                          <td class="">活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="项目交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>项目交易活跃度</td>
                          <td class="">该资产发布东证资管-青浦吾悦广场资产支持专项计划金融产品，新城控股将其全部相关权益转让给东证资管，资产交易1次</td>
                          <td class="">较不活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="运营提升潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>运营提升潜力</td>
                          <td class="">项目资产2项运营指标均低于竞品均值，与周边竞品相比处于中下水平，此外其主力店占比较高，提升潜力较大</td>
                          <td class="">较大</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="硬件改造潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>硬件改造潜力</td>
                          <td class="">该资产楼龄5年，配套设施较新，外立面设计时尚前卫，内部结构匹配项目功能需求，整体硬件改造潜力一般</td>
                          <td class="">一般</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="产权完整性">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>产权完整性</td>
                          <td class="">该资产为单一产权，利于产权交易</td>
                          <td class="">强</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="产权剩余时限">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>产权剩余时限</td>
                          <td class="">该资产剩余产权31年，运营改造时间充裕</td>
                          <td class="">较充足</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>融资诊断</h3>
      </div>
      <div class="financing-summarize-contain">
        <div class="ant-row" style="margin-left: -10px; margin-right: -10px;">
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">融资金额</strong>11亿元</div>
          </div>
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">融资利率</strong>5.5-6.5%</div>
          </div>
          <div class="ant-col ant-col-24" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize" style="margin-top: 20px;"><strong class="title">综述</strong></div>
          </div>
        </div>
      </div>
      <div class="financing-way-contain">
        <div class="ant-row" style="margin-left: -39px; margin-right: -39px;">
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way">
              <dt class="financing-way-title">融资方式1：银行抵押贷款</dt>
              <dd class="financing-way-item"><span class="title">融资规模</span><span>折扣率40%-60%</span></dd>
              <dd class="financing-way-item"><span class="title">融资成本</span><span>基准利率{4.35%}上浮30%起</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>1-5年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>资产抵押
                  保证担保</span></dd>
              <dd class="financing-way-item"><span class="title">适用性</span><span>一般</span></dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way">
              <dt class="financing-way-title">融资方式2：CMBS</dt>
              <dd class="financing-way-item"><span class="title">融资规模</span><span>折扣率40%-70%</span></dd>
              <dd class="financing-way-item"><span class="title">融资成本</span><span>优先级利率5-7%</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>10-20年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>优先次级分层
                  超额现金流覆盖
                  保证担保
                  差额支付承诺
                  流动性支持
                  资产抵押
                  保证金机制
                  信用下降触发机制
                  购买次级债</span></dd>
              <dd class="financing-way-item"><span class="title">适用性</span><span>强</span></dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way">
              <dt class="financing-way-title">融资方式3：REITs</dt>
              <dd class="financing-way-item"><span class="title">融资规模</span><span>折扣率80%-100%</span></dd>
              <dd class="financing-way-item"><span class="title">融资成本</span><span>优先级利率5-7%</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>10-20年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>优先次级分层
                  超额现金流覆盖
                  差额支付承诺
                  保证金机制
                  租金补足承诺</span></dd>
              <dd class="financing-way-item"><span class="title">适用性</span><span>强</span></dd>
            </dl>
          </div>
        </div>
      </div>
      <div style="width: 65%; margin: 25px 0px;">
        <div class="ant-row" style="margin-left: -15px; margin-right: -15px;">
          <div class="ant-col ant-col-14" style="padding-left: 15px; padding-right: 15px;">
            <div class="ant-table-wrapper diagnose-table-simple">
              <div class="ant-spin-nested-loading">
                <div class="ant-spin-container">
                  <div class="ant-table ant-table-default ant-table-scroll-position-left">
                    <div class="ant-table-content">
                      <div class="ant-table-body">
                        <table class="">
                          <colgroup>
                            <col>
                            <col>
                          </colgroup>
                          <thead class="ant-table-thead">
                            <tr>
                              <th class="" colspan="2"><span class="ant-table-header-column">
                                  <div><span class="ant-table-column-title">资产信息</span><span
                                      class="ant-table-column-sorter"></span></div>
                                </span></th>
                            </tr>
                          </thead>
                          <tbody class="ant-table-tbody">
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产评级">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>资产评级</td>
                              <td class="">4钻</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产类型">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>资产类型</td>
                              <td class="">商业</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所在城市">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所在城市</td>
                              <td class="">上海</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所在区位/环线">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所在区位/环线</td>
                              <td class="">青浦镇/外环外</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="周边交通">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>周边交通</td>
                              <td class="">距离17号线1.6公里</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产规模">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>资产规模</td>
                              <td class="">86348.8m²</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="开业时间">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>开业时间</td>
                              <td class="">2014年</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="土地剩余年限">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>土地剩余年限</td>
                              <td class="">33.3</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="运营主体">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>运营主体</td>
                              <td class="">金城控股集团</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="ant-col ant-col-10" style="padding-left: 15px; padding-right: 15px;">
            <div class="ant-table-wrapper diagnose-table-simple">
              <div class="ant-spin-nested-loading">
                <div class="ant-spin-container">
                  <div class="ant-table ant-table-default ant-table-scroll-position-left">
                    <div class="ant-table-content">
                      <div class="ant-table-body">
                        <table class="">
                          <colgroup>
                            <col>
                            <col>
                          </colgroup>
                          <thead class="ant-table-thead">
                            <tr>
                              <th class="" colspan="2"><span class="ant-table-header-column">
                                  <div><span class="ant-table-column-title">主体信息</span><span
                                      class="ant-table-column-sorter"></span></div>
                                </span></th>
                            </tr>
                          </thead>
                          <tbody class="ant-table-tbody">
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="业主公司评级">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>业主公司评级</td>
                              <td class="">AAA（中诚信证券评估）</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="母公司评级">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>母公司评级</td>
                              <td class="">-</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="企业性质">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>企业性质</td>
                              <td class="">民营</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所属行业">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所属行业</td>
                              <td class="">房地产</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="净资产(亿)">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>净资产(亿)</td>
                              <td class="">295</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div class="ant-table-wrapper">
          <div class="ant-spin-nested-loading">
            <div class="ant-spin-container">
              <div class="ant-table ant-table-default ant-table-scroll-position-left">
                <div class="ant-table-content">
                  <div class="ant-table-body">
                    <table class="">
                      <colgroup>
                        <col style="width: 33%; min-width: 33%;">
                        <col style="width: 33%; min-width: 33%;">
                        <col style="width: 33%; min-width: 33%;">
                      </colgroup>
                      <thead class="ant-table-thead">
                        <tr>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">指标</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">指标值</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">行业参考值</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                        </tr>
                      </thead>
                      <tbody class="ant-table-tbody">
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产负债率%">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>资产负债率%</td>
                          <td class="">84.57%</td>
                          <td class="">68%</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="流动比率">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>流动比率</td>
                          <td class="">1.17</td>
                          <td class="">1.94</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="速动比率">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>速动比率</td>
                          <td class="">0.53</td>
                          <td class="">0.75</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="年营业总收入(亿)">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>年营业总收入(亿)</td>
                          <td class="">541.33</td>
                          <td class="">-</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="年营业总收入增长率%">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>年营业总收入增长率%</td>
                          <td class="">33.58%</td>
                          <td class="">-</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA(亿)">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA(亿)</td>
                          <td class="">163.51</td>
                          <td class="">8.06</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="全部债务/EBITDA">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>全部债务/EBITDA</td>
                          <td class="">17.09</td>
                          <td class="">11.85</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="ROE">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>ROE</td>
                          <td class="">41.05%</td>
                          <td class="">4.25%</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA/利息费用">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA/利息费用</td>
                          <td class="">51.15</td>
                          <td class="">4.22</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div style="margin-top: 30px;">
        <div class="ant-table-wrapper">
          <div class="ant-spin-nested-loading">
            <div class="ant-spin-container">
              <div class="ant-table ant-table-default ant-table-scroll-position-left">
                <div class="ant-table-content">
                  <div class="ant-table-body">
                    <table class="">
                      <colgroup>
                        <col style="width: 33%; min-width: 33%;">
                        <col style="width: 33%; min-width: 33%;">
                        <col style="width: 33%; min-width: 33%;">
                      </colgroup>
                      <thead class="ant-table-thead">
                        <tr>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">指标</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">指标值</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">行业参考值</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                        </tr>
                      </thead>
                      <tbody class="ant-table-tbody">
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA覆盖利息倍数">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA覆盖利息倍数</td>
                          <td class="">50.74</td>
                          <td class="">1.3-4</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA覆盖本息倍数">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA覆盖本息倍数</td>
                          <td class="">2.75</td>
                          <td class="">1.1-2</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>价值诊断<i aria-label="图标: question-circle" class="anticon anticon-question-circle"
            style="margin-left: 10px;"><svg viewBox="64 64 896 896" focusable="false" class=""
              data-icon="question-circle" width="1em" height="1em" fill="currentColor" aria-hidden="true">
              <path
                d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z">
              </path>
              <path
                d="M623.6 316.7C593.6 290.4 554 276 512 276s-81.6 14.5-111.6 40.7C369.2 344 352 380.7 352 420v7.6c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8V420c0-44.1 43.1-80 96-80s96 35.9 96 80c0 31.1-22 59.6-56.1 72.7-21.2 8.1-39.2 22.3-52.1 40.9-13.1 19-19.9 41.8-19.9 64.9V620c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8v-22.7a48.3 48.3 0 0 1 30.9-44.8c59-22.7 97.1-74.7 97.1-132.5.1-39.3-17.1-76-48.3-103.3zM472 732a40 40 0 1 0 80 0 40 40 0 1 0-80 0z">
              </path>
            </svg></i></h3>
      </div>
      <div class="financing-summarize-contain">
        <div class="ant-row" style="margin-left: -10px; margin-right: -10px;">
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">资产估值</strong>13.35亿元</div>
          </div>
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">单价</strong>10500元/㎡</div>
          </div>
        </div>
      </div>
      <div class="financing-way-contain">
        <div class="ant-row" style="margin-left: -39px; margin-right: -39px;">
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">资产数据/状况</dt>
              <dd class="financing-way-item"><span class="title">土地用途</span>B1商业用地</dd>
              <dd class="financing-way-item"><span class="title">土地剩余使用年限</span>31年</dd>
              <dd class="financing-way-item"><span class="title">建筑面积</span>124748㎡</dd>
              <dd class="financing-way-item"><span class="title">使用现状</span>商业</dd>
              <dd class="financing-way-item"><span class="title">资产诊断</span>4钻</dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">运营数据/状况</dt>
              <dd class="financing-way-item"><span class="title">月租金</span>73.3元/㎡</dd>
              <dd class="financing-way-item"><span class="title">其他收入</span>329545元/月</dd>
              <dd class="financing-way-item"><span class="title">出租率</span>100%</dd>
              <dd class="financing-way-item"><span class="title">运营费用</span>5029656元/月</dd>
              <dd class="financing-way-item"><span class="title">运营诊断</span>3个指标预警</dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">运营数据/状况</dt>
              <dd class="financing-way-item"><span class="title">产权集中度</span>单一产权</dd>
              <dd class="financing-way-item"><span class="title">改造合规性</span>合规</dd>
              <dd class="financing-way-item"><span class="title">交易评级</span>增值型资产</dd>
            </dl>
          </div>
        </div>
      </div>
      <div style="margin-top: 25px;">
        <div class="ant-table-wrapper">
          <div class="ant-spin-nested-loading">
            <div class="ant-spin-container">
              <div class="ant-table ant-table-default ant-table-scroll-position-left">
                <div class="ant-table-content">
                  <div class="ant-table-body">
                    <table class="">
                      <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                      </colgroup>
                      <thead class="ant-table-thead">
                        <tr>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">项目名称</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">所在版块</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">建筑面积(m²)</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">交易单价(元)</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                          <th class=""><span class="ant-table-header-column">
                              <div><span class="ant-table-column-title">相似程度</span><span
                                  class="ant-table-column-sorter"></span></div>
                            </span></th>
                        </tr>
                      </thead>
                      <tbody class="ant-table-tbody">
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="华侨城O'Mall">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>华侨城O'Mall</td>
                          <td class="">浦江镇板块</td>
                          <td class="">86000</td>
                          <td class="">17400</td>
                          <td class="">相似</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="南翔太茂">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>南翔太茂</td>
                          <td class="">嘉定南翔板块</td>
                          <td class="">50000</td>
                          <td class="">14000</td>
                          <td class="">较相似</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="三林城市商业广场">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>三林城市商业广场</td>
                          <td class="">浦东三林板块</td>
                          <td class="">153000</td>
                          <td class="">15800</td>
                          <td class="">较相似</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <img style="width: 100%;" src="./img/WechatIMG801.png" alt="">
    </div>
    <div class="zd-xf-modal toggle-come-out">
      <div class="toggle"><i aria-label="图标: right" class="anticon anticon-right"><svg viewBox="64 64 896 896"
            focusable="false" class="" data-icon="right" width="1em" height="1em" fill="currentColor"
            aria-hidden="true">
            <path
              d="M765.7 486.8L314.9 134.7A7.97 7.97 0 0 0 302 141v77.3c0 4.9 2.3 9.6 6.1 12.6l360 281.1-360 281.1c-3.9 3-6.1 7.7-6.1 12.6V883c0 6.7 7.7 10.4 12.9 6.3l450.8-352.1a31.96 31.96 0 0 0 0-50.4z">
            </path>
          </svg></i></div>
      <ul>
        <li>
          <div class="">本体信息</div><span></span>
        </li>
        <li>
          <div class="">市场分析</div><span></span>
        </li>
        <li>
          <div class="">竞品分析</div><span></span>
        </li>
        <li>
          <div class="">资产诊断</div><span></span>
        </li>
        <li>
          <div class="">运营诊断</div><span></span>
        </li>
        <li>
          <div class="">交易诊断</div><span></span>
        </li>
        <li>
          <div class="">融资诊断</div><span></span>
        </li>
        <li>
          <div class="">价值诊断</div><span></span>
        </li>
        <li>
          <div class="">设备诊断</div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
</script>
<style lang="scss" scoped>
  #diagnosis-detail {
    padding-right: 150px;
  }

  .dia-title-container {
    background: #fff;
    -webkit-box-shadow: 0 4px 6px 0 hsla(0, 4%, 95%, .5);
    box-shadow: 0 4px 6px 0 hsla(0, 4%, 95%, .5);
    border-radius: 10px;
    width: 100%;
    padding: 0 24px 32px;
    margin-bottom: 24px;
    color: #1f242d;
    font-size: 15px;
    box-sizing: border-box;
  }

  .dia-title-container .dia-title-container-title {
    padding: 24px 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .dia-title-container .dia-title-container-title h3 {
    font-size: 18px;
    color: #1f242d;
  }

  .ant-divider-horizontal {
    display: block;
    clear: both;
    width: 100%;
    min-width: 100%;
    height: 1px;
    margin: 24px 0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    color: rgba(0, 0, 0, .65);
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5;
    list-style: none;
    -webkit-font-feature-settings: "tnum";
    font-feature-settings: "tnum";
    background: #e8e8e8;
  }

  .zhenduanzongshu {
    display: -ms-flexbox;
    display: flex;
  }

  .zhenduanzongshu .img1 {
    display: block;
    width: 270px;
    height: 160px;
    margin-bottom: 20px;
    margin-right: 24px;
    border-radius: 8px;
    background-color: #f5f5f5;
  }

  .zhenduanzongshu .fir {
    -ms-flex: 1 1;
    flex: 1 1;
    height: 160px;
  }

  .zhenduanzongshu .fir .title {
    display: -ms-flexbox;
    display: flex;
    height: 50%;
  }

  .zhenduanzongshu .fir .title .margin-title {
    margin-right: 10px;
    font-size: 20px;
    font-family: PingFangSC;
    font-weight: 500;
    color: #16233d;
    line-height: 28px;
  }

  .zhenduanzongshu .fir .title .margin-dengji {
    min-width: 66px;
    height: 24px;
    background: #2960ff;
    border-radius: 12px;
    font-size: 10px;
    font-family: PingFangSC;
    font-weight: 400;
    color: #fff;
    line-height: 24px;
    text-align: center;
  }

  .zhenduanzongshu .fir .name {
    width: 100%;
    height: 50%;
  }

  .zhenduanzongshu .fir .name .one {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
  }

  .zhenduanzongshu .fir .name .one .name-size {
    width: 33.33333%;
    margin-bottom: 9px;
    font-size: 15px;
    font-weight: 400;
    color: #1f242d;
    line-height: 21px;
  }

  .zhenduanzongshu .fir .name .one .value-size {
    font-size: 16px;
    font-weight: 600;
    color: #1f242d;
    line-height: 21px;
  }

  .jieshaospan {
    display: inline-block;
    font-size: 12px;
    height: 20px;
    color: #f5a623;
  }

  .title-bg {
    width: 100%;
    background: #f7f7f7;
    border-radius: 6px;
    display: -ms-flexbox;
    margin-bottom: 15px 25px;
    display: flex;
    padding: 25px;
    box-sizing: border-box;
  }

  .title-bg .shuxian {
    padding: 31px 0;
  }

  .title-bg .shuxian .shuxiantwo {
    border-right: 1px solid #e1e1e1;
    padding-right: 34px;
  }

  .title-bg .shuxian .shuxiantwo .bentititle {
    display: -ms-flexbox;
    display: flex;
    padding-left: 24px;
    padding-bottom: 15px;
    width: auto;
    font-size: 18px;
    font-family: PingFangSC;
    font-weight: 500;
    color: #16233d;
    line-height: 25px;
  }

  .title-bg .shuxian .shuxiantwo .bentiaddress {
    width: 180px;
    font-size: 15px;
    font-family: PingFangSC;
    font-weight: 400;
    color: #1f242d;
    line-height: 21px;
    padding-left: 24px;
  }

  .title-bg .shuxian .shuxiantwo .bentizizhi {
    min-width: 66px;
    height: 24px;
    background: #2960ff;
    border-radius: 12px;
    font-size: 10px;
    font-family: PingFangSC;
    font-weight: 400;
    color: #fff;
    line-height: 24px;
    text-align: center;
    margin-left: 10px;
  }

  .title-bg>ul,
  .title-bg>ul>li {
    display: -ms-flexbox;
    display: flex;
  }

  .title-bg>ul>li {
    width: 200px;
    -ms-flex-pack: center;
    justify-content: center;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
  }

  .title-bg>ul>li div:first-child {
    font-size: 15px;
    font-family: PingFangSC;
    font-weight: 400;
    color: #828baa;
    line-height: 20px;
    margin-bottom: 15px;
  }

  .title-bg>ul>li div:last-child {
    font-size: 20px;
    font-family: DINAlternate;
    font-weight: 700;
    color: #1f242d;
    line-height: 26px;
  }

  .table-div {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: row;
    flex-direction: row;
    margin-top: 25px;
  }

  .table-div .tablelist {
    width: 38%;
  }

  .table-div .table-two {
    width: 31%;
  }

  .table-div .table-three {
    -ms-flex: 1 1;
    flex: 1 1;
  }

  .ant-table table {
    width: 100%;
    text-align: left;
    border-radius: 4px 4px 0 0;
    border-collapse: collapse;
  }

  .ant-table-thead>tr:first-child>th:first-child {
    border-top-left-radius: 4px;
  }

  .ant-table thead tr th {
    color: #8fa1b7;
    border-bottom: 0;
    background-color: #f7f8f9;
  }

  .ant-table-thead>tr>th .ant-table-header-column {
    display: inline-block;
    vertical-align: top;
  }

  .ant-table-tbody>tr>td,
  .ant-table-thead>tr>th {
    padding: 16px;
  }

  .ant-table tbody tr td {
    color: #445870;
    border-bottom: 1px solid #eff3f8 !important;
  }

  .jtpt-css {
    padding: 24px 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .jtpt-css h3 {
    font-size: 18px;
    color: #1f242d;
  }

  .pttabs {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .pttabs .pt-table-list {
    width: 32%;
  }

  .pt-tabs-tmpl {
    width: 100%;
    margin-top: 40px;
    border: 1px solid #edf0f3;
  }

  .pt-tabs-tmpl ul {
    width: 100%;
    overflow: hidden;
  }

  .pt-tabs-tmpl .pt-tabs-tmpl-title {
    font-size: 15px;
    font-weight: 400;
    color: #445870;
    padding: 15px 20px;
    background: #f7f8f9;
  }

  .pt-tabs-tmpl li+li {
    border-top: 1px solid #edf0f3;
  }

  .pt-tabs-tmpl li span {
    display: block;
    width: 30%;
    line-height: 1.2;
    color: #445870;
  }

  .pt-tabs-tmpl li i {
    display: block;
    font-style: normal;
    width: 60%;
    line-height: 1.2;
    color: #1f242d;
  }

  .pt-tabs-tmpl li {
    width: 100%;
    padding: 15px 20px;
    font-size: 15px;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
  }

  .pt-tabs-tmpl .pt-label {
    display: block;
  }

  .dia-title-container .dia-title-container-title {
    padding: 24px 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
  }

  .dia-title-container .dia-title-container-title h3 {
    font-size: 18px;
    color: #1f242d;
  }

  .dia-title-container .dia-title-container-title span {
    margin-left: 10px;
    font-size: 14px;
    font-weight: 400;
    color: #efb351;
    line-height: 20px;
  }

  .title-bg {
    width: 100%;
    background: #f7f7f7;
    border-radius: 6px;
    display: -ms-flexbox;
    margin-bottom: 15px 25px;
    display: flex;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding: 25px;
    box-sizing: border-box;
  }

  .title-bg .title-bg-list {
    width: 40%;
    display: -ms-flexbox;
    display: flex;
    padding: 10px 0;
  }

  .title-bg .title-bg-list span:first-child {
    width: 50px;
    color: #1f242d;
    font-size: 15px;
    font-weight: 700;
  }

  .title-bg .title-bg-list span:last-child {
    -ms-flex: 1 1;
    flex: 1 1;
    font-size: 16px;
    color: #1f242d;
  }

  .dia-tabs-contanier {
    display: -ms-flexbox;
    display: flex;
    padding: 15px 0;
  }

  .dia-tabs-contanier li.active,
  .dia-tabs-contanier li:hover {
    background: #2960ff;
    border-radius: 16px;
    color: #fff;
  }

  .dia-tabs-contanier li {
    height: 32px;
    padding: 0 15px;
    color: #5b6890;
    font-size: 15px;
    line-height: 32px;
    cursor: pointer;
    -webkit-transition: all .5s;
    -o-transition: .5s all;
    transition: all .5s;
    border-radius: 16px;
    margin-right: 10px;
  }

  .table-container {
    width: 100%;
    overflow: hidden;
    overflow-x: auto;
  }

  .zd-table-common {
    display: table;
    border-collapse: collapse;
    border-spacing: 0;
    border: none;
    min-width: 100%;
  }

  .zd-table-common thead {
    display: table-header-group;
    background-color: #edf0f3;
  }

  .zd-table-common tbody,
  .zd-table-common tr>th {
    text-align: left;
    font-size: 15px;
    line-height: 21px;
  }

  .zd-table-common tr {
    display: table-row;
    border-bottom: .5px solid #edf0f3;
  }

  .zd-table-common tr>th {
    width: 200px;
    padding: 14px 15px;
    color: #939fa9;
    font-weight: 400;
  }

  .zd-table-common tr>th {
    width: 200px;
    padding: 14px 15px;
    color: #939fa9;
    font-weight: 400;
  }

  .zd-table-common tr {
    display: table-row;
    border-bottom: .5px solid #edf0f3;
  }

  .jzfx-table tr>td:first-child {
    white-space: nowrap;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
  }

  .zd-table-common tr>td:first-child {
    width: 190px;
    padding-left: 15px;
  }

  .zd-table-common tr>td {
    padding: 14px;
    text-align: left;
  }

  .zczd-container {
    width: 100%;
    display: -ms-flexbox;
    display: flex;
  }

  .zczd-container .zczd-left {
    width: 60%;
    max-height: 400px;
    overflow: auto;
  }

  .zczd-container .zczd-left>ul li {
    width: 100%;
    padding: 8px 0;
  }

  .zczd-container .zczd-left>ul h3 {
    font-size: 16px;
    color: #1f242d;
  }

  .zczd-container .zczd-left>ul p {
    font-size: 15px;
    color: #1f242d;
    width: 100%;
    word-wrap: break-word;
    margin-top: 10px;
  }

  .dia-tabs-contanier {
    display: -ms-flexbox;
    display: flex;
    padding: 15px 0;
  }

  .dia-tabs-contanier li.active,
  .dia-tabs-contanier li:hover {
    background: #2960ff;
    border-radius: 16px;
    color: #fff;
  }

  .dia-tabs-contanier li {
    height: 32px;
    padding: 0 15px;
    color: #5b6890;
    font-size: 15px;
    line-height: 32px;
    cursor: pointer;
    -webkit-transition: all .5s;
    -o-transition: .5s all;
    transition: all .5s;
    border-radius: 16px;
    margin-right: 10px;
  }

  .ant-table-wrapper {
    zoom: 1;
  }

  .yyzd-chart-sb {
    width: 100%;
    display: -ms-flexbox;
    display: flex;
  }

  .yyzd-chart-sb>div,
  .yyzd-chart-sb>ul.sb {
    width: 50%;
  }

  .yyzd-chart-sb>ul.sb li {
    background: #f7f7f7;
    margin-bottom: 20px;
    padding: 18px 24px;
  }

  .yyzd-chart-sb>ul.sb h3 {
    font-size: 16px;
    color: #1f242d;
  }

  .yyzd-chart-sb>ul.sb p {
    font-size: 15px;
    color: #1f242d;
    line-height: 21px;
    margin-top: 5px;
  }

  .ant-col-12 {
    float: left;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 50%;
  }

  .trade-chart-explain .explain-title {
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: 700;
    line-height: 22px;
  }

  .trade-chart-explain .explain-title-tip {
    line-height: 21px;
  }

  .trade-chart-explain .explain-title {
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: 700;
    line-height: 22px;
  }

  .trade-chart-explain .explain-title-tip {
    line-height: 21px;
  }

  .financing-summarize-contain {
    padding: 20px 40px;
    font-size: 15px;
    background-color: #f7f7f7;
    border-radius: 6px;
    line-height: 16px;
  }

  .financing-summarize>.title {
    float: left;
    width: 4.5em;
    margin-left: -5em;
    text-align: right;
  }

  .ant-row {
    position: relative;
    height: auto;
    margin-right: 0;
    margin-left: 0;
    zoom: 1;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
  }

  .ant-col-24 {
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 100%;
  }

  .financing-summarize {
    padding-left: 5em;
    line-height: 24px;
  }

  .ant-col-8 {
    float: left;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 33.33333333%;
  }

  .financing-way .financing-way-title {
    height: 52px;
    line-height: 52px;
    font-size: 16px;
    font-weight: 700;
    border-bottom: 2px solid #e7e9f0;
  }

  .financing-way .financing-way-item {
    min-height: 36px;
    line-height: 36px;
    padding-left: 6em;
  }

  .financing-way .financing-way-item>.title {
    float: left;
    margin-left: -6em;
  }

  .ant-col-14 {
    float: left;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 58.33333333%;
  }

  .ant-col-10 {
    float: left;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 41.66666667%;
  }

  .ant-empty {
    margin: 0 8px;
    font-size: 14px;
    line-height: 40px;
    color: rgba(0, 0, 0, .25);
    text-align: center;
  }

  .financing-summarize-contain {
    padding: 20px 40px;
    font-size: 15px;
    background-color: #f7f7f7;
    border-radius: 6px;
    line-height: 16px;
    overflow: hidden;
  }

  .zd-xf-modal {
    width: 120px;
    background: #1f242d;
    border-radius: 8px;
    opacity: .9506999999999999;
    position: fixed;
    z-index: 10;
    top: 100px;
    right: 20px;
    padding: 20px 0;
    -webkit-transition: all .5s;
    -o-transition: .5s all;
    transition: all .5s;
  }

  .zd-xf-modal .toggle {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    color: #fff;
    position: absolute;
    left: -24px;
    background: #1f242d;
    opacity: .9506999999999999;
    width: 24px;
    height: 50px;
    border-radius: 5px 0 0 5px;
    cursor: pointer;
    bottom: 0;
    top: 0;
    margin: auto;
  }

  .zd-xf-modal>ul {
    width: 100%;
  }

  .zd-xf-modal li {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 100%;
    -ms-flex-pack: center;
    justify-content: center;
    -ms-flex-align: center;
    align-items: center;
  }

  .zd-xf-modal li div {
    width: 86px;
    height: 34px;
    border-radius: 20px;
    color: #fff;
    border: none;
    outline: none;
    cursor: pointer;
    line-height: 34px;
    text-align: center;
    -webkit-transition: all .5s;
    -o-transition: .5s all;
    transition: all .5s;
    font-size: 15px;
  }

  .zd-xf-modal li span {
    width: 1px;
    border-right: 1px dashed #fff;
    height: 30px;
    display: -ms-flexbox;
    display: flex;
    margin-top: 3px;
  }
</style>
