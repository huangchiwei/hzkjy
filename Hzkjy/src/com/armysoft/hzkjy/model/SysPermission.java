package com.armysoft.hzkjy.model;

import java.io.Serializable;


public class SysPermission implements Serializable {

	/** ไธป้ฎ  */
	private Integer id;
	/** ๆ?ฑๆจกๅ็ผๅท */
	private SysModule moduleNo;
	/** ๆ้ๅ?*/
	private String permName;
	/** ๆ้ๅ?*/
	private String permValue;
	/** ๆ้็ฑปๅ 0๏ผ่ๅๆ้?1๏ผๆไฝๆ้?*/
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
