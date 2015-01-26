package com.armysoft.hzkjy.service.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.armysoft.core.Pagination;
import org.armysoft.ibatis.dao.BaseDao;
import org.springframework.stereotype.Service;

import com.armysoft.hzkjy.model.SysUser;

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
		super.nativeDelete(nameSpace + ".delete", userNo);
	}

	/**
	 * 删除角色用户
	 * @param roleNo
	 */
	public void deleteByRoleNo(String roleNo){
		super.nativeDelete(nameSpace + ".deleteByRoleNo", roleNo);
	}
	
	/**
	 * �?��/冻结用户
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
	 * 根据用户状�?查询�?��用户
	 * @param status
	 * @return
	 */
	public List<SysUser> getByStatus(int status) {
		return super.nativeList(nameSpace + ".getByStatus", status);
	}

	/**
	 * 查询终端管理�?
	 * @param terminalNo
	 * @return
	 */
	public List<SysUser> getByTerminalNo(String terminalNo) {
		return super.nativeList(nameSpace + ".getByTerminalNo", terminalNo);
	}

	/**
	 * 批量添加终端用户
	 * @param terminalNo
	 * @param addUsers
	 */
	public void insertTerminalUser(String terminalNo,List<String> addUsers){
		//批量添加
		if(addUsers != null && !addUsers.isEmpty()){
			Map<String, Object> addParams = new HashMap<String, Object>();
			addParams.put("terminalNo", terminalNo);
			addParams.put("list", addUsers);
			super.nativeInsert(nameSpace + ".insertTerminalUser", addParams);
		}
	}
	
	/**
	 * 批量删除终端用户
	 * @param terminalNo
	 * @param delUsers
	 */
	public void deleteTerminalUser(String terminalNo,List<String> delUsers){
		//批量删除
		if(delUsers != null && !delUsers.isEmpty()){
			Map<String, Object> delParams = new HashMap<String, Object>();
			delParams.put("terminalNo", terminalNo);
			delParams.put("list", delUsers);
			super.nativeDelete(nameSpace + ".deleteTerminalUser", delParams);
		}
	}

	/**
	 * 修改密码
	 * @param user
	 */
	public void updatePwd(SysUser user) { 
		super.nativeUpdate(nameSpace + ".modifyPwd", user);
		
	}
	
	
////////////////////////短信发�?//////////////////
	
	/*public List<Map<String,Object>> getAllUser() {
		return super.getList(nameSpace + ".getAllUser");
	}*/
}
