package com.armysoft.hzkjy.service.member;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

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
