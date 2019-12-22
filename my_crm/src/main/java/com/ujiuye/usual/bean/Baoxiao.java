package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;
import java.util.List;

public class Baoxiao {
    private String bxid;

    private Integer paymode;

    private Double totalmoney;

    private Date bxtime;

    private String bxremark;

    private Integer bxstatus;

    private Integer empFk;

    private String result;

    private Employee employee;

    private Expendituretype expendituretype;

    private List<Baoxiaoreply> baoxiaoreply;

    public List<Baoxiaoreply> getBaoxiaoreply() {
        return baoxiaoreply;
    }

    public void setBaoxiaoreply(List<Baoxiaoreply> baoxiaoreply) {
        this.baoxiaoreply = baoxiaoreply;
    }

    public Expendituretype getExpendituretype() {
        return expendituretype;
    }

    public void setExpendituretype(Expendituretype expendituretype) {
        this.expendituretype = expendituretype;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getBxid() {
        return bxid;
    }

    public void setBxid(String bxid) {
        this.bxid = bxid == null ? null : bxid.trim();
    }

    public Integer getPaymode() {
        return paymode;
    }

    public void setPaymode(Integer paymode) {
        this.paymode = paymode;
    }

    public Double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public Date getBxtime() {
        return bxtime;
    }

    public void setBxtime(Date bxtime) {
        this.bxtime = bxtime;
    }

    public String getBxremark() {
        return bxremark;
    }

    public void setBxremark(String bxremark) {
        this.bxremark = bxremark == null ? null : bxremark.trim();
    }

    public Integer getBxstatus() {
        return bxstatus;
    }

    public void setBxstatus(Integer bxstatus) {
        this.bxstatus = bxstatus;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    @Override
    public String toString() {
        return "Baoxiao{" +
                "bxid='" + bxid + '\'' +
                ", paymode=" + paymode +
                ", totalmoney=" + totalmoney +
                ", bxtime=" + bxtime +
                ", bxremark='" + bxremark + '\'' +
                ", bxstatus=" + bxstatus +
                ", empFk=" + empFk +
                ", result='" + result + '\'' +
                ", employee=" + employee +
                ", expendituretype=" + expendituretype +
                ", baoxiaoreply=" + baoxiaoreply +
                '}';
    }
}