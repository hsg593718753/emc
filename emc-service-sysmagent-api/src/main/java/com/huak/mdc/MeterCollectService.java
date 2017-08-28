package com.huak.mdc;

import com.huak.common.page.Page;
import com.huak.common.page.PageResult;
import com.huak.mdc.model.MeterCollect;

import java.util.Map;

/**
 * Copyright (C), 2009-2012, 北京华热科技发展有限公司.<BR>
 * ProjectName:emc<BR>
 * File name:  com.huak.mdc<BR>
 * Author:  Administrator  <BR>
 * Project:emc    <BR>
 * Version: v 1.0      <BR>
 * Date: 2017/8/28<BR>
 * Description:     <BR>
 * Function List:  <BR>
 */

public interface MeterCollectService {

    /**
     * 计量器具删除信息
     */
    public int deleteByPrimaryKey(String id);
    /**
     * 计量器具新增信息
     */
    public int insertSelective(MeterCollect record);
    /**
     * 计量器具新增信息
     */
    public int insert(MeterCollect record);
    /**
     * 计量器具根据id查询
     */
    public MeterCollect selectByPrimaryKey(String id);
    /**
     * 计量器具修改信息
     */
    public int updateByPrimaryKeySelective(MeterCollect record);

    /**
     * 计量器具管理查询
     */
    public PageResult<MeterCollect> queryByPage(Map<String,Object> paramsMap, Page page);



}
