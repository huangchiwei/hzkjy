package com.armysoft.hzkjy.service.member;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.NewsAdvert;
/**
 * 广告
 * @author Administrator
 *
 */
@Service
public class NewsAdvertService extends BaseDao {

	private final String nameSpace = "NewsAdvertOpt";

	/**
	 * ������ҳ��ѯ���
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}
	public List<Map<String, Object>> getAll() {
		return super.nativeList(nameSpace+".getAll", null);
	}
	/**
	 * ���id��ѯ
	 * @param id
	 * @return
	 */
	public Map<String, Object> findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findByKey", id);
	}

	public List<Map<String, Object>> getByAdType(Map<String, Object> params) {
		return super.nativeList(nameSpace+".getByAdType", params);
	}
	
	
	/**
	 * ������
	 * @param question
	 */
	public void insert(NewsAdvert model) {
		super.defInsert(nameSpace, model);
	}
	
	
	/**
	 * �޸�
	 * @param question
	 */
	public void update(NewsAdvert model) {

		super.defUpdate(nameSpace, model);
	}
	
	/**
	 * ɾ��
	 * @param id
	 */
	public void delete(Long id) {
		super.defDelete(nameSpace, id);
	}

}
