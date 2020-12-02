<!--
 * @Author: your name
 * @Date: 2020-07-30 09:36:09
 * @LastEditTime: 2020-09-14 14:20:28
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
                    href="https://asset.caicchina.com/fileservice/group1/M00/00/00/CoC3KF8jjvyAYB_GAB8Hm4GIjfc427.pdf">下载报告
          </a>
        </span>
      </div>
      <div class="dia-title-container-conent">
        <div>
          <div class="ant-divider ant-divider-horizontal" style="margin-top: 0px;">
          </div>
          <div class="zhenduanzongshu">
            <img class="img1" src="./img/WechatIMG781.png" alt="">
            <div class="fir">
              <div class="title">
                <div class="margin-title">城汇大厦demo</div>
                <div class="margin-dengji">AAA乙级</div>
              </div>
              <div class="name">
                <div class="one">
                  <div class="name-size">本体信息: <span class="value-size">30796.28m²</span>
                  </div>
                  <div class="name-size">市场分析: <span class="value-size">空置率17%</span></div>
                  <div class="name-size">竞品分析: <span class="value-size">空置率12.5%</span></div>
                  <div class="name-size">资产评级: <span class="value-size">AAA乙级</span></div>
                  <div class="name-size">运营诊断: <span class="value-size">1个指标,预警提示</span></div>
                  <div class="name-size">设备诊断: <span class="value-size">电梯系统</span></div>
                  <div class="name-size">交易诊断: <span class="value-size">核心增值型</span></div>
                  <div class="name-size">融资诊断: <span class="value-size">10.2亿</span></div>
                  <div class="name-size">价值诊断: <span class="value-size">15.7亿元</span></div>
                </div>
              </div>
            </div>
          </div><span class="jieshaospan">诊断建议：需关注平均房价，区域价值日益提升，建议可通过适当改造，提升酒店档次和运营品牌等级。</span>
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
              <div class="bentititle">城汇大厦demo <div class="bentizizhi">AAA乙级</div>
              </div>
              <div class="bentiaddress">地址：南昌路45号</div>
            </div>
          </div>
          <ul>
            <li>
              <div>建筑面积</div>
              <div>23997㎡</div>
            </li>
            <li>
              <div>竣工时间</div>
              <div>2009-01-01</div>
            </li>
            <li>
              <div>土地剩余年限</div>
              <div>34年</div>
            </li>
            <li>
              <div>土地属性</div>
              <div>A1行政办公用地</div>
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
                            <td class="" style="text-align: left;">A1行政办公用地</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>土地获取时间</td>
                            <td class="" style="text-align: left;">-</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>土地成交价格</td>
                            <td class="" style="text-align: left;">-</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>产权年限</td>
                            <td class="" style="text-align: left;">50</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>占地面积</td>
                            <td class="" style="text-align: left;">6835m²</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="5">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>容积率</td>
                            <td class="" style="text-align: left;">6.6</td>
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
                              <div style="width: 120px;">30796.28m²</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">竣工时间</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">2009年</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">交付时间</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">2009年</div>
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
                              <div style="width: 120px;">写字楼</div>
                            </td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="5">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>
                              <div style="width: 100px;">标准层面积</div>
                            </td>
                            <td class="" style="text-align: left;">
                              <div style="width: 120px;">1300m²</div>
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
                                style="padding-left: 0px;"></span>层高</td>
                            <td class="" style="text-align: left;">2.7m</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>层数</td>
                            <td class="" style="text-align: left;">22层</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>停车库面积</td>
                            <td class="" style="text-align: left;">5960m²</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>停车位数量</td>
                            <td class="" style="text-align: left;">149个</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class="" style="text-align: left;"><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>建筑认证</td>
                            <td class="" style="text-align: left;">无认证</td>
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
          <img style="width: 100%;" src="./img/WechatIMG784.png" alt="">
        </div>
        <div class="pttabs">
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">股东信息</li>
                <li><span>项目公司股东</span><i>上海城建置业发展有限公司</i></li>
                <li><span>企业属性</span><i>国企</i></li>
                <li><span>企业占位</span><i>非百强</i></li>
                <li><span>企业市值</span><i>-</i></li>
                <li><span>销售额</span><i>-</i></li>
                <li><span>信用评级</span><i>AAA</i></li>
                <li><span>主营业务</span><i>工程投资建设、设计施工和管理</i></li>
              </ul>
            </div>
          </div>
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">业主信息</li>
                <li><span>业主</span><i>上海宝盛房地产开发经营有限公司</i></li>
                <li><span>信用评级</span><i>-</i></li>
              </ul>
            </div>
            <div style="padding: 10px;"></div>
          </div>
          <div class="pt-table-list">
            <div class="pt-tabs-tmpl">
              <ul>
                <li class="pt-tabs-tmpl-title">相关公司</li>
                <li><span>开发商</span><i>上海宝盛房地产开发经营有限公司</i></li>
                <li><span>设计公司</span><i>-</i></li>
                <li><span>运营公司</span><i>上海宝盛房地产开发有限公司</i></li>
                <li><span>物管公司</span><i>上海高力物业管理有限公司</i></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>市场分析</h3><span>上海写字楼-2019年第一季度市场分析报告</span>
      </div>
      <div class="dia-title-container-conent">
        <div class="title-bg">
          <div class="title-bg-list"><span>宏观</span><span>整体经济放缓，第三产业保持快速增长</span></div>
          <div class="title-bg-list"><span>市场</span><span>写字楼供应处于高位，整体市场表现稳定</span></div>
          <div class="title-bg-list"><span>政策</span><span>外商投资法；取消股比限制；减税</span></div>
          <div class="title-bg-list"><span>交易</span><span>本季度交易活跃</span></div>
        </div>
        <div>
          <img style="width: 100%" src="./img/WechatIMG803.png" alt="">
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>竞品分析</h3><span></span>
      </div>
      <img style="width: 100%" src="./img/WechatIMG788.png" alt="">
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
                <td class="text-left">4.5</td>
                <td class="text-left">4.5</td>
                <td class="text-left">5</td>
                <td class="text-left">4</td>
              </tr>
              <tr>
                <td class="text-left">竣工年份</td>
                <td class="text-left">2004年</td>
                <td class="text-left">2000年</td>
                <td class="text-left">2013年</td>
                <td class="text-left">1996年</td>
              </tr>
              <tr>
                <td class="text-left">建筑面积</td>
                <td class="text-left">84844.5㎡</td>
                <td class="text-left">78000㎡</td>
                <td class="text-left">137436㎡</td>
                <td class="text-left">32253㎡</td>
              </tr>
              <tr>
                <td class="text-left">标准层面积㎡</td>
                <td class="text-left">1650㎡</td>
                <td class="text-left">1700㎡</td>
                <td class="text-left">2300㎡</td>
                <td class="text-left">1000㎡</td>
              </tr>
              <tr>
                <td class="text-left">层数</td>
                <td class="text-left">31层</td>
                <td class="text-left">30层</td>
                <td class="text-left">38层</td>
                <td class="text-left">25层</td>
              </tr>
              <tr>
                <td class="text-left">空置率</td>
                <td class="text-left">12.50%</td>
                <td class="text-left">8%</td>
                <td class="text-left">18%</td>
                <td class="text-left">7%</td>
              </tr>
              <tr>
                <td class="text-left">平均租金报价</td>
                <td class="text-left">10.6元/㎡/天</td>
                <td class="text-left">11元/㎡/天</td>
                <td class="text-left">12元/㎡/天</td>
                <td class="text-left">9.2元/㎡/天</td>
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
                <p>城市核心区域板块，区位价值高；毗邻核心金融商务区，板块整体发展成熟度高。</p>
              </li>
              <li>
                <h3>交通价值：</h3>
                <p>距离城市主干道600米，紧邻轨交，多条核心公交路线，交通便捷，可达性强。</p>
              </li>
              <li>
                <h3>建筑指标：</h3>
                <p>楼龄较新，单体建筑规模一般，层高较低，楼板荷载能力一般，建筑整体较好。</p>
              </li>
              <li>
                <h3>建筑设备：</h3>
                <p>电梯配比高效，电梯性能一般，车位配比一般，楼宇智能化程度高，环保暂未认证。</p>
              </li>
              <li>
                <h3>运营水平：</h3>
                <p>租金水平高于板块均值，略低于同等物业平均水平，出租率保持较高水平。</p>
              </li>
              <li>
                <h3>管理：</h3>
                <p>国际知名物业公司，运营管理经验丰富。</p>
              </li>
            </ul>
          </div>
          <div class="zczd-right">
            <img style="width: 60%;margin-left: 20%;" src="./img/WechatIMG804.png" alt="">
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
                                style="padding-left: 0px;"></span>商务价值</td>
                            <td class="">淮海中路板块</td>
                            <td class="">核心商务区</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="1">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>商业价值</td>
                            <td class="">新天地商务区</td>
                            <td class="">高</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="2">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>地铁系统</td>
                            <td class="">1/13号线</td>
                            <td class="">通达性较强</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="3">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>自驾系统</td>
                            <td class="">延安高架</td>
                            <td class="">通达性强</td>
                          </tr>
                          <tr class="ant-table-row ant-table-row-level-0" data-row-key="4">
                            <td class=""><span class="ant-table-row-indent indent-level-0"
                                style="padding-left: 0px;"></span>公交系统</td>
                            <td class="">5条以上</td>
                            <td class="">通达性强</td>
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
            <img style="width: 60%;margin-left: 20%;" src="./img/WechatIMG805.png" alt="">
          </div>
          <ul class="sb">
            <li>
              <h3>收入表现：</h3>
              <p>出租率 83%，表现正常，收入维度下65%指标表现健康。</p>
            </li>
            <li>
              <h3>支出表现：</h3>
              <p>支出维度下15%指标表现正常。</p>
            </li>
            <li>
              <h3>可持续性：</h3>
              <p>租售稳定性健康，五大行物管质量高（其中5%的指标优秀）。</p>
            </li>
          </ul>
        </div>
        <ul class="dia-tabs-contanier">
          <li class="active">收入表现</li>
          <li class="">支出表现</li>
          <li class="">可持续性</li>
        </ul>
        <div>
          <img style="width: 100%;" src="./img/WechatIMG806.png" alt="">
        </div>
      </div>
    </div>
    <div class="dia-title-container">
      <div class="dia-title-container-title">
        <h3>交易诊断</h3>
      </div>
      <div class="ant-row" style="margin-left: -16px; margin-right: -16px;">
        <div class="ant-col ant-col-12" style="padding-left: 16px; padding-right: 16px;">
          <img style="width: 60%;margin-left: 20%;"  src="./img/WechatIMG807.png" alt="">
        </div>
        <div class="ant-col ant-col-12" style="padding-left: 16px; padding-right: 16px;">
          <div class="trade-chart-explain">
            <div class="explain-title">核心增值型</div>
            <div class="explain-title-tip">(风险规避型买家)</div>
            <div class="explain-title" style="margin-top: 20px;">总结：</div>
            <div class="explain-title-tip">该项目属于核心增值型资产（Core
              plus），位于核心城市潜力板块，城市活跃度高，板块较活跃，资产运营提升潜力较大；该资产受风险规避型买家欢迎，近年来办公类物业大宗交易以外资及险资为主，但基本集中在核心区和次核心区。</div>
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
                          <td class="">该资产位于上海，城市增长潜力仅此于深圳和北京，位于境内城市TOP3</td>
                          <td class="">较大</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="板块交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>板块交易活跃度</td>
                          <td class="">该资产位于淮海中路板块，板块内近三年大宗交易较为活跃</td>
                          <td class="">较活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="板块增长潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>板块增长潜力</td>
                          <td class="">该资产位于淮海中路板块，板块较成熟稳定，增长潜力小</td>
                          <td class="">小</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="类型交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>类型交易活跃度</td>
                          <td class="">该资产为办公类型，该类型物业近三年大宗交易频繁</td>
                          <td class="">活跃</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="项目交易活跃度">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>项目交易活跃度</td>
                          <td class="">该项目暂未被交易</td>
                          <td class="">一般</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="运营提升潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>运营提升潜力</td>
                          <td class="">项目资产项2项运营指标低于精品均值，与周边竞品相比处于中下水平，运营提升潜力较大</td>
                          <td class="">较大</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="硬件改造潜力">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>硬件改造潜力</td>
                          <td class="">该资产楼龄10年，配套设施较好，外立面设计时尚前卫，内部结构匹配项目功能需求，整体硬件改造潜力较大</td>
                          <td class="">大</td>
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
                          <td class="">该资产剩余产权35年，运营改造时间充裕</td>
                          <td class="">充足</td>
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
            <div class="financing-summarize"><strong class="title">融资金额</strong>10.2亿</div>
          </div>
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">融资利率</strong>5%-7%</div>
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
              <dd class="financing-way-item"><span class="title">融资成本</span><span>基准利率(4.35%)上浮20%起</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>1-5年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>资产抵押
                  保证担保</span></dd>
              <dd class="financing-way-item"><span class="title">适用性</span><span>强</span></dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way">
              <dt class="financing-way-title">融资方式2：CMBS</dt>
              <dd class="financing-way-item"><span class="title">融资规模</span><span>折扣率50%-70%</span></dd>
              <dd class="financing-way-item"><span class="title">融资成本</span><span>优先级利率4-6%</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>15-20年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>优先次级分层
                  超额现金流覆盖
                  保证担保
                  差额支付承诺
                  流动性支持
                  资产抵押</span></dd>
              <dd class="financing-way-item"><span class="title">适用性</span><span>强</span></dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way">
              <dt class="financing-way-title">融资方式3：REITs</dt>
              <dd class="financing-way-item"><span class="title">融资规模</span><span>折扣率85%-100%</span></dd>
              <dd class="financing-way-item"><span class="title">融资成本</span><span>优先级利率5-7.5%</span></dd>
              <dd class="financing-way-item"><span class="title">融资期限</span><span>15-20年</span></dd>
              <dd class="financing-way-item"><span class="title">增信措施</span><span>优先次级分层
                  超额现金流覆盖
                  保证担保
                  差额支付承诺
                  流动性支持
                  资产抵押
                  信用下降触发机制</span></dd>
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
                              <td class="">四星</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产类型">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>资产类型</td>
                              <td class="">写字楼</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所在城市">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所在城市</td>
                              <td class="">上海</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所在区位/环线">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所在区位/环线</td>
                              <td class="">新天地板块</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="周边交通">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>周边交通</td>
                              <td class="">距离1号线500米</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="资产规模">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>资产规模</td>
                              <td class="">30796㎡</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="开业时间">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>开业时间</td>
                              <td class="">2009年</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="土地剩余年限">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>土地剩余年限</td>
                              <td class="">35年</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="运营主体">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>运营主体</td>
                              <td class="">上海成聿集团</td>
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
                              <td class="">AAA（上海新世纪资信评估）</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="母公司评级">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>母公司评级</td>
                              <td class="">AAA</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="企业性质">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>企业性质</td>
                              <td class="">国企</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="所属行业">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>所属行业</td>
                              <td class="">房地产</td>
                            </tr>
                            <tr class="ant-table-row ant-table-row-level-0" data-row-key="净资产（亿）">
                              <td class=""><span class="ant-table-row-indent indent-level-0"
                                  style="padding-left: 0px;"></span>净资产（亿）</td>
                              <td class="">249</td>
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
                          <td class="">77%</td>
                          <td class="">68%</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="流动比率">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>流动比率</td>
                          <td class="">1.09</td>
                          <td class="">1.94</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="速动比率">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>速动比率</td>
                          <td class="">0.61</td>
                          <td class="">0.61</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="年营业总收入（亿）">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>年营业总收入（亿）</td>
                          <td class="">493</td>
                          <td class="">-</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="年营业总收入增长率%">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>年营业总收入增长率%</td>
                          <td class="">23%</td>
                          <td class="">-</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA（亿）">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA（亿）</td>
                          <td class="">47.2</td>
                          <td class="">8.06</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="全部债务/EBITDA">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>全部债务/EBITDA</td>
                          <td class="">6.98</td>
                          <td class="">11.85</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="ROE">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>ROE</td>
                          <td class="">8.57%</td>
                          <td class="">4.25%</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="EBITDA/利息费用">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>EBITDA/利息费用</td>
                          <td class="">6.1</td>
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
              <div class="ant-table ant-table-default ant-table-empty ant-table-scroll-position-left">
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
                      <tbody class="ant-table-tbody"></tbody>
                    </table>
                  </div>
                  <div class="ant-table-placeholder">
                    <div class="ant-empty ant-empty-normal">
                      <p class="ant-empty-description">暂无数据</p>
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
            <div class="financing-summarize"><strong class="title">资产估值</strong>15.7亿元</div>
          </div>
          <div class="ant-col ant-col-12" style="padding-left: 10px; padding-right: 10px;">
            <div class="financing-summarize"><strong class="title">单价</strong>50863元/㎡</div>
          </div>
        </div>
      </div>
      <div class="financing-way-contain">
        <div class="ant-row" style="margin-left: -39px; margin-right: -39px;">
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">资产数据/状况</dt>
              <dd class="financing-way-item"><span class="title">土地用途</span>商办用地</dd>
              <dd class="financing-way-item"><span class="title">土地剩余使用年限</span>35年</dd>
              <dd class="financing-way-item"><span class="title">建筑面积</span>30796㎡</dd>
              <dd class="financing-way-item"><span class="title">使用现状</span>写字楼</dd>
              <dd class="financing-way-item"><span class="title">资产诊断</span>AAA甲级写字楼</dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">运营数据/状况</dt>
              <dd class="financing-way-item"><span class="title">月租金</span>8.8元/㎡</dd>
              <dd class="financing-way-item"><span class="title">其他收入</span>-</dd>
              <dd class="financing-way-item"><span class="title">空置率</span>17%</dd>
              <dd class="financing-way-item"><span class="title">运营费用</span>938972元/月</dd>
              <dd class="financing-way-item"><span class="title">运营诊断</span>85%的指标正常</dd>
            </dl>
          </div>
          <div class="ant-col ant-col-8" style="padding-left: 39px; padding-right: 39px;">
            <dl class="financing-way value-diagnose-auto-left-width">
              <dt class="financing-way-title">运营数据/状况</dt>
              <dd class="financing-way-item"><span class="title">产权集中度</span>单一产权</dd>
              <dd class="financing-way-item"><span class="title">改造合规性</span>合规</dd>
              <dd class="financing-way-item"><span class="title">交易评级</span>交易优势显著</dd>
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
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="复行广场">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>复行广场</td>
                          <td class="">淮海中路</td>
                          <td class="">49052</td>
                          <td class="">45984</td>
                          <td class="">适中</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="瑞岸广场">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>瑞岸广场</td>
                          <td class="">徐家汇</td>
                          <td class="">78000</td>
                          <td class="">41530</td>
                          <td class="">适中</td>
                        </tr>
                        <tr class="ant-table-row ant-table-row-level-0" data-row-key="兴茂大厦">
                          <td class=""><span class="ant-table-row-indent indent-level-0"
                              style="padding-left: 0px;"></span>兴茂大厦</td>
                          <td class="">北外滩</td>
                          <td class="">32253</td>
                          <td class="">52630</td>
                          <td class="">适中</td>
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
      <img style="width: 100%;" src="./img/WechatIMG808.png" alt="">
    </div>
    <div class="zd-xf-modal toggle-come-out"><div class="toggle"><i aria-label="图标: right" class="anticon anticon-right"><svg viewBox="64 64 896 896" focusable="false" class="" data-icon="right" width="1em" height="1em" fill="currentColor" aria-hidden="true"><path d="M765.7 486.8L314.9 134.7A7.97 7.97 0 0 0 302 141v77.3c0 4.9 2.3 9.6 6.1 12.6l360 281.1-360 281.1c-3.9 3-6.1 7.7-6.1 12.6V883c0 6.7 7.7 10.4 12.9 6.3l450.8-352.1a31.96 31.96 0 0 0 0-50.4z"></path></svg></i></div><ul><li><div class="">本体信息</div><span></span></li><li><div class="">市场分析</div><span></span></li><li><div class="">竞品分析</div><span></span></li><li><div class="">资产诊断</div><span></span></li><li><div class="">运营诊断</div><span></span></li><li><div class="">交易诊断</div><span></span></li><li><div class="">融资诊断</div><span></span></li><li><div class="">价值诊断</div><span></span></li><li><div class="">设备诊断</div></li></ul></div>
  </div>
</template>
<script>
</script>
<style lang="scss" scoped>
#diagnosis-detail{
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
