package com.armysoft.hzkjy.model;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class NewsContact implements java.io.Serializable {

	// Fields

	private Long id;
	private String tel;
	private String max;
	private String address;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}