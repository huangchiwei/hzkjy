package com.armysoft.hzkjy.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public abstract class DateUtil {
	
	public static GregorianCalendar gc = new GregorianCalendar();
	/**
	 * 时间转换格式：Date.UTC(yyyy,MM,dd,HH,mm,ss)
	 * HighCharts 月份要减 1
	 * @param date
	 * @return
	 */
	public static String formatHChartsDate(Date date){
		gc.setTime(date);
		gc.add(2, -1);//2 表示月份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
		return "Date.UTC(" + sdf.format(gc.getTime()) + ")";
	}
	
	/**
	 * 将时间转化成字符串格式：yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String parseDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 将时间转化成自定义格�?
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String parseDate(Date date,String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			return sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
