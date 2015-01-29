package com.armysoft.hzkjy.service.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberFasic;
/***
 * 
 * 
 * ��Ŀ��ƣ�Jpzx
 * ����ƣ�MemberBasic
 * ��������
 * �����ˣ�Java autoCoder 
 * ����ʱ�䣺
 * �޸��ˣ�
 * �޸�ʱ�䣺
 * �޸ı�ע��
 * @version 
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
	public List<MemberFasic> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * ���id��ѯ
	 * @param id
	 * @return
	 */
	public MemberFasic findByKey(Long id) {
		return super.nativeSelectOne(nameSpace + ".findById", id);
	}
	
	public List  getPortalList(Map<String, Object> params) {
		return super.nativeList(nameSpace + ".getPortal", params);
		}
	
	public MemberFasic findByHybh(String hybh) {
		return super.nativeSelectOne(nameSpace + ".findByHybh", hybh);
	}
	public Integer getCount(Map<String, Object> params){
		return super.nativeSelectOne(nameSpace + ".sumCount", params);
	}
	
	
	public MemberFasic findByNewHybh(String hybh1,String hybh2) {
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
	/**
	 * ������
	 * @param question
	 */
	public void insert(MemberFasic model) {
		super.defInsert(nameSpace, model);
	}
	
	/**
	 * �������
	 * @param quests
	 */
	public void batchInsert(List<MemberFasic> lists) {
		super.nativeInsert(nameSpace + ".batchInsert", lists);
	}

	/**
	 * �޸�
	 * @param question
	 */
	public void update(MemberFasic model) {

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
