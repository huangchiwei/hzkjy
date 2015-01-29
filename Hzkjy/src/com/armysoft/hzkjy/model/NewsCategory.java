package com.armysoft.hzkjy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * NewsCategory entity. @author MyEclipse Persistence Tools
 */

public class NewsCategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String cateCode;
	private String cateName;
	private String remark;

	

	
}