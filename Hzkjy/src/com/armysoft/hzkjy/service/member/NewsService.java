package com.armysoft.hzkjy.service.member;
import java.util.List;
import java.util.Map;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.MemberFasic;
import com.armysoft.hzkjy.model.News;
/**
 * 资讯
 * @author Administrator
 *
 */
@Service
public class NewsService extends BaseDao {

	private final String nameSpace = "NewsOpt";

	/**
	 * ������ҳ��ѯ���
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<Map<String, Object>> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}
	public Map<String, Object> getCategory(String cateCode) {
		return super.nativeSelectOne(nameSpace + ".getCategory", cateCode);
	}

	/**
	 * ���id��ѯ
	 * @param id
	 * @return
	 */
	public Map<String, Object> findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findByKey", id);
	}

	
	
	/**
	 * ������
	 * @param question
	 */
	public void insert(News model) {
		super.defInsert(nameSpace, model);
	}
	
	
	/**
	 * �޸�
	 * @param question
	 */
	public void update(News model) {

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
