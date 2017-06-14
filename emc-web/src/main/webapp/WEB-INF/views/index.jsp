<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="decorator" content="main"/>
    <title>华热能管系统-首页</title>

    <script src="${web}/script/huak.web.index.js"></script>

</head>
<body>
<div class="index_mainbody  ">
<div class="index_menubg">
    <img src="${web}/static/img/index/websitet_cs01.png" id="website" style="min-width: 1346px;max-width: 1920px;" width="100%" />
    <div class="index_menu clearfix" id="index_menu">

        <div class="index_menuBox index_menuBoxAll on pull-left" onclick="typefun(this,1)">
            <div class="index_menuBoxCon">
                <span>能源流</span><span class="tipsindex">999</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon01">4000GJ</li>
                <li class="tabicon02">2000T</li>
                <li class="tabicon03">8000万元</li>
                <li class="tabicon04">20GJ/㎡</li>
                <li class="tabicon05">20GJ/㎡</li>
                <li class="tabicon06">8000万㎡</li>
            </ul>
        </div>

        <div class="index_menuBox index_menuBoxre  pull-left" onclick="typefun(this,2)">
            <div class="index_menuBoxCon">
                <span>供热源</span><span class="tipsindex">259</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon01 tabicon01cb">400GJ</li>
                <li class="tabicon02">200T</li>
                <li class="tabicon03">800万元</li>
            </ul>
            <div class="tabicon10 tabicon10cb">200GJ</div>
        </div>

        <div class="index_menuBox index_menuBoxweb index_menuBoxre pull-left" onclick="typefun(this,3)">
            <div class="index_menuBoxCon">
                <span>管网</span><span class="tipsindex">169</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon07">400km</li>
                <li class="tabicon09 tabicon09cb">200km</li>
                <li class="tabicon03">800万元</li>
            </ul>
            <div class="tabicon10">200GJ</div>
        </div>

        <div class="index_menuBox index_menuBoxsite index_menuBoxre pull-left" onclick="typefun(this,4)">
            <div class="index_menuBoxCon">
                <span>换热站</span><span class="tipsindex">1069</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon01">400GJ</li>
                <li class="tabicon02 tabicon02cb">200T</li>
                <li class="tabicon03">800万元</li>
            </ul>
            <div class="tabicon10">200GJ</div>
        </div>

        <div class="index_menuBox index_menuBoxline index_menuBoxre pull-left" onclick="typefun(this,5)">
            <div class="index_menuBoxCon">
                <span>管线</span><span class="tipsindex">320</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon07">400km</li>
                <li class="tabicon09">200km</li>
                <li class="tabicon03">800万元</li>
            </ul>
            <div class="tabicon10">200GJ</div>
        </div>

        <div class="index_menuBox index_menuBoxjum index_menuBoxre pull-left " onclick="typefun(this,6)">
            <div class="index_menuBoxCon">
                <span>民户</span><span class="tipsindex">30</span>
            </div>
            <ul class="index_menuBoxList clearfix">
                <li class="tabicon07">400GJ</li>
                <li class="tabicon08">67.9%</li>
                <li class="tabicon03">80万元</li>
            </ul>
        </div>
    </div>

</div>
<div class="index_content row no-margin">
<div class="col-xs-12 no-padding">
<div class="col-xs-4 mb14">
    <div class="index_contentBox energy_consumption">
        <a href="${web}/energy/monitor/tsec">
            <div class="titbox clearfix no-padding no-margin">
                <div class="pull-left energyTit"><i></i>能耗明细<small class="font-sm">Energy Consumption</small></div>
            </div>
            <div class="energyBox">
                <div class="col-xs-12 no-padding">
                    <div class="EnergyChartBg col-xs-8 no-padding">
                        <div class="EnergyChart" id="EnergyChart" style="width: 150%;height:150%;top: 10px;left: -25%;"></div>
                    </div>
                    <div class="col-xs-4 EnergyChartText no-padding-left">
                        <div class="EnergyChartTextnumb " id="bm_total"></div>
                        <!--EnergyChartTextnumb_cb-->
                        <div class="EnergyChartTextitem">能耗总量 (Tce)<br><span class="cb_color " id="total_tb"></span></div>
                        <!--zc_color-->
                        <div class="EnergyChartTextnumbolb " id="pc_plan"></div>
                        <!--EnergyChartTextnumbolb_cb-->
                        <div class="EnergyChartTextitem" id="pc_plan_percent"></div>
                    </div>
                </div>
                <div class="col-xs-12 no-padding">
                    <div class="energyBoxLegend_bg"></div>
                    <div class="energyBoxLegend clearfix">
                        <!--<div class="energyBoxLegendBtnLeft pull-left"></div>-->
                        <ul class="energyBoxLegendList clearfix pull-left">
                            <li>
                                <div class="energyBoxLegendListIcon energyBoxLegendListIcon01 energyBoxLegendListIcon01_cb"></div>
                                <div class="energyBoxLegendListText energyBoxLegendListText_cb" id="whater"></div>
                                <div class="energyBoxLegendListPara" id="whater_tb"></div>
                            </li>
                            <li>
                                <div class="energyBoxLegendListIcon energyBoxLegendListIcon02"></div>
                                <div class="energyBoxLegendListText" id="electric"></div>
                                <div class="energyBoxLegendListPara" id="electric_tb"></div>
                            </li>
                            <li>
                                <div class="energyBoxLegendListIcon energyBoxLegendListIcon03"></div>
                                <div class="energyBoxLegendListText" id="gas"></div>
                                <div class="energyBoxLegendListPara" id="gas_tb"></div>
                            </li>
                            <li>
                                <div class="energyBoxLegendListIcon energyBoxLegendListIcon04 energyBoxLegendListIcon04_cb"></div>
                                <div class="energyBoxLegendListText" id="heat"></div>
                                <div class="energyBoxLegendListPara energyBoxLegendListPara_cb" id="heat_tb"></div>
                            </li>
                            <li>
                                <div class="energyBoxLegendListIcon energyBoxLegendListIcon05"></div>
                                <div class="energyBoxLegendListText" id="coal"></div>
                                <div class="energyBoxLegendListPara" id="coal_tb"></div>
                            </li>
                        </ul>
                        <!--<div class="energyBoxLegendBtnRight energyBoxLegendBtnRight_on pull-left"></div>-->
                    </div>
                </div>
            </div>
        </a>
    </div>
</div>
<div class=" col-xs-4 mb14">
    <div class="index_contentBox">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left totalTit energyTit"><i></i>成本明细<small class="font-sm">Total cost</small></div>
        </div>
        <div class="col-xs-12 no-padding energyBox TotalBox clearfix">
            <div class="cost-chart">
                <div id="chart05" style="width: 100%;height:310px;"></div>
            </div>
            <div class="cost-list">
                <div class="cost-list-box cost-list-nyf">
                    <span class="cost-list-name">能源费</span>
                    <div class="">
                        <span class="cost-list-num cost-list-remind" id="energy_cost"></span>
                        <span class="cost-list-proportion cost-list-remind" id="energy_tb"></span>
                    </div>
                </div>
                <div class="cost-list-box cost-list-sbf">
                    <span class="cost-list-name">设备费</span>
                    <div class="">
                        <span class="cost-list-num cost-list-remind" id="device_cost"></span>
                        <span class="cost-list-proportion" id="device_tb"></span>
                    </div>
                </div>
                <div class="cost-list-box cost-list-rgf">
                    <span class="cost-list-name">人工费</span>
                    <div class="">
                        <span class="cost-list-num " id="labor_cost"></span>
                        <span class="cost-list-proportion cost-list-remind" id="labor_tb"></span>
                    </div>
                </div>
                <div class="cost-list-box cost-list-glf">
                    <span class="cost-list-name">管理费</span>
                    <div class="">
                        <span class="cost-list-num" id="manage_cost"></span>
                        <span class="cost-list-proportion" id="manage_tb"></span>
                    </div>
                </div>
                <div class="cost-list-box cost-list-qtf">
                    <span class="cost-list-name">其他费</span>
                    <div class="">
                        <span class="cost-list-num" id="other_cost"></span>
                        <span class="cost-list-proportion" id="other_tb"></span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class=" col-xs-4 mb14">
    <div class="index_contentBox otherTabdiv">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left CarbonTit energyTit"><i></i>碳排放总量<small class="font-sm">Carbon emissions</small></div>
        </div>
        <div class="col-xs-12 no-padding energyBox CarbonBox clearfix">
            <div class="emission-chart ">
                <div id="chart06" class="wave">
                    <div class="wave-main wave-hot">
                        <b class="" id="level_num">290.2</b>
                        <p class="wave-name">碳排放总量（万T）</p>
                        <p class="wave-proportion">(1.6%↑)</p>
                    </div>
                </div>
            </div>
            <div class="emission-list">
                <div class="emission-list-box emission-list-hot">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">朝一</span>
                    <span class="emission-list-num">208.4</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">朝二</span>
                    <span class="emission-list-num">192.8</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">东城</span>
                    <span class="emission-list-num">187.2</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box emission-list-hot">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">西城</span>
                    <span class="emission-list-num">245.9</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">海淀</span>
                    <span class="emission-list-num">312.0</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">丰台</span>
                    <span class="emission-list-num">254.6</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
            </div>
        </div>

    </div>

    <div class="index_contentBox PeopleTabdiv">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left CarbonTit energyTit temperatureTit"><i></i>室温合格率<small class="font-sm">temperature qualified rate</small></div>
        </div>
        <div class="col-xs-12 no-padding energyBox CarbonBox">
            <div class="emission-chart ">
                <div id="chartCarbon" style="width: 100%;height:310px;"></div>
            </div>
            <div class="emission-list">
                <div class="emission-list-box emission-list-hot">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">朝一</span>
                    <span class="emission-list-num">208.4</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">朝二</span>
                    <span class="emission-list-num">192.8</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">东城</span>
                    <span class="emission-list-num">187.2</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box emission-list-hot">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">西城</span>
                    <span class="emission-list-num">245.9</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">海淀</span>
                    <span class="emission-list-num">312.0</span>
                    <span class="emission-list-proportion">(2.6%↓)</span>
                </div>
                <div class="emission-list-box">
                    <span class="emission-list-rect"></span>
                    <span class="emission-list-num">丰台</span>
                    <span class="emission-list-num">254.6</span>
                    <span class="emission-list-proportion">(1.6%↑)</span>
                </div>
            </div>
        </div>
    </div>

</div>
<div class=" col-xs-4">
    <div class="index_contentBox">
        <a href="${web}/cons/analysis/tsec">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left carbonTit energyTit"><i></i>单耗趋势<small class="font-sm">Comparison of Energy</small></div>
        </div>
        <div class="energyBox ComparisonBox">
            <div class="chart-box">
                <div class="cb-header">
                    <span class="cb-title">单耗 (单位: GJ/㎡)</span>
                    <div class="cb-title-right">
                        <label>
                            <span class="cb-legend-blue"></span>
                            今年
                        </label>
                        <label>
                            <span class="cb-legend-gray"></span>
                            去年
                        </label>
                    </div>
                </div>
                <div id="chart01" class="chart"></div>
            </div>
        </div>
        </a>
    </div>
</div>
<div class=" col-xs-4">
    <div class="index_contentBox">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left carbonTit energyTit"><i></i>成本对比<small class="font-sm">Cost comparison</small></div>
        </div>
        <div class="energyBox comparisonBox">
            <div class="chart-box">
                <div class="cb-header">
                    <span class="cb-title" id="nh-title">分公司成本 (单位: 万元)</span>
                    <span class="cb-title" id="qs-title" style="display: none;">成本 (单位: 万元)</span>
                    <div class="cb-title-right clearfix">
												<span class="cb-cut-date">
												<a href="javascript:selectYear(-1);"><img src="${web}/static/img/icons/icon001.png" /></a>
												<label id="branchcost-year">2016年</label>
												<a href="javascript:selectYear(1);"><img src="${web}/static/img/icons/icon002.png" /></a>
											</span>

												<span class="button-group">
												<a href="javascript:cutNh();" id="bg-left" class="bg-left button-group-act">能耗</a><a href="javascript:cutQs();" id="bg-right" class="bg-right">趋势</a>
											</span>
                    </div>
                </div>
                <div id="chart02" class="chart"></div>
                <div id="chart04" class="chart" style="display: none;"></div>
            </div>
        </div>

    </div>
</div>
<div class=" col-xs-4">
    <div class="index_contentBox otherTabdiv">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left carbonTit energyTit"><i></i>碳排放趋势<small class="font-sm">Comparison of carbon</small></div>
        </div>
        <div class="energyBox carbonBox">
            <div class="chart-box">
                <div class="cb-header">
                    <span class="cb-title">碳排放(单位: m³)</span>
                    <div class="cb-title-right">
                        <label>
                            <span class="cb-legend-blue"></span>
                            今年
                        </label>
                        <label>
                            <span class="cb-legend-gray"></span>
                            去年
                        </label>
                    </div>
                </div>
                <div id="chart03" class="chart"></div>
            </div>
        </div>
    </div>

    <div class="index_contentBox PeopleTabdiv">
        <div class="titbox clearfix no-padding no-margin">
            <div class="pull-left carbonTit energyTit"><i></i>合格率趋势<small class="font-sm">Qualified rate trend</small></div>
        </div>
        <div class="energyBox carbonBox">
            <div class="chart-box">
                <div class="cb-header">
                    <span class="cb-title">室温 (单位: ℃)</span>
                    <div class="cb-title-right">
                        <label>
                            <span class="cb-legend-blue QualifiedLend"></span>
                            民户室温
                        </label>

                    </div>
                </div>
                <div id="QualifiedChart" class="chart"></div>
            </div>
        </div>

    </div>

</div>
</div>
<!-- <div class="index_contentList">-->
</div>

</div>


</body>
</html>