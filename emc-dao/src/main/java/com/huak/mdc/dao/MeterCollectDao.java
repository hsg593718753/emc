package com.huak.mdc.dao;

import com.huak.mdc.model.MeterCollect;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Map;

@Repository
public interface MeterCollectDao {
    int deleteByPrimaryKey(String id);

    int insert(MeterCollect record);

    int insertSelective(MeterCollect record);

    MeterCollect selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(MeterCollect record);

    int updateByPrimaryKey(MeterCollect record);

    List<MeterCollect> selectPageByMap(Map<String,Object> paramsMap);

    List<Map<String,Object>> selectAllByMap(Map<String, Object> paramsMap);

    List<MeterCollect>  checkCode(Map<String,Object> paramsMap);

    List<MeterCollect>  checkSerialNo(String serialNo);

    List<Map<String,Object>> getUnitInfo(String unitType);
}