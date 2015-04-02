package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.EccIndicator;
import com.armysoft.hzkjy.model.MemberBasic;
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
public class RentStatisticsService extends BaseDao {

	private final String nameSpace = "RentStatisticsOpt";

	/**
	 * 条件分页查询题库
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<EccIndicator> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public EccIndicator findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	
	public List<EccIndicator> findByIds(String[] idArr) {
		return super.nativeList(nameSpace + ".findByIds", idArr);
	}
	
	public EccIndicator findByHybh(String hybh) {
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
	public void insert(EccIndicator model) {
		super.defInsert(nameSpace, model);
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
	public void update(EccIndicator model) {

		super.defUpdate(nameSpace, model);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void delete(Long id) {
		super.defDelete(nameSpace, id);
	}

	
	public String countSslq(String jjzbNy,String type) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("jjzbNy", jjzbNy);
		params.put("type", type);
		List<Map<String,Object>> list=null;
		
	   return super.nativeSelectOne(nameSpace + ".countSslq", params);
		
		
	}
	public  List countSslqList(String jjzbNy,String type) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("jjzbNy", jjzbNy);
		params.put("type", type);
	   return super.nativeList(nameSpace + ".countSslqList", params);
		
		
	}
	
	public List  getSslqList(String jjzbNy,String type) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("jjzbNy", jjzbNy);
		params.put("type", type);
		return super.nativeList(nameSpace + ".getSslqList", params);
		}
}
