package com.armysoft.hzkjy.model;
import java.util.Date;

import com.mysql.jdbc.Clob;
public class  BsNews implements java.io.Serializable {
      private   Integer id;   
      private   String title;
      public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getIseveryone() {
		return iseveryone;
	}
	public void setIseveryone(String iseveryone) {
		this.iseveryone = iseveryone;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

	private   String receiver;   
      private   String iseveryone;   
      private   String creater;   
      private   String content;   
      private   Date activeTime;   
      
      private String receiverBh;
      public String getReceiverBh() {
		return receiverBh;
	}
	public void setReceiverBh(String receiverBh) {
		this.receiverBh = receiverBh;
	}
	public Date getActiveTime() {
		return activeTime;
	}
	public void setActiveTime(Date activeTime) {
		this.activeTime = activeTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	private   Date createTime;   
      private   String isReport;
	public String getIsReport() {
		return isReport;
	}
	public void setIsReport(String isReport) {
		this.isReport = isReport;
	}   
    

}