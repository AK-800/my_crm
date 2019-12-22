package com.ujiuye.util;

import com.ujiuye.cus.bean.Customer;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class POIExcel {

    public void outExcel() throws IOException {
        //创建workbook
        HSSFWorkbook wk = new HSSFWorkbook();
        //创建一页excel
        Sheet sheet = wk.createSheet("客户信息表");
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

        List<Customer> list = new ArrayList<>();
        for(int i=1;i<list.size();i++){
            Customer cus = list.get(i);
            //创建新的行
            Row row1 = sheet.createRow(i);

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
        wk.write(new FileOutputStream("E:/upload/customer.xls"));
    }
}
