package org.armysoft.security.model.sys;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
 * @author wei
 * @date 2014-04-28
 */
public class SysUser implements Serializable {

	/** 主键id */
	private Integer id;
	/** 登录账号 */
	private String userNo;
	/** 密码 */
	private String pwd;
	/** 真实姓名 */
	private String userName;
	/** 性别: 1 男 0 女 */
	private Integer sex;
	/** 邮箱 */
	private String email;
	/** 电话号码 */
	private String tel;
	/** 手机号码 */
	private String phone;
	/** QQ号码 */
	private String QQNum;
	/** 状态： 1 激活 2 冻结 3 删除*/
	private Integer status;
	/** 创建时间 */
	private Date createDate;
	/** 创建人 */
	private SysUser creater;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQQNum() {
		return QQNum;
	}
	public void setQQNum(String qQNum) {
		QQNum = qQNum;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public SysUser getCreater() {
		return creater;
	}
	public void setCreater(SysUser creater) {
		this.creater = creater;
	}

}
