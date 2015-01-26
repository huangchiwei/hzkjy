package com.armysoft.hzkjy.init;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;

import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.model.SysPermission;
import com.armysoft.hzkjy.model.SysUser;
import com.armysoft.hzkjy.service.sys.SysPermissionService;
import com.armysoft.hzkjy.service.sys.SysUserService;

public class InitHandler {

	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysPermissionService sysPermissionService;
	
	/**
	 * 初始化所有用户权�?
	 */
	@PostConstruct
	public void init(){
		Set<String> resourcesMap = new HashSet<String>();
		List<SysUser> users = sysUserService.getByStatus(WebConstant.USER_ACTIVE);
		if(users != null)
			for(SysUser user : users){
				List<String> perms = sysPermissionService.getByUserNo(user.getUserNo());
				for(String perm : perms){
					resourcesMap.add(user.getUserNo() + WebConstant.SEPARATOR + perm);
				}
			}
		WebConstant.setResourcesMap(resourcesMap);
	}
	/**
	 * 更新用户权限
	 * @param userNo
	 * @param delRoles
	 * @param addRoles
	 */
	public void updateResourcesMap(String userNo,List<String> delRoles,List<String> addRoles){
		Set<String> resourcesMap = WebConstant.getResourcesMap();
		if(delRoles != null)
			for(String roleNo : delRoles){
				List<SysPermission>  perms = sysPermissionService.getByRoleNo(roleNo);
				for(SysPermission perm : perms){
					if(resourcesMap.contains(userNo + WebConstant.SEPARATOR + perm.getPermValue())){
						resourcesMap.remove(userNo + WebConstant.SEPARATOR + perm.getPermValue());
					}
				}
			}
		if(addRoles != null)
			for(String roleNo : addRoles){
				List<SysPermission>  perms = sysPermissionService.getByRoleNo(roleNo);
				for(SysPermission perm : perms){
					if(!resourcesMap.contains(userNo + WebConstant.SEPARATOR + perm.getPermValue())){
						resourcesMap.add(userNo + WebConstant.SEPARATOR + perm.getPermValue());
					}
				}
			}
		WebConstant.setResourcesMap(resourcesMap);
	}
	
	/**
	 * 清理用户权限
	 * @param userNo
	 */
	public void cleanResourcesMap(String userNo){
		Set<String> resourcesMap = WebConstant.getResourcesMap();
		List<String> perms = sysPermissionService.getByUserNo(userNo);
		for(String perm : perms){
			if(resourcesMap.contains(userNo + WebConstant.SEPARATOR + perm)){
				resourcesMap.remove(userNo + WebConstant.SEPARATOR + perm);
			}
		}
		WebConstant.setResourcesMap(resourcesMap);
	}
}
