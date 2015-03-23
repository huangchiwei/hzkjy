﻿package com.armysoft.hzkjy.service.member;
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
	
	
	public List  getCyqy(Map<String, Object> params) {
	return super.nativeList(nameSpace + ".getCyqy", params);
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
	
	/**
	 * 添加数据
	 * @param question
	 */
	public void insertMemberAndUser(MemberBasic model) {
		super.defInsert(nameSpace, model);
		SysUser user = new SysUser();
		user.setUserNo(model.getHybh());
		user.setPwd(DigestUtils.md5DigestAsHex(Constants.DEFAULT_PASSWORD.getBytes()));
		user.setStatus(1);
		user.setCreateDate(new Date());
		sysUserService.insert(user, null);
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

}
