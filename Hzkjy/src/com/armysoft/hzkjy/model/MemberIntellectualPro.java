package com.armysoft.hzkjy.model;
import java.util.Date;

/**
 * 知识产权表
 * News entity. @author MyEclipse Persistence Tools
 */

public class MemberIntellectualPro implements java.io.Serializable {

	// Fields

	private Long id;
	private String memberNo;           //企业编号
	private Integer projectLevel;       //项目级别 0国家级 1省级 2市级 3区级
	private String projectType;     //项目类别
	private String projectName;     //项目名称
	private Float applyAmount;      //申报额度(万)
	private Integer isSetUp;         //是否立项0不立项 1立项
	private Float setUpAmount;        //立项资助金额(万)
	private Date applyTime;          //申报时间
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
	public Integer getProjectLevel() {
		return projectLevel;
	}
	public void setProjectLevel(Integer projectLevel) {
		this.projectLevel = projectLevel;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Float getApplyAmount() {
		return applyAmount;
	}
	public void setApplyAmount(Float applyAmount) {
		this.applyAmount = applyAmount;
	}
	public Integer getIsSetUp() {
		return isSetUp;
	}
	public void setIsSetUp(Integer isSetUp) {
		this.isSetUp = isSetUp;
	}
	public Float getSetUpAmount() {
		return setUpAmount;
	}
	public void setSetUpAmount(Float setUpAmount) {
		this.setUpAmount = setUpAmount;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	
}