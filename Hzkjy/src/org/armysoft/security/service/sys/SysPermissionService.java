package org.armysoft.security.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.armysoft.ibatis.dao.BaseDao;
import org.armysoft.security.model.sys.SysPermission;
import org.springframework.stereotype.Service;

/**
 * 权限Service
 * @author wei
 */
@Service
public class SysPermissionService extends BaseDao {

	private final String nameSpace = "SysPermissionOpt";

	/**
	 * 根据用户查询权限
	 * @param userNo
	 * @return
	 */
	public List<String> getByUserNo(String userNo){
		return super.nativeList(nameSpace + ".getByUserNo", userNo);
	}
	
	/**
	 * 根据角色查询权限
	 * @param roleNo
	 * @return
	 */
	public List<SysPermission> getByRoleNo(String roleNo){
		return super.nativeList(nameSpace + ".getByRoleNo", roleNo);
	}
	
	
	
	/**
	 * 批量添加角色权限
	 * @param roleNo
	 * @param addPermIds
	 */
	public void insertRolePerm(String roleNo,List<Integer> addPermIds){
		//批量添加
		if(addPermIds != null && !addPermIds.isEmpty()){
			Map<String, Object> addParams = new HashMap<String, Object>();
			addParams.put("roleNo", roleNo);
			addParams.put("list", addPermIds);
			super.nativeInsert(nameSpace + ".insertRolePerm", addParams);
		}
	}
	
	/**
	 * 批量删除角色权限
	 * @param roleNo
	 * @param delPermIds
	 */
	public void deleteRolePerm(String roleNo,List<Integer> delPermIds){
		//批量删除
		if(delPermIds != null && !delPermIds.isEmpty()){
			Map<String, Object> delParams = new HashMap<String, Object>();
			delParams.put("roleNo", roleNo);
			delParams.put("list", delPermIds);
			super.nativeDelete(nameSpace + ".deleteRolePerm", delParams);
		}
	}
	
	/**
	 * 删除角色的所有权限
	 * @param roleNo
	 */
	public void deletePermByRoleNo(String roleNo){
		this.nativeDelete(nameSpace + ".deletePermByRoleNo",  roleNo);
	}

	/**
	 * 更新角色权限
	 * @param roleNo
	 * @param delPerIds
	 * @param addPermIds
	 */
	public void updateRolePermission(String roleNo, List<Integer> delPermIds,
			List<Integer> addPermIds) {
		this.deleteRolePerm(roleNo, delPermIds);
		this.insertRolePerm(roleNo, addPermIds);
	}	
}
