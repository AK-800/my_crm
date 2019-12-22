package com.ujiuye.cus.bean;
/*
* 扩展我们的customer条件查询
* */
public class CustomerVo extends  Customer {

    private  Integer  keyindex;
    //查询关键字
    private String  keyCode;
    //排序标号
    private Integer  num;

    public String getKeyCode() {
        return keyCode;
    }

    public void setKeyCode(String keyCode) {
        this.keyCode = keyCode;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getKeyindex() {
        return keyindex;
    }

    public void setKeyindex(Integer keyindex) {
        this.keyindex = keyindex;
    }
}
