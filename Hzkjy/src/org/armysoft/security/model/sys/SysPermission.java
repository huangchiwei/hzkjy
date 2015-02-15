package org.armysoft.security.model.sys;

import java.io.Serializable;

/**
 * 权限实体
 * @author wei
 * @date 2014-04-28
 */
public class SysPermission implements Serializable {

	/** 主键  */
	private Integer id;
	/** 所属模块编号 */
	private SysModule moduleNo;
	/** 权限名 */
	private String permName;
	/** 权限值 */
	private String permValue;
	/** 权限类型 0：菜单权限 1：操作权限 */
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
