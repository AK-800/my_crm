package com.ujiuye.auth.bean;

import java.io.Serializable;
import java.util.List;

public class Role {
    private Integer roleid;

    private String rolename;

    private String roledis;

    private Integer status;

    private List<Sources> sources;

    public List<Sources> getSources() {
        return sources;
    }

    public void setSources(List<Sources> sources) {
        this.sources = sources;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getRoledis() {
        return roledis;
    }

    public void setRoledis(String roledis) {
        this.roledis = roledis == null ? null : roledis.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", roledis='" + roledis + '\'' +
                ", status=" + status +
                ", sources=" + sources +
                '}';
    }
}