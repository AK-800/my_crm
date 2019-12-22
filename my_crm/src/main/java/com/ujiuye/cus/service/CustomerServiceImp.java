package com.ujiuye.cus.service;

import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.mapper.CustomerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImp implements CustomerService{

    @Resource
    CustomerMapper dao;

    public int addCustomer(Customer customer) {
        customer.setAddtime(new Date());
        return dao.addCustomer(customer);
    }

    public List<Customer> getAllCustomer() {
        return dao.getAllCustomer();
    }


    public Customer getCustomer(int id) {
        return dao.getCustomer(id);
    }

    public void updateCustomer(Customer customer) {
        dao.updateCustomer(customer);
    }


    public List<Customer> getCustomerByPage(int curPage, int size) {
        int startPage = size * (curPage-1);
        return dao.getCustomerByPage(startPage,size);
    }


    //获取数据总条数
    public int getAllCount() {
        return dao.getCount();
    }

    //批量删除
    public int batchDelete(int id){
        return dao.batchDelete(id);
    }


    //根据选择的条件查询用户数据
    public List<Customer> getCustomerByCond(int cid, int oid, String keyword) {
        return dao.getCustomerByCond(cid,oid,keyword);
    }



    // public List<Customer> searchCustomer(int cid, int oid, String keyword) {
    //     if(cid == 0){
    //         if(oid == 0){
    //             // System.out.println(cid+":"+oid+":"+keyword);
    //             List<Customer> list = dao.searchCustomer01(cid,oid,keyword);
    //             // System.out.println(list);
    //             return list;
    //         }
    //         if(oid == 1){
    //             List<Customer> list = dao.searchCustomer01(cid,oid,keyword);
    //             return list;
    //         }
    //     }
    //     return null;
    // }


    // public int getAllPage(int size) {
    //     int total_page = 0;
    //     int total_count = dao.getCount();
    //     if(total_count % size == 0){
    //         total_page = total_count / size;
    //     }else{
    //         total_page = total_count / size + 1;
    //     }
    //     return total_page;
    // }
}
