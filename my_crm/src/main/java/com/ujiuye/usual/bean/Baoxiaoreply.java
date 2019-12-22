package com.ujiuye.usual.bean;

import java.util.Date;

public class Baoxiaoreply {
    private Integer id;

    private String content;

    private Date replytime;

    private String baoxiaoFk;

    private Integer status;

    private Baoxiao baoxiao;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Baoxiao getBaoxiao() {
        return baoxiao;
    }

    public void setBaoxiao(Baoxiao baoxiao) {
        this.baoxiao = baoxiao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public String getBaoxiaoFk() {
        return baoxiaoFk;
    }

    public void setBaoxiaoFk(String baoxiaoFk) {
        this.baoxiaoFk = baoxiaoFk == null ? null : baoxiaoFk.trim();
    }

    @Override
    public String toString() {
        return "Baoxiaoreply{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", replytime=" + replytime +
                ", baoxiaoFk='" + baoxiaoFk + '\'' +
                ", baoxiao=" + baoxiao +
                '}';
    }
}