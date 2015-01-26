package com.armysoft.hzkjy.model;

import java.io.Serializable;


public class SysPermission implements Serializable {

	/** 主键  */
	private Integer id;
	/** �?��模块编号 */
	private SysModule moduleNo;
	/** 权限�?*/
	private String permName;
	/** 权限�?*/
	private String permValue;
	/** 权限类型 0：菜单权�?1：操作权�?*/
	private Integer permType;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPermName() {
		return permName;
	}
	public void setPermName(String permName) {
		this.permName = permName;
	}
	public String getPermValue() {
		return permValue;
	}
	public void setPermValue(String permValue) {
		this.permValue = permValue;
	}
	public SysModule getModuleNo() {
		return moduleNo;
	}
	public void setModuleNo(SysModule moduleNo) {
		this.moduleNo = moduleNo;
	}
	public Integer getPermType() {
		return permType;
	}
	public void setPermType(Integer permType) {
		this.permType = permType;
	}

}
