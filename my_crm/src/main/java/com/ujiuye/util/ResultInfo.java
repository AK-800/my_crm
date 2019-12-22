package com.ujiuye.util;
//返回结果需要携带信息
public class ResultInfo {
    private boolean  flag;
    private String  othermsg;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getOthermsg() {
        return othermsg;
    }

    public void setOthermsg(String othermsg) {
        this.othermsg = othermsg;
    }
}
