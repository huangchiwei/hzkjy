package com.armysoft.hzkjy.model;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class NewsLink implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String urlLink;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrlLink() {
		return urlLink;
	}
	public void setUrlLink(String urlLink) {
		this.urlLink = urlLink;
	}
	
	
	
}