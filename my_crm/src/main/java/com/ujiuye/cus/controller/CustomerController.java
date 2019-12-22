package com.ujiuye.cus.controller;

import com.alibaba.druid.support.spring.stat.SpringStatUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.service.CustomerService;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Customer")
public class CustomerController {

    @Resource
    CustomerService service;

    @RequestMapping("addCustomer")
    public String addCustomer(Customer customer){
        service.addCustomer(customer);
        return "customer";
    }

    @RequestMapping("getAllCustomer")
    @ResponseBody
    public List<Customer> getAllCustomer(){
        // System.out.println("---");
        List<Customer> list = service.getAllCustomer();
        // System.out.println(list);
        return list;
    }

    // @RequestMapping("searchCustomer")
    // @ResponseBody
    // public List<Customer> searchCustomer(int cid,int oid,String keyword){
    //     List<Customer> list = service.searchCustomer(cid,oid,keyword);
    //     return list;
    // }

    //查询单个用户信息
    @RequestMapping("getCustomer")
    public String getCustomer(int id, Model model){
        // System.out.println(id);
        Customer customer = service.getCustomer(id);
        // System.out.println(customer);
        model.addAttribute("customer",customer);
        return "customer-edit";
    }

    //查询用户详细信息
    @RequestMapping("getCustomerDetail")
    public String getCustomerDetail(int id, Model model){
        Customer customer = service.getCustomer(id);
        model.addAttribute("customer",customer);
        return "customer-look";
    }

    //修改用户信息
    @RequestMapping("updateCustomer")
    public String updateCustomer(Customer customer){  //可以传对象，也可以传属性参数
        service.updateCustomer(customer);
        return "customer";
    }

    //批量删除
    @RequestMapping("batchDelete")
    @ResponseBody
    public boolean batchDelete(String arr){
        String[] id = arr.split(",");
        for(int i=0;i<id.length;i++){
            service.batchDelete(Integer.parseInt(id[i]));
        }
        return true;
    }

    //查询全部的用户信息
    @RequestMapping("getCusInfo")
    @ResponseBody
    public List<Customer> getCusInfo(){
        return  service.getAllCustomer();
    }

    //分页查询
    @RequestMapping("getCustomerByPage")
    @ResponseBody
    public PageInfo<Customer> getCustomerByPage(int curPage,int cid,int oid,String keyword) {

        PageHelper.startPage(curPage,8);  // 页码，每页的数据量

        List<Customer> list = service.getCustomerByCond(cid,oid,keyword);  //根据选择的条件查询用户数据
        // System.out.println(list);

        PageInfo<Customer> pageInfo = new PageInfo(list);  //把查询出的全部用户信息，自动进行分页
        if(pageInfo.getNextPage()==0)             //分页插件到尾页的时候，会重新回到第一页，要修正这个bug
            pageInfo.setNextPage(pageInfo.getPages());
        // List<Customer> cusList = pageInfo.getList();
        // for (Customer c:cusList) {
        //     System.out.println(c);
        // }

        // pageInfo.getPages()      //获取总页数
        // pageInfo.getPrePage()    //获取上一页的页码
        // pageInfo.getNextPage()   //获取下一页的页码
        // pageInfo.getTotal()      //获取数据总条数
        // pageInfo.getPageNum()    //获取当前的页码
        // pageInfo.getList()       //返回当前页的全部数据
        return pageInfo;
    }

    //导出Excel
    @RequestMapping("outExcel")
    @ResponseBody
    public int outExcel() throws IOException {

        //创建workbook
        HSSFWorkbook wk = new HSSFWorkbook();
        //创建一页excel
        Sheet sheet = wk.createSheet("sheet1");
        //如果有日期，需要设置日期格式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));

        //创建第一行
        Row row = sheet.createRow(0);
        Cell cell0 = row.createCell(0); //第一行的第一列
        cell0.setCellValue("序号");
        Cell cell1 = row.createCell(1); //第一行的第二列
        cell1.setCellValue("联系人");
        Cell cell2 = row.createCell(2); //第一行的第三列
        cell2.setCellValue("公司名称");
        Cell cell3 = row.createCell(3); //第一行的第四列
        cell3.setCellValue("添加时间");
        Cell cell4 = row.createCell(4); //第一行的第五列
        cell4.setCellValue("联系电话");

        //获取全部的用户信息
        List<Customer> list = service.getAllCustomer();
        for(int i=0;i<list.size();i++){
            Customer cus = list.get(i);
            //创建新的一行数据，从第二行开始,所以是i+1
            Row row1 = sheet.createRow(i+1);

            Cell c0 = row1.createCell(0);
            c0.setCellValue(cus.getId());
            Cell c1 = row1.createCell(1);
            c1.setCellValue(cus.getCompanyperson());
            Cell c2 = row1.createCell(2);
            c2.setCellValue(cus.getComname());
            Cell c3 = row1.createCell(3);
            //设置日期格式
            c3.setCellStyle(cellStyle);
            c3.setCellValue(cus.getAddtime());
            Cell c4 = row1.createCell(4);
            c4.setCellValue(cus.getComphone());
        }
        wk.write(new FileOutputStream("E:/Excel/用户信息表.xls"));
        return list.size();
    }


    // //分页查询
    // @RequestMapping("getCustomerByPage")
    // @ResponseBody
    // public Map getCustomerByPage(int curPage){  //全部数据都存到map集合里
    //     // System.out.println(cid);
    //     // System.out.println(keyword);
    //     System.out.println("金磊了=======");
    //     int total_page = service.getAllPage(10);         //获取总页数
    //     int total_count = service.getAllCount();            //获取数据总条数
    //     List<Customer> list = service.getCustomerByPage(curPage,10);
    //     int nextPage;
    //     int prePage;
    //     if(curPage == 1){
    //         prePage = 1;
    //     }else{
    //         prePage = curPage - 1;
    //     }
    //     if(curPage == total_page){
    //         nextPage = total_page;
    //     }else{
    //         nextPage = curPage + 1;
    //     }
    //     HashMap map = new HashMap();
    //     map.put("curPage",curPage);
    //     map.put("total_page",total_page);
    //     map.put("total_count",total_count);
    //     map.put("nextPage",nextPage);
    //     map.put("prePage",prePage);
    //     map.put("list",list);
    //     return map;
    // }
}
