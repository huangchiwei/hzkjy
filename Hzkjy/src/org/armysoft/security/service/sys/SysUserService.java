package org.armysoft.security.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.armysoft.security.model.sys.SysUser;
import org.springframework.stereotype.Service;

/**
 * 用户Service
 * 
 * @author wei
 */
@Service
public class SysUserService extends BaseDao {

	private final String nameSpace = "SysUserOpt";
	@Resource
	private SysRoleService sysRoleService;

	/**
	 * 条件分页查询用户
	 * @param params
	 * @param pager
	 * @return
	 */
	public List<SysUser> getByPage(Map<String, Object> params, Pagination pager) {
		return super.getPageList(nameSpace, params, pager);
	}

	/**
	 * 根据用户编号查找用户
	 * 
	 * @param userNo
	 * @return
	 */
	public SysUser getByUserNo(String userNo) {
		return super.nativeSelectOne(nameSpace + ".getByUserNo", userNo);
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void insert(SysUser user, List<String> addRoles) {
		sysRoleService.insertUserRole(user.getUserNo(), addRoles);
		super.nativeInsert(nameSpace + ".insert", user);
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	public void update(SysUser user, List<String> delRoles,
			List<String> addRoles) {
		sysRoleService.insertUserRole(user.getUserNo(), addRoles);
		sysRoleService.deleteUserRole(user.getUserNo(), delRoles);
		super.nativeUpdate(nameSpace + ".update", user);
	}

	/**
	 * 删除用户
	 * 
	 * @param userNo
	 */
	public void delete(String userNo) {
		sysRoleService.deleteRoleByUser(userNo);
		super.nativeDelete(nameSpace + ".delete", userNo);
	}

	
	/**
	 * 激活/冻结用户
	 * 
	 * @param userNo
	 * @param status
	 */
	public boolean updateStatus(String userNo, Integer status) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userNo", userNo);
		params.put("status", status);
		return super.nativeUpdate(nameSpace + ".changeStatus", params);
	}
	
	/**
	 * 根据用户状态查询所有用户
	 * @param status
	 * @return
	 */
	public List<SysUser> getByStatus(int status) {
		return super.nativeList(nameSpace + ".getByStatus", status);
	}

	
	/**
	 * 修改密码
	 * @param user
	 */
	public void updatePwd(SysUser user) { 
		super.nativeUpdate(nameSpace + ".modifyPwd", user);
		
	}
	
	/**
	 * 删除角色用户
	 * @param roleNo
	 */
	public void deleteByRoleNo(String roleNo){
		super.nativeDelete(nameSpace + ".deleteByRoleNo", roleNo);
	}
}
