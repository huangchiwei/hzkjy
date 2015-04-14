package com.armysoft.hzkjy.model;

import java.util.Date;

public class DbMessage implements java.io.Serializable {
	private Integer id;
	private String messagename;
	private String creater;
	public String getCreater() { 
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private String type;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMessagename() {
		return messagename;
	}
	public void setMessagename(String messagename) {
		this.messagename = messagename;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private String message;
	
}