package com.ujiuye.cus.service;


import com.ujiuye.cus.bean.Customer;

import java.util.List;

public interface CustomerService {
    int addCustomer(Customer customer);

    //查询全部用户
    List<Customer> getAllCustomer();


    Customer getCustomer(int id);

    void updateCustomer(Customer customer);

    //分页查询
    List<Customer> getCustomerByPage(int curPage, int size);

    //获取数据总条数
    int getAllCount();

    int batchDelete(int id);

    //根据选择的条件查询用户数据
    List<Customer> getCustomerByCond(int cid, int oid, String keyword);
}
