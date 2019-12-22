package com.ujiuye.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    public static String getDate(Date date){
        // Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(date);
    }
}
