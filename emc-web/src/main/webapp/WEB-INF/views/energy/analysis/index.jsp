<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>能耗分析</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${web}/static/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${web}/static/assets/css/font-awesome.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${web}/static/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${web}/static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${web}/static/css/huarestyle.css" />
    <link rel="stylesheet" href="${web}/static/css/homemian.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${web}/static/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${web}/static/assets/css/ace-ie.css" />
    <![endif]-->

    <!-- ace settings handler -->
    <script src="${web}/static/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <script src="${web}/static/assets/js/html5shiv.js"></script>
    <script src="${web}/static/assets/js/respond.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="${web}/static/js/Bsie/selectivizr.js"></script>
    <![endif]-->

</head>
<body>
<div id="header">
    <!--顶部导航条-->
    <div id="navbar" class="navbar navbar-default">
        <script type="text/javascript">
            try{ace.settings.check('navbar' , 'fixed')}catch(e){}
        </script>
        <div class="navbar-container" id="navbar-container">
            <!--<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
                <span class="sr-only">Toggle sidebar</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>-->
            <div class="navbar-header pull-left">
                <a href="index.html" class="navbar-brand">
                    <img src="${web}/static/img/logo.png" width="296" height="31" alt="华热能源管控" />
                </a>
            </div>
            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <ul class="nav ace-nav" id="ace-nav">
                    <li class="navlh">
                        <a href="${web}/index">
                            <div class="icon-hm"></div>
                            <p>首页</p>
                        </a>
                    </li>
                    <li class="navlh ">
                        <a href="energy_analysis.html">
                            <div class="icon-nh"></div>
                            <p>能耗分析</p>
                        </a>
                    </li>
                    <li class="navlh">
                        <a href="#">
                            <div class="icon-cb"></div>
                            <p>成本管控</p>
                        </a>
                    </li>
                    <li class="navlh">
                        <a href="#">
                            <div class="icon-tp"></div>
                            <p>碳排管理</p>
                        </a>
                    </li>
                    <li class="navlh">
                        <a href="alarm_mgr.html">
                            <div class="icon-bj"></div>
                            <p>报警管理</p>
                        </a>
                    </li>
                    <li class="navlh">
                        <a href="project_assess.html">
                            <div class="icon-pg"></div>
                            <p>项目后评估</p>
                        </a>
                    </li>
                    <li class="navlh">
                        <a href="#">
                            <div class="icon-aq"></div>
                            <p>安全与后台</p>
                        </a>
                    </li>

                    <li class="tijian bordertopnone">
                        <a href="#">
                            <img src="img/tijian.png" alt="" />
                        </a>
                    </li>

                    <li class="tianqi clearfix bordertopnone">
                        <div class="right-tianqi">
                            <span id="date_today" class="date_today"></span>
                            <iframe name="tianqiiframe" id="tianqiiframe" src="http://i.tianqi.com/index.php?c=code&id=99&color=%23a3abb8&icon=3&num=1" width="120" height="32" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                        </div>

                    </li>
                    <li class="light-blue bordertopnone">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <span class="navline-left"></span>
                            <img class="nav-user-photo" src="img/manager.png" alt="管理员" />
								<span class="user-info">管理员
								</span>
                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>

                        <!--<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-cog"></i>
                                    Settings
                                </a>
                            </li>

                            <li>
                                <a href="profile.html">
                                    <i class="ace-icon fa fa-user"></i>
                                    Profile
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-power-off"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>-->
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="main-container">
<div class="clearfix row no-margin index_header">

    <!--面包屑导航-->
    <div class="bread-crumb pull-left">
        当前位置：<a href="javascript:;">[<var class="xmhpg"  style="color: #666;">首页 - 能源流概况</var>]</a>
    </div>

    <div class="mianTop pull-right">
        <div class="selectbg clearfix col-lg-12">

            <div class="select-box">
                <div class="clearfix h-selectbox">
                    <div class="x-selectfree fl">
                        <div class="x-sfbgbox">
                            <div class="x-sfleft1 x-sfw1">
                                <input type="text" value="集团总览" readonly="readonly">
                            </div>
                            <div class="x-sfright1"></div>
                        </div>
                        <div class="x-sfoption x-sfoption1">
                            <p value="1111">北京公司</p>
                            <p value="2222">上海公司</p>
                            <p value="3333">南京集团</p>
                        </div>
                        <input type="hidden" value="1111"/>
                    </div>
                </div>
            </div>
            <div class="select-box select-boxbtnAlarm clearfix">
                <a href="javascript:;" class="btnAlarm btnAlarm-on">集中供暖</a>
                <a href="javascript:;" class="btnAlarm ">区域供暖</a>
            </div>

            <div class="select-box select-boxbtnAlarm clearfix">
                <a href="javascript:;" class="btnAlarm ">本年度</a>
                <a href="javascript:;" class="btnAlarm btnAlarm-on">本采暖季</a>
                <a href="javascript:;" class="btnAlarm ">自定义</a>
            </div>
            <div class="select-box select-boxWdate">
                <input id="begin" class="Wdate time-input time-input-disable" disabled="disabled" value="2017-05-01" type="text" onFocus="var end=$dp.$('end');WdatePicker({onpicked:function(){end.focus();},readOnly:true,maxDate:'#F{$dp.$D(\'end\')}'})"/>
                <span>至</span>
                <input id="end" class="Wdate time-input time-input-disable" disabled="disabled" value="2017-05-08" type="text" onFocus="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'begin\')}'})"/>
            </div>

        </div>
    </div>
</div>
<div class="index_mainbody  ">

<div class="index_content row no-margin">
<div class="col-lg-12 no-padding index_contentList">
    <div class="col-lg-12 mb14  ">
        <div class=" index_contentBox clearfix">
            <div class="titbox clearfix no-padding no-margin">
                <div class="pull-left groupEnergyTit energyTit"><i></i>集团总能耗<small class="font-sm">Energy Monitoring</small></div>
            </div>
            <div class="groupEnergy-box col-lg-12  clearfix">
                <div class="chart-box groupEnergy-chart col-lg-8 ">
                    <div class="cb-header">
                        <span class="cb-title">集团总能耗 (单位: GJ)</span>
                        <div class="cb-title-right" style="margin-right: 36px;">
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
                    <div id="groupEnergyChart" style="width: 100%;height:365px;"></div>
                </div>
                <div class="groupEnergy-info col-lg-4">
                    <h3>760.4</h3>
                    <div class="small">集团总能耗 (GJ/m3)</div>
                    <h4>3.4<span class="arrow">↑</span></h4>
                    <div class="small">同比去年 (%)</div>
                </div>
            </div>

            <div class="clearfix energy-list col-lg-12 ">
                <div class="energy-list-box energy-list-box-first">
                    <div class="energy-head energy-snh-remind">
                        <span class="energy-list-name">水能耗</span>
                        <div class="energy-list-info">
                            <span class="energy-list-num energy-remind">192.5</span>
                            <span class="energy-list-measure energy-remind">GJ</span>
                            <span class="energy-list-proportion energy-remind">(2.6%↑)</span>
                        </div>
                    </div>

                    <div class="energy-chart">
                        <div id="waterEnergyChart"></div>
                    </div>
                </div>

                <div class="energy-list-box">
                    <div class="energy-head energy-dnh">
                        <span class="energy-list-name">电能耗</span>
                        <div class="energy-list-info">
                            <span class="energy-list-num">172.6</span>
                            <span class="energy-list-measure">GJ</span>
                            <span class="energy-list-proportion">(6.9%↓)</span>
                        </div>
                    </div>
                    <div class="energy-chart">
                        <div id="electricEnergyChart"></div>
                    </div>
                </div>

                <div class="energy-list-box">
                    <div class="energy-head energy-qnh-remind">
                        <span class="energy-list-name">气能耗</span>
                        <div class="energy-list-info">
                            <span class="energy-list-num energy-remind">428.0</span>
                            <span class="energy-list-measure energy-remind">GJ</span>
                            <span class="energy-list-proportion energy-remind">(3.4%↓)</span>
                        </div>
                    </div>

                    <div class="energy-chart">
                        <div id="gasEnergyChart"></div>
                    </div>
                </div>

                <div class="energy-list-box">
                    <div class="energy-head energy-rnh">
                        <span class="energy-list-name">热能耗</span>
                        <div class="energy-list-info">
                            <span class="energy-list-num">560.2</span>
                            <span class="energy-list-measure">GJ</span>
                            <span class="energy-list-proportion energy-remind">(2.9%↑)</span>
                        </div>
                    </div>

                    <div class="energy-chart">
                        <div id="hotEnergyChart"></div>
                    </div>
                </div>

                <div class="energy-list-box energy-list-box-last">
                    <div class="energy-head energy-mnh">
                        <span class="energy-list-name">煤能耗</span>
                        <div class="energy-list-info">
                            <span class="energy-list-num">269.4</span>
                            <span class="energy-list-measure ">GJ</span>
                            <span class="energy-list-proportion">(3.4%↓)</span>
                        </div>
                    </div>

                    <div class="energy-chart">
                        <div id="coalEnergyChart"></div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div> <!-- <div class="index_contentList">-->



<div class="col-lg-12 no-padding index_contentList">
    <div class="col-lg-12 mb14">
        <div class="index_contentBox clearfix">
            <div class="titbox clearfix no-padding no-margin">
                <div class="pull-left energyTit analy_tit"><i></i>分公司能耗明细<small class="font-sm">Assessment indicators</small></div>
                <a href="javascript:;" class="pull-right exportlist mr15">导出列表</a>
            </div>
            <div class="AssessmentBox rconttable col-lg-12 no-padding">
                <table class="table table-striped table-bordered table-hover col-lg-12 no-padding">
                    <thead>
                    <tr class="first_tr">
                        <td>分公司</td>
                        <td>能源总量（万GJ）</td>
                        <td>水能总量（T）</td>
                        <td>电耗总量(Kw/h)</td>
                        <td>气能耗总量（M²）</td>
                        <td>热能耗总量（GJ）</td>
                        <td>煤能耗总量（GJ）</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td class="need_title">800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td class="need_title">800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>

                    </tbody>
                </table>

                <div class="col-lg-12 no-padding mt20" style="border-bottom: 1px solid #d0d4d9;">
                    <div class="col-lg-6 no-padding analyBoxList" style="border-right: 1px solid #d0d4d9;">
                        <div id="piechart" style="width: 100%;height:268px;"></div>
                        <div class="piechartTit">
                            分公司能耗占比分布图
                        </div>
                    </div>
                    <div class="col-lg-6 no-padding analyBoxList analyBoxline">
                        <div id="linechart" style="width: 100%;height:268px;"></div>

                        <div class="piechartTit">
                            分公司能耗趋势对比图
                        </div>
                    </div>

                </div>
                <div class="col-lg-12 no-padding">
                    <div class="col-lg-6 no-padding analyBoxList" style="border-right: 1px solid #d0d4d9;">
                        <div id="barchart01" style="width: 100%;height:268px;" ></div>
                        <div class="piechartTit">
                            分公司能耗同比
                        </div>
                    </div>
                    <div class="col-lg-6 no-padding analyBoxList">
                        <div id="barchart02" style="width: 100%;height:268px;" ></div>
                        <div class="piechartTit">
                            分公司能耗排名
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</div> <!-- <div class="index_contentList">-->

<div class="col-lg-12 no-padding index_contentList">
    <div class="col-lg-12 mb14">
        <div class="index_contentBox clearfix">
            <div class="titbox clearfix no-padding no-margin">
                <div class="pull-left energyTit analy_tit_as"><i></i>能源流明细<small class="font-sm">Assessment indicators</small></div>
                <a href="javascript:;" class="pull-right exportlist mr15">导出列表</a>
            </div>
            <div class="AssessmentBox rconttable col-lg-12 no-padding">
                <table class="table table-striped table-bordered table-hover col-lg-12 no-padding">
                    <thead>
                    <tr class="first_tr">
                        <td>分公司</td>
                        <td>能源总量（万GJ）</td>
                        <td>水能总量（T）</td>
                        <td>电耗总量(Kw/h)</td>
                        <td>气能耗总量（M²）</td>
                        <td>热能耗总量（GJ）</td>
                        <td>煤能耗总量（GJ）</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td class="need_title">800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td class="need_title">800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr class="bgc">
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>
                    <tr>
                        <td><a href="javascript:;" class="need_a">集团</a></td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                        <td>800（同<span class="bluecolor">1.2↓</span>&nbsp;环&nbsp;<span class="redcolor">1.2↑</span>）</td>
                    </tr>

                    </tbody>
                </table>

                <div class="col-lg-12 no-padding mt20" style="border-bottom: 1px solid #d0d4d9;">
                    <div class="col-lg-6 no-padding analyBoxList" style="border-right: 1px solid #d0d4d9;">
                        <div id="piechart_as" style="width: 100%;height:268px;"></div>
                        <div class="piechartTit">
                            能源流能耗占比分布图
                        </div>
                    </div>
                    <div class="col-lg-6 no-padding analyBoxList analyBoxline">
                        <div id="linechart_as" style="width: 100%;height:268px;"></div>

                        <div class="piechartTit">
                            能源流能耗趋势对比图
                        </div>
                    </div>

                </div>
                <div class="col-lg-12 no-padding">
                    <div class="col-lg-6 no-padding analyBoxList" style="border-right: 1px solid #d0d4d9;">
                        <div id="barchart01_as" style="width: 100%;height:268px;" ></div>
                        <div class="piechartTit">
                            能源流能耗同比
                        </div>
                    </div>
                    <div class="col-lg-6 no-padding analyBoxList">

                    </div>
                </div>

            </div>
        </div>

    </div>

</div> <!-- <div class="index_contentList">-->
</div>

</div>
</div>

<div id="footer"><!--footerload加载--></div>

<script src="js/jquery/jquery.min.js"></script>
<script src="js/echarts/echarts3/echarts.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>

<script src="js/public.js"></script>

<script src="js/energy_chart.js"></script>
<script src="js/navscript.js"></script>
<script>
    startTime("#date_today");
</script>
<!-- inline scripts related to this page -->
<script>
    $(function(){

        //$("#header").load("header.html",function(){});
        $("#footer").load("footer.html",function(){});

        $(".select-boxbtnAlarm .btnAlarm").click(function(){
            $(this).addClass("btnAlarm-on").siblings().removeClass("btnAlarm-on");

            var thisText = $(this).text();
            if (thisText == "自定义" ) {
                $(".select-boxWdate input").attr("disabled",false).removeClass("time-input-disable");
            }else{
                $(".select-boxWdate input").attr("disabled",true).addClass("time-input-disable");
            }
        });

    })

</script>


</body>
</html>