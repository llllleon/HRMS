package com.bjsxt.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description：时间格式转换工具
 * @author lyj
 * @date 2018年11月30日
 *
 */
public class DateUtil {
	private DateUtil() {
	}
	/**
	 * @description：获得当前时间的字符串对象
	 * @return
	 */
	public static String getDateStr(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
	
	/**
	 * @description：获得当前时间的sql格式时间对象
	 * @return
	 */
	public static java.sql.Date getSqlDate(){
		return new java.sql.Date(new Date().getTime());
	}
	
	/**
	 * @description：获得指定时间的sql格式时间对象
	 * @return
	 */
	public static java.sql.Date getSqlDate(String dateStr){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new java.sql.Date(sdf.parse(dateStr).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
