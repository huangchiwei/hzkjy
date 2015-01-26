package com.gzjr.hzkjy.util;

import java.util.Date;
import java.io.File;
import java.text.SimpleDateFormat;


/**
 * 
 * 
 * Filename:    Constants.java  
 * Description:   公用的常量
 * Copyright:   Copyright (c) 2012 刘新  
 * Company:    gzjr 
 * @author:     刘新  
 * @version:    1.0  
 * Create at:   2012-12-10 上午11:26:34 
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2012-12-10       刘新        1.0        1.0 Version
 */
public class Constants {
	public final static String  OPERATE_TYPE_ADD = "0";
	public final static String  OPERATE_TYPE_UPDATE = "1";
	public final static String  OPERATE_TYPE_DELETE = "2";
	
	public final static String  RESULT_FAILED = "0";
	public final static String  RESULT_SUCCESS = "1";
	
	/**上传文件存放的路径*/
	public final static String PROJECT_LOCAL_PATH;
	public final static String NEWS_UPLOADPath ="D:/";
	public final static String NEWS_IMAGE_FILE_ADDR = "upFile_Motorcar/news/" + Constants.convertDate(new Date())+"/";
	public final static String DRIVER_UPLOADPath ="D:/";
	public final static String DRIVER_IMAGE_FILE_ADDR = "upFile_Motorcar/driver/" + Constants.convertDate(new Date())+"/";
	
	public final static String USER_INFO_SESSION = "userSessionInfo";
	
	public final static String USER_NAME_SESSION = "USER_NAME_SESSION";//放到session中登录名的key
	
	
	public final static int FRONT_LIMIT=10;//前台获取记录的条数
	public final static int FRONT_PAGESIZE=10;//前台分页每一页的记录数
	public final static String FRONT_WHERE_SQL=" where 1=1 ";//前台查询条件，意思为审核通过并未被隐藏
	public final static String FRONT_ORDER=" order by isTop desc,editTimeI desc,id desc ";//前台查询排序
	public final static String FRONT_WHERE_SQL_AND_ORDER=FRONT_WHERE_SQL +FRONT_ORDER;//前台查询条件和排序
	
	static{
		PROJECT_LOCAL_PATH=getRealPath2();
	}
	
	public static String convertDate(Date date) {
		SimpleDateFormat todayDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		return todayDateFormatter.format(date);
	}

	public static String convertDatetime(Date date) {
		SimpleDateFormat todayDateFormatter = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss.S");
		return todayDateFormatter.format(date);
	}
    //获取该项目运行的本地的根路径,如:D:\linshaozhi\apache-tomcat-6.0.32\webapps\gy\(其中gy为项目的名称)
    //注意返回结果没有最后的斜杆(用于类中)
    public static String getRealPath2(){
    	try{
    		String classPath = Constants.class.getClassLoader().getResource("/").getPath();
    		  String rootPath  = "";
    		  //windows下
    		  if("\\".equals(File.separator)){   
    		   rootPath  = classPath.substring(1,classPath.indexOf("/WEB-INF/classes"));
    		   rootPath = rootPath.replace("/", "\\");
    		  }
    		  //linux下
    		  if("/".equals(File.separator)){   
    		   rootPath  = classPath.substring(0,classPath.indexOf("/WEB-INF/classes"));
    		   rootPath = rootPath.replace("\\", "/");
    		  }
    		  rootPath=rootPath.replaceAll("%20", " ");
    		  return rootPath;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
    	}
    	return "";
    }
}
