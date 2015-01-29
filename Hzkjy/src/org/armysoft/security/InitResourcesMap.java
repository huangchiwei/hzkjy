package org.armysoft.security;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.armysoft.security.model.sys.SysPermission;
import org.armysoft.security.model.sys.SysUser;
import org.armysoft.security.service.sys.SysPermissionService;
import org.armysoft.security.service.sys.SysUserService;

import com.armysoft.hzkjy.base.common.Constants;

public class InitResourcesMap {

	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysPermissionService sysPermissionService;
	
	/**
	 * 初始化所有用户权限
	 */
	@PostConstruct
	public void init(){
		Set<String> resourcesMap = new HashSet<String>();
		List<SysUser> users = sysUserService.getByStatus(Constants.USER_ACTIVE);
		if(users != null)
			for(SysUser user : users){
				List<String> perms = sysPermissionService.getByUserNo(user.getUserNo());
				for(String perm : perms){
					resourcesMap.add(user.getUserNo() + Constants.SEPARATOR + perm);
				}
			}
		Constants.setResourcesMap(resourcesMap);
	}
	
	/**
	 * 更新用户权限
	 * @param userNo
	 * @param delRoles
	 * @param addRoles
	 */
	public void updateResourcesMap(String userNo,List<String> delRoles,List<String> addRoles){
		Set<String> resourcesMap = Constants.getResourcesMap();
		if(delRoles != null)
			for(String roleNo : delRoles){
				List<SysPermission>  perms = sysPermissionService.getByRoleNo(roleNo);
				for(SysPermission perm : perms){
					if(resourcesMap.contains(userNo + Constants.SEPARATOR + perm.getPermValue())){
						resourcesMap.remove(userNo + Constants.SEPARATOR + perm.getPermValue());
					}
				}
			}
		if(addRoles != null)
			for(String roleNo : addRoles){
				List<SysPermission>  perms = sysPermissionService.getByRoleNo(roleNo);
				for(SysPermission perm : perms){
					if(!resourcesMap.contains(userNo + Constants.SEPARATOR + perm.getPermValue())){
						resourcesMap.add(userNo + Constants.SEPARATOR + perm.getPermValue());
					}
				}
			}
		Constants.setResourcesMap(resourcesMap);
	}
	
	/**
	 * 清理用户权限
	 * @param userNo
	 */
	public void cleanResourcesMap(String userNo){
		Set<String> resourcesMap = Constants.getResourcesMap();
		List<String> perms = sysPermissionService.getByUserNo(userNo);
		for(String perm : perms){
			if(resourcesMap.contains(userNo + Constants.SEPARATOR + perm)){
				resourcesMap.remove(userNo + Constants.SEPARATOR + perm);
			}
		}
		Constants.setResourcesMap(resourcesMap);
	}
}
