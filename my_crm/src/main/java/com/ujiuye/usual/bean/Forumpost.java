package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;
import java.util.List;

public class Forumpost {
    private Integer forumid;

    private String forumtitle;

    private String forumcontent;

    private Integer empFk3;

    private Date createtime;

    private Integer status;

    private Employee employee;

    private List<Evaluate> evaluate;

    public List<Evaluate> getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(List<Evaluate> evaluate) {
        this.evaluate = evaluate;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getForumid() {
        return forumid;
    }

    public void setForumid(Integer forumid) {
        this.forumid = forumid;
    }

    public String getForumtitle() {
        return forumtitle;
    }

    public void setForumtitle(String forumtitle) {
        this.forumtitle = forumtitle == null ? null : forumtitle.trim();
    }

    public String getForumcontent() {
        return forumcontent;
    }

    public void setForumcontent(String forumcontent) {
        this.forumcontent = forumcontent == null ? null : forumcontent.trim();
    }

    public Integer getEmpFk3() {
        return empFk3;
    }

    public void setEmpFk3(Integer empFk3) {
        this.empFk3 = empFk3;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Forumpost{" +
                "forumid=" + forumid +
                ", forumtitle='" + forumtitle + '\'' +
                ", forumcontent='" + forumcontent + '\'' +
                ", empFk3=" + empFk3 +
                ", createtime=" + createtime +
                ", status=" + status +
                ", employee=" + employee +
                ", evaluate=" + evaluate +
                '}';
    }
}