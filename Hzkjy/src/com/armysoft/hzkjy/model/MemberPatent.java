package com.armysoft.hzkjy.model;

import java.util.Date;

/**
 * 知识产权表
 * News entity. @author MyEclipse Persistence Tools
 */

public class MemberPatent implements java.io.Serializable {

	// Fields

	private Long id;
	private String memberNo;               
	private String type;    
	private String name;    
	private String patentNo;
	private Date applyTime;
	private Integer status;          //发送状态 0一对一 1一对多
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPatentNo() {
		return patentNo;
	}
	public void setPatentNo(String patentNo) {
		this.patentNo = patentNo;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}      

	
}