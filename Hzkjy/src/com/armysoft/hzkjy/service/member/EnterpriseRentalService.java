package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.EnterpriseRental;
import com.armysoft.hzkjy.model.MemberRental;
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
public class EnterpriseRentalService extends BaseDao {

	private final String nameSpace = "EnterpriseRentalOpt";

	/**
	 * 条件分页查询题库
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<EnterpriseRental> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public EnterpriseRental findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	
	public List  getPortalList(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getPortal", params);
		}
	
	public EnterpriseRental findByHybh(String hybh) {
		return super.nativeSelectOne(nameSpace + ".findByHybh", hybh);
	}
	public Integer getCount(Map<String, Object> params){
		return super.nativeSelectOne(nameSpace + ".sumCount", params);
	}
	
	
	public EnterpriseRental findByNewHybh(String hybh1,String hybh2) {
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
	/**
	 * 添加数据
	 * @param question
	 */
	public void insert(EnterpriseRental model) {
		super.defInsert(nameSpace, model);
	}
	
	/**
	 * 批量添加
	 * @param quests
	 */
	public void batchInsert(List<EnterpriseRental> lists) {
		super.nativeInsert(nameSpace + ".batchInsert", lists);
	}

	/**
	 * 修改
	 * @param question
	 */
	public void update(EnterpriseRental model) {

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
