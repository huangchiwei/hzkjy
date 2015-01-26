package com.armysoft.hzkjy.service.sys;

import java.util.List;
import java.util.Map;

import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.SysModule;


@Service
public class SysModuleService extends BaseDao {

	private final String nameSpace = "SysModuleOpt";

	/**
	 * 根据用户查询模块
	 * @param UserNo
	 * @return
	 */
	public List<SysModule> getByUserNo(String userNo) {
		return super.nativeList(nameSpace + ".getByUserNo", userNo);
	}
	
	/**
	 * 加载�?��菜单和权限（角色分配权限�?
	 * @param roleNo
	 * @return
	 */
	public List<Map<String,Object>> getModuleAndPermission(String roleNo){
		return super.nativeList(nameSpace + ".getModuleAndPermission", roleNo);
	}
	
	/**
	 * 根据菜单级别查询菜单
	 * @param level
	 * @return
	 */
	public List<SysModule> getByModuleLevel(Integer level){
		return super.nativeList(nameSpace + ".getByModuleLevel", level);
	}
}
