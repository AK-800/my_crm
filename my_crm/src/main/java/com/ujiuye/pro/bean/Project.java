package com.ujiuye.pro.bean;

import com.ujiuye.cus.bean.Customer;
import com.ujiuye.emp.bean.Employee;

import java.util.Date;

public class Project {

    private Integer pid;

    private String pname;

    private Integer comname;

    private Integer emp_fk1;

    private Integer empcount;

    private String starttime;

    private String buildtime;

    private Integer cost;

    private String level;

    private String endtime;

    private String remark;

    private Integer emp_fk;

    private Employee employee;

    private Customer customer;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getComname() {
        return comname;
    }

    public void setComname(Integer comname) {
        this.comname = comname;
    }

    public Integer getEmp_fk1() {
        return emp_fk1;
    }

    public void setEmp_fk1(Integer emp_fk1) {
        this.emp_fk1 = emp_fk1;
    }

    public Integer getEmpcount() {
        return empcount;
    }

    public void setEmpcount(Integer empcount) {
        this.empcount = empcount;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(String buildtime) {
        this.buildtime = buildtime;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getEmp_fk() {
        return emp_fk;
    }

    public void setEmp_fk(Integer emp_fk) {
        this.emp_fk = emp_fk;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Project{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", comname=" + comname +
                ", emp_fk1=" + emp_fk1 +
                ", empcount=" + empcount +
                ", starttime='" + starttime + '\'' +
                ", buildtime='" + buildtime + '\'' +
                ", cost=" + cost +
                ", level='" + level + '\'' +
                ", endtime='" + endtime + '\'' +
                ", remark='" + remark + '\'' +
                ", emp_fk=" + emp_fk +
                ", employee=" + employee +
                ", customer=" + customer +
                '}';
    }
}