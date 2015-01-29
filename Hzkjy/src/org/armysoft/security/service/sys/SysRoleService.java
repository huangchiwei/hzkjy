package org.armysoft.security.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.armysoft.security.model.sys.SysRole;
import org.springframework.stereotype.Service;

/**
 * 角色Service
 * @author wei
 */
@Service
public class SysRoleService extends BaseDao {

	private final String nameSpace = "SysRoleOpt";

	@Resource
	private SysPermissionService sysPermissionService;
	@Resource
	private SysUserService sysUserService;
	/**
	 * 条件分页查询角色
	 * @param role
	 * @param page
	 * @return
	 */
	public List<SysRole> getByPage(Map<String, Object> params,Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}


	/**
	 * 根据角色编号查找角色
	 * @param roleNo
	 * @return
	 */
	public SysRole getByRoleNo(String roleNo) {
		return super.nativeSelectOne(nameSpace
				+ ".getByRoleNo", roleNo);
	}
	
	/**
	 * 查询所有角色
	 * @return
	 */
	public List<SysRole> getAll() {
		return super.getList(nameSpace + ".getAll");
	}

	/**
	 * 添加角色
	 * @param role
	 */
	public boolean insert(SysRole role) {
		super.nativeInsert(nameSpace + ".insert", role);
		//int a = 10 / 0;
		return true;
		
	}

	/**
	 * 修改角色
	 * @param role
	 */
	public boolean update(SysRole role) {
		return super.nativeUpdate(nameSpace + ".update", role);
	}

	/**
	 * 删除角色
	 * @param roleNo
	 */
	public void delete(String roleNo) {
		sysPermissionService.deletePermByRoleNo(roleNo);
		sysUserService.deleteByRoleNo(roleNo);
		super.nativeDelete(nameSpace + ".delete", roleNo);
	}
	
	/**
	 * 查找用户拥有的角色
	 * @param userNo
	 */
	public List<SysRole> getByUserNo(String userNo) {
		return super.nativeList(nameSpace + ".getByUserNo", userNo);
	}
	
	/**
	 * 批量添加用户角色
	 * @param userNo
	 * @param addRoles
	 */
	public void insertUserRole(String userNo,List<String> addRoles){
		//批量添加
		if(addRoles != null && !addRoles.isEmpty()){
			Map<String, Object> addParams = new HashMap<String, Object>();
			addParams.put("userNo", userNo);
			addParams.put("list", addRoles);
			super.nativeInsert(nameSpace + ".insertUserRole", addParams);
		}
	}
	
	/**
	 * 批量删除用户角色
	 * @param userNo
	 * @param delRoles
	 */
	public void deleteUserRole(String userNo,List<String> delRoles){
		//批量删除
		if(delRoles != null && !delRoles.isEmpty()){
			Map<String, Object> delParams = new HashMap<String, Object>();
			delParams.put("userNo", userNo);
			delParams.put("list", delRoles);
			super.nativeDelete(nameSpace + ".deleteUserRole", delParams);
		}
	}
	
	/**
	 * 根据用户删除角色
	 * @param userNo
	 * @param delRoles
	 */
	public void deleteRoleByUser(String userNo){
		this.nativeDelete(nameSpace + ".deleteRoleByUser",  userNo);
	}
}
