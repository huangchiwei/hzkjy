package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.IncubatedEnterprises;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberIntellectualPro;
import com.armysoft.hzkjy.model.MemberPatent;

@Service
public class MemberPatentService extends BaseDao {

	private final String nameSpace = "MemberPatentOpt";


	public List<Map<String, Object>> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}
	public List<Map<String, Object>> findAll(Map<String, Object> params) {
		return super.nativeList(nameSpace+".findAll", params);
	}

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Map<String, Object> findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findByKey", id);
	}
	public Map<String, Object> getCurrentYear(Map<String, Object> params) {
		return super.nativeSelectOne(nameSpace + ".getCurrentYear", params);
	}
	public Map<String, Object> getToLastYear(Map<String, Object> params) {
		return super.nativeSelectOne(nameSpace + ".getToLastYear", params);
	}
	public Map<String, Object> getAllYear(Map<String, Object> params) {
		return super.nativeSelectOne(nameSpace + ".getAllYear", params);
	}
	
	

	
	public void updateType(String fmzl,String wgsj,String syxx,String rjzzq,String hybh,String ssn) {
		Map<String,Object> params = new HashMap<String, Object>();
		
		params.put("hybh", hybh);
		params.put("ssn", ssn);
		params.put("fmzl", fmzl);
		params.put("wgsj", wgsj);
		params.put("syxx", syxx);
		params.put("rjzzq", rjzzq);
		super.nativeUpdate(nameSpace+".updateType", params);
	}
	
	/**
	 * 添加数据
	 * @param question
	 */
	public void insert(MemberPatent model) {
		super.defInsert(nameSpace, model);
	}

	public void updateStatus(Map<String, Object> params) {

		super.nativeUpdate(nameSpace+".updateStatus", params);
	}
	/**
	 * 修改
	 * @param question
	 */
	public void update(MemberPatent model) {

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
