package com.armysoft.hzkjy.model;
public class  MemberBasic implements java.io.Serializable {
      private   Integer id;   
	  public Integer getId() {
		return id;
	  }
	  public void setId(Integer id) {
		this.id = id;
	  }
	  public String getHybh() {
		return hybh;
	  }
	public void setHybh(String hybh) {
		this.hybh = hybh;
	}
	public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZydy() {
		return zydy;
	}
	public void setZydy(String zydy) {
		this.zydy = zydy;
	}
	public String getMj() {
		return mj;
	}
	public void setMj(String mj) {
		this.mj = mj;
	}
	public String getFzr() {
		return fzr;
	}
	public void setFzr(String fzr) {
		this.fzr = fzr;
	}
	public String getZczj() {
		return zczj;
	}
	public void setZczj(String zczj) {
		this.zczj = zczj;
	}
	public String getLxr() {
		return lxr;
	}
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	private String hybh;
	  private String qymc;
	  private String address;
	  private String zydy;
	  private String mj;
	  private String fzr;
	  private String zczj;
	  private String lxr;
	  private String zt;
	  private String qymcpy;
	  private String ztName;
	public String getZtName() {
		return ztName;
	}
	public void setZtName(String ztName) {
		this.ztName = ztName;
	}
	public String getQymcpy() {
		return qymcpy;
	}
	public void setQymcpy(String qymcpy) {
		this.qymcpy = qymcpy;
	}
}