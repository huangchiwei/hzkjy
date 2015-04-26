package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.armysoft.security.service.sys.SysUserService;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.BsNews;
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
public class BsNewsService extends BaseDao {

	private final String nameSpace = "BsNewsOpt";
	@Resource
	private MemberBasicService mbService;
	/**
	 * 条件分页查询题库
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<BsNews> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public BsNews findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	public List<Map<String,Object>> findByUser(String User) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("User", User);
		return  super.nativeList(nameSpace + ".findByUser", params);
	}
	
	public List  getPortalList(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getPortal", params);
		}
	
	public BsNews findByHybh(String hybh) {
		return super.nativeSelectOne(nameSpace + ".findByHybh", hybh);
	}
	public Integer getCount(Map<String, Object> params){
		return super.nativeSelectOne(nameSpace + ".sumCount", params);
	}
	
	
	public BsNews findByNewHybh(String hybh1,String hybh2) {
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
	public void insert(BsNews model) {
		super.defInsert(nameSpace, model);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("hybh", model.getReceiverBh());
    	
		if(model.getTitle().equals("科技项目通知")){
			params.put("kjid", model.getId());
			mbService.updatekjid(params);
		}
        if(model.getTitle().equals("专利通知")){
        	params.put("zlid", model.getId());
        	mbService.updatekjid(params);
		}
	}
	
	/**
	 * 批量添加
	 * @param quests
	 */
	public void batchInsert(List<BsNews> lists) {
		super.nativeInsert(nameSpace + ".batchInsert", lists);
	}

	/**
	 * 修改
	 * @param question
	 */
	public void update(BsNews model) {

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
