package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.IncubatedEnterprises;
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
public class IncubatedEnterprisesService extends BaseDao {

	private final String nameSpace = "IncubatedEnterprisesOpt";

	public Map<String, Object> getToLastYear(Map<String, Object> params) {
		return super.nativeSelectOne(nameSpace + ".getToLastYear", params);
	}
	
	/**
	 * 条件分页查询题库
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<IncubatedEnterprises> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public IncubatedEnterprises findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	

	
	public Integer getCount(Map<String, Object> params){
		return super.nativeSelectOne(nameSpace + ".sumCount", params);
	}
	
	
	public IncubatedEnterprises findIeHybh(String hybh,String ssn) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh", hybh);
		params.put("ssn", ssn);
		return super.nativeSelectOne(nameSpace + ".findIeHybh", params);
	}
	public IncubatedEnterprises findIeHybhS(String hybh,String ssn) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh", hybh);
		params.put("ssn", ssn);
		return super.nativeSelectOne(nameSpace + ".findIeHybhS", params);
	}
	
	public IncubatedEnterprises findIeHybhM(String hybh) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("hybh", hybh);
		return super.nativeSelectOne(nameSpace + ".findIeHybhM", params);
	}
	
	public List  getCyqy(Map<String, Object> params) {
	return super.nativeList(nameSpace + ".getCyqy", params);
	}

	/**
	 * 添加数据
	 * @param question
	 */
	public void insert(IncubatedEnterprises model) {
		super.defInsert(nameSpace, model);
	}
	

	/**
	 * 修改
	 * @param question
	 */
	public void update(IncubatedEnterprises model) {

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
