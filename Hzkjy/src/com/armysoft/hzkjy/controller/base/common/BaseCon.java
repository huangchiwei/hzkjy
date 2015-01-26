package com.armysoft.hzkjy.controller.base.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.gzjr.web.page.PageUnit;
import org.gzjr.web.page.SqlUnit;

import com.gzjr.hzkjy.util.Constants;



/**
 * 
 * Filename:    BaseCon.java  
 * Description:   记得说点啥！！！
 * Copyright:   Copyright (c) 2012 刘新  
 * Company:    gzjr 
 * @author:     刘新  
 * @version:    1.0  
 * Create at:   2012-11-7 下午05:23:43 
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2012-11-7       刘新        1.0        1.0 Version
 */
public class BaseCon {

	private String orderByColumn = "id";
	private String orderByType = "asc";
	private String values;

	private String searchValue;
	private String searchText;
	private String tag;
	
	public final static String LIST = "/list/{currentPage}";
	public final static String ADD = "/add";
	public final static String UPDATE = "/update/{id}";
	public final static String SAVE = "/save";
	public final static String DELETE = "/delete/{id}";

	protected List<SqlUnit> sList = new ArrayList<SqlUnit>();
	protected PageUnit pUnit = new PageUnit();
	



	public void PageInit(int current) {
		sList.clear();
		pUnit.setPageSize(15);
		pUnit.setCurrentPage(current);
		pUnit.setOrderByColumn(getOrderByColumn());
		pUnit.setOrderByType(getOrderByType());

	}
	
	public String setOperateMessage(String opeMess,String type) {
		//日志结合在一�?
		String ope = "";
		String res = "";
		if(Constants.OPERATE_TYPE_ADD.equals(opeMess)) {
			ope = "增加成功";
			res = "增加了一条" + type;
		}else if(Constants.OPERATE_TYPE_UPDATE.equals(opeMess)) {
			ope = "修改成功";
			res = "修改了一条" + type;
		}else if(Constants.OPERATE_TYPE_DELETE.equals(opeMess)) {
			ope = "删除成功";
			res = "删除了一条" + type;
		}
//		SysLog log = new SysLog();
//		log.setLogDemo(res);
//		log.setCreateTime(new Date());
//		log.setCreateUser("admin");
//		logService.saveLog(log);
		return ope;
	}

	public boolean IsEmptyOrNull(String str) {
		if (str == null || "".equals(str.trim()))
			return true;
		return false;
	}
	
	public String getCurrentPage(HttpServletRequest request) {
		String currentPage  = request.getParameter("currentPage");
		if(currentPage == null || "".equals(currentPage)){
			currentPage = "1";
		}
		return currentPage;
	}
    
	
	public String getOrderByColumn() {
		return orderByColumn;
	}

	public void setOrderByColumn(String orderByColumn) {
		this.orderByColumn = orderByColumn;
	}

	public String getOrderByType() {
		return orderByType;
	}

	public void setOrderByType(String orderByType) {
		this.orderByType = orderByType;
	}

	public String getValues() {
		return values;
	}

	public void setValues(String values) {
		this.values = values;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}


	

}
