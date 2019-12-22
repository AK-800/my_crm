package com.ujiuye.pro.bean;

public class Module {
    private Integer id;

    private String proname;

    private Integer analysis_fk;

    private String modname;

    private String level;

    private String simpledis;

    private String detaileddis;

    private String remark;

    private String addtime;

    private String updatetime;

    private Analysis analysis;

    public Integer getAnalysis_fk() {
        return analysis_fk;
    }

    public void setAnalysis_fk(Integer analysis_fk) {
        this.analysis_fk = analysis_fk;
    }

    public Analysis getAnalysis() {
        return analysis;
    }

    public void setAnalysis(Analysis analysis) {
        this.analysis = analysis;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }



    public String getModname() {
        return modname;
    }

    public void setModname(String modname) {
        this.modname = modname == null ? null : modname.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getSimpledis() {
        return simpledis;
    }

    public void setSimpledis(String simpledis) {
        this.simpledis = simpledis == null ? null : simpledis.trim();
    }

    public String getDetaileddis() {
        return detaileddis;
    }

    public void setDetaileddis(String detaileddis) {
        this.detaileddis = detaileddis == null ? null : detaileddis.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", proname='" + proname + '\'' +
                ", analysis_fk=" + analysis_fk +
                ", modname='" + modname + '\'' +
                ", level='" + level + '\'' +
                ", simpledis='" + simpledis + '\'' +
                ", detaileddis='" + detaileddis + '\'' +
                ", remark='" + remark + '\'' +
                ", addtime='" + addtime + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", analysis=" + analysis +
                '}';
    }
}