package com.armysoft.hzkjy.service.member;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.armysoft.security.model.sys.SysUser;
import org.armysoft.security.service.sys.SysUserService;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.model.MemberBasic;
import com.gzjr.hzkjy.util.mail.MailSenderInfo;
import com.gzjr.hzkjy.util.mail.SimpleMailSender;
/***
 * 
 * 
 * 项目名称：Jpzx
 * 类名称：MemberBasic
 * 类描述：
 * 创建人：Java autoCoder 
 * 创建时间：
 * 修改人：
 * 修改时间：
 * 修改备注：
 * @version 
 *
 */
@Service
public class MemberBasicService extends BaseDao {

	private final String nameSpace = "MemberBasicOpt";
	@Resource
	private SysUserService sysUserService;
	
	public Map<String, Object> getToLastYear(Map<String, Object> params) {
		return super.nativeSelectOne(nameSpace + ".getToLastYear", params);
	}
	/**
	 * 条件分页查询题库
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<MemberBasic> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}
	public List<Map<String,Object>> getAllMember() {
		return super.nativeList(nameSpace+".getAllMember", null);
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public MemberBasic findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	
	public List  getPortalList(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getPortal", params);
		}
	
	public MemberBasic findByHybh(String hybh) {
		return super.nativeSelectOne(nameSpace + ".findByHybh", hybh);
	}
	public Integer getCount(Map<String, Object> params){
		return super.nativeSelectOne(nameSpace + ".sumCount", params);
	}
	
	
	public MemberBasic findByNewHybh(String hybh1,String hybh2) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh1", hybh1);
		params.put("hybh2", hybh2);
		return super.nativeSelectOne(nameSpace + ".findByNewHybh", params);
	}
	public MemberBasic findMbHybh(String hybh) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh", hybh);
		return super.nativeSelectOne(nameSpace + ".findMbHybh", params);
	}
	
	public List  getCyqy(Map<String, Object> params) {
	return super.nativeList(nameSpace + ".getCyqy", params);
	}
	public List  getJjybsz(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getJjybsz", params);
		}
	
	public List  getMessage(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getMessage", params);
		}
	
	
	public Integer CountHybh(String hybh1,String hybh2) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh1", hybh1);
		params.put("hybh2", hybh2);
		return super.nativeSelectOne(nameSpace + ".HybhCount", params);
	}
	public List<Map<String,Object>>  getSelectedCorpNameList(String value){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("value", value);
		return super.nativeList(nameSpace+".getSelectedCorpNameList",params);
	}
	
	public List<Map<String,Object>>  getQyxx(String value){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("value", value);
		return super.nativeList(nameSpace+".getQyxx",params);
	}
	/**
	 * 添加数据
	 * @param question
	 */
	public void insert(MemberBasic model) {
		super.defInsert(nameSpace, model);
	}
	
	public void updatekjid(Map<String, Object> params) {

		super.nativeUpdate(nameSpace+".updatekjid", params);
	}
	public void updatezlid(Map<String, Object> params) {

		super.nativeUpdate(nameSpace+".updatezlid", params);
	}
	
	/**
	 * 添加数据
	 * @param question
	 */
	public void insertMemberAndUser(MemberBasic model,SysUser user) {
		super.defInsert(nameSpace, model);
        sysUserService.insert(user, null);
		sysUserService.insertRole(model.getHybh());
	}
	

	/**
	 * 批量添加
	 * @param quests
	 */
	public void batchInsert(List<MemberBasic> lists) {
		super.nativeInsert(nameSpace + ".batchInsert", lists);
	}

	/**
	 * 修改
	 * @param question
	 */
	public void update(MemberBasic model) {

		super.defUpdate(nameSpace, model);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void delete(Long id) {
		super.defDelete(nameSpace, id);
	}
	

	public void sendMail(Map<String, Object> sysUser,String type) {
		  MailSenderInfo mailInfo = new MailSenderInfo();  
		   mailInfo.setMailServerHost(Constants.mailPros.getProperty("mail.serverHost"));    
		     mailInfo.setMailServerPort(Constants.mailPros.getProperty("mail.serverPort"));    
		     mailInfo.setValidate(true);    
		     mailInfo.setUserName(Constants.mailPros.getProperty("mail.userName"));    
		     mailInfo.setPassword(Constants.mailPros.getProperty("mail.password"));//您的邮箱密码    
		    mailInfo.setFromAddress(Constants.mailPros.getProperty("mail.fromAddress"));  
		    mailInfo.setToAddress(sysUser.get("Email").toString());  
		    if(type.equals("reset")){
		    	 mailInfo.setSubject("重置密码"); 
		    	 String resetUrl=Constants.mailPros.getProperty("mail.resetUrl")+"userNo="+sysUser.get("UserNo").toString()+"&mailSeq="+sysUser.get("MailSeq").toString();
		    	 mailInfo.setContent("亲爱的科技园会员["+sysUser.get("UserNo").toString()+"]:重置密码请点击以下地址,"+resetUrl);   
		    }
		    
		        //这个类主要来发送邮件   
		     SimpleMailSender sms = new SimpleMailSender();   
		         sms.sendTextMail(mailInfo);//发送文体格式    
		         //sms.sendHtmlMail(mailInfo);//发送html格式   
		
	}
	

	

}
