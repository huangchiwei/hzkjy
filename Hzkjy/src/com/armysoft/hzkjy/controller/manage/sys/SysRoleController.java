package com.armysoft.hzkjy.controller.manage.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.armysoft.hzkjy.annotation.PermissionsAnno;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.init.InitHandler;
import com.armysoft.hzkjy.model.SysPermission;
import com.armysoft.hzkjy.model.SysRole;
import com.armysoft.hzkjy.service.sys.SysPermissionService;
import com.armysoft.hzkjy.service.sys.SysRoleService;
import com.armysoft.hzkjy.service.sys.SysUserService;

@Controller
@RequestMapping("sys/sysRole")
public class SysRoleController extends BaseController {

	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysRoleService sysRoleService;
	@Resource
	private SysPermissionService sysPermissionService;
	@Resource
	private InitHandler initHandler;
	
	/**
	 * 条件分页查询角色
	 */
	@PermissionsAnno("ro_list")
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage,SysRole role){
		ModelAndView mv = new ModelAndView("sys/SysRoleQ");
		//初始化分页实�?
		Pagination pager =  initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleName", role.getRoleName());
		mv.addObject("roles", sysRoleService.getByPage(params,pager));
		mv.addObject("page", pager);
		mv.addObject("tempRole", role);
		return mv;
	}
	
	/**
	 * 准备添加或修改角�?
	 * @param roleNo
	 * @return
	 */
	@RequestMapping(value = ADD)
	public ModelAndView toAddOrUpdate(String roleNo){
		ModelAndView mv = new ModelAndView();
		if(StringUtils.hasText(roleNo)){//修改
			mv.addObject("role", sysRoleService.getByRoleNo(roleNo));
		}
		mv.setViewName("sys/SysRoleA_U");
		
		return mv;
	}
	
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	@PermissionsAnno("ro_save")
	@RequestMapping(value = SAVE)
	public String add(SysRole role,HttpServletRequest request){
		role.setModifier(sysUserService.getByUserNo(super.getCookieValue(request, WebConstant.COOKIE_KEY)));
		role.setModifyDate(new Date());
		role.setCreateDate(new Date());
		role.setCreater(sysUserService.getByUserNo(super.getCookieValue(request, WebConstant.COOKIE_KEY)));
		sysRoleService.insert(role);
		return "redirect:/sys/sysRole/list/1.html";
	}
	
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	@PermissionsAnno("ro_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id")String roleNo,SysRole role,HttpServletRequest request){
		role.setRoleNo(roleNo);
		role.setModifier(sysUserService.getByUserNo(super.getCookieValue(request, WebConstant.COOKIE_KEY)));
		role.setModifyDate(new Date());
		sysRoleService.update(role);
		return "redirect:/sys/sysRole/list/1.html";
	}
	
	/**
	 * 删除角色
	 * @param roleNo
	 * @return
	 */
	@PermissionsAnno("ro_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id")String roleNo){
		sysRoleService.delete(roleNo);
		initHandler.init();//重新加载�?��用户权限
		return "redirect:/sys/sysRole/list/1.html";
	}
	
	/**
	 * 异步验证角色编号是否已存�?
	 * @param roleNo
	 * @return
	 */
	@RequestMapping("validRoleNo")
	@ResponseBody
	public String validRoleNo(String roleNo){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("isFlag", sysRoleService.getByRoleNo(roleNo) == null);
		return jsonObject.toString();
	}
	
	/** 
	 * 角色的权�?
	 * @param roleNo
	 * @return
	 */
	@RequestMapping("toRoleToPerm")
	public ModelAndView toSysPermissionLeft(String roleNo) {
		ModelAndView mv = new ModelAndView("sys/SysRoleToPerm");
		mv.addObject("role", sysRoleService.getByRoleNo(roleNo));
		return mv;
	}
	
	/**
	 * 角色分配权限
	 * @param roleNo
	 * @param permIds
	 * @return
	 */
	@PermissionsAnno("ro_saveperm")
	@RequestMapping("saveRolePerm")
	public String updateRolePermission(String roleNo,String permIds) {
		String[] perms = null;
		if(StringUtils.hasText(permIds))
			perms = permIds.split(",");
		List<SysPermission> permissions = sysPermissionService.getByRoleNo(roleNo);

		List<Integer> delPermIds = new ArrayList<Integer>();
		List<Integer> addPermIds = new ArrayList<Integer>();
		if (permissions != null && !permissions.isEmpty()) {
			for (SysPermission permission : permissions) {
				boolean flag = true;
				if(perms != null){
					for (String pm : perms) {
						if(permission != null)
						if (permission.getId().equals(pm)) {
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					if(permission != null)
						delPermIds.add(permission.getId());
				}
			}
		}
		if(perms != null){
			for (String pm : perms) {
				boolean flag = true;
				if (permissions != null && !permissions.isEmpty()) {
					for(SysPermission permission : permissions) {
						if(permission != null)
						if (permission.getId().equals(pm)) {
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					addPermIds.add(Integer.valueOf(pm));
				}
			}
		}
		sysPermissionService.updateRolePermission(roleNo, delPermIds, addPermIds);
		initHandler.init();//重新加载�?��用户权限
		return "redirect:/sys/sysRole/list/1.html";
	}
}
