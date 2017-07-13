package com.huak.task;

import com.huak.weather.WeatherTaskService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Copyright (C), 2009-2012, 北京华热科技发展有限公司.<BR>
 * ProjectName:emc<BR>
 * File name:  com.huak.task<BR>
 * Author:  lichao  <BR>
 * Project:emc    <BR>
 * Version: v 1.0      <BR>
 * Date: 2017/7/11<BR>
 * Description:   定时任务测试  <BR>
 * Function List:  <BR>
 */
@Component
public class WeatherTask {
    @Resource
    private WeatherTaskService weatherTaskService;

    public void currentWeather(){
        System.out.println("-----------------ceshi");
        Map<String,Object> params = new HashMap<>();
        params.put("weatherId","101031200");
        params.put("status",0);
        weatherTaskService.executeWeatherTask(params);
    }
    public void forcastWeather7d(){
        System.out.println("-----------------");
        Map<String,Object> params = new HashMap<>();
        params.put("weatherId","101031200");
        params.put("status",0);
        weatherTaskService.executeWeather7dTask(params);
    }
}
