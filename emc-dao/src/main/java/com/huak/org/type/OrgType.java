package com.huak.org.type;

/**
 * Copyright (C), 2009-2012, 北京华热科技发展有限公司.<BR>
 * ProjectName:emc<BR>
 * File name:  com.huak.org.type<BR>
 * Author:  lichao  <BR>
 * Project:emc    <BR>
 * Version: v 1.0      <BR>
 * Date: 2017/5/26<BR>
 * Description:   组织机构枚举  <BR>
 * Function List:  <BR>
 */
public enum OrgType {
    GS(1,"公司"),
    FGS(2,"分公司"),
    ZX(3,"中心"),
    FWZ(4,"服务站"),
    RY(5,"热源"),
    YCW(6,"一次网"),
    RLZ(7,"热力站"),
    ECX(8,"二次线"),
    XQ(9,"小区"),
    LD(10,"楼栋"),
    DY(11,"单元"),
    FJ(12,"房间");

    private int key;
    private String value;

    OrgType(int key, String value) {
        this.key = key;
        this.value = value;
    }

    public int getKey() {
        return key;
    }

    public void setKey(int key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
