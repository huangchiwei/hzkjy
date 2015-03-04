package com.armysoft.hzkjy.controller.base.common;

public enum AuthorityEnum {
	//用户管理
	MemberBasic_delete("删除会员","mb_del"),
	MemberBasic_update("修改会员","mb_updt"),
	MemberBasic_save("修改会员","mb_save"),
	MemberBasic_list("会员管理","hy_list"),
	SysUser_delete("删除用户","us_del"),
	SysUser_update("修改用户","us_updt"),
	SysUser_save("添加用户","us_save"),
	SysUser_changeStatus("�?��/冻结用户","us_chasta"),
	SysUser_list("用户管理","us_list"),
	//角色管理
	SysRole_save("添加角色","ro_save"),
	SysRole_update("修改角色","ro_updt"),
	SysRole_delete("删除角色","ro_del"),
	SysRole_list("角色管理","ro_list"),
	SysRole_saveRolePerm("角色分配权限","ro_saveperm");
	
	
	
	private String cnName;
	private String enName;

	private AuthorityEnum(String cnName, String enName) {
	    this.cnName = cnName;
	    this.enName = enName;
	}

	public String getCnName() {
		return cnName;
	}

	
	public String getEnName() {
		return enName;
	}
}
