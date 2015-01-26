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
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.armysoft.hzkjy.annotation.PermissionsAnno;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.init.InitHandler;
import com.armysoft.hzkjy.model.SysRole;
import com.armysoft.hzkjy.model.SysUser;
import com.armysoft.hzkjy.service.sys.SysRoleService;
import com.armysoft.hzkjy.service.sys.SysUserService;

@Controller
@RequestMapping("sys/sysUser")
public class SysUserController extends BaseController {

	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysRoleService sysRoleService;

	@Resource
	private InitHandler initHandler;
	/**
	 * 条件分页查询用户
	 * 
	 * @param currentPage
	 * @param user
	 * @return
	 */
	@PermissionsAnno("us_list")
	@RequestMapping(value = PAGE_LIST)
	public ModelAndView getByPage(@PathVariable int currentPage, SysUser user) {
		ModelAndView mv = new ModelAndView("sys/SysUserQ");
		// 初始化分页实�?
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("phone", user.getPhone());
		params.put("userName", user.getUserName());
		mv.addObject("users", sysUserService.getByPage(params, pager));
		mv.addObject("page", pager);
		mv.addObject("tempUser", user);
		return mv;
	}

	/**
	 * 用户详情
	 * 
	 * @param userNo
	 * @return
	 */
	@RequestMapping(value = DETAIL)
	public ModelAndView detail(@PathVariable("id") String userNo) {
		ModelAndView mv = new ModelAndView();
		List<SysRole> allRoles = sysRoleService.getAll();
		List<SysRole> userRoles = null;
		userRoles = sysRoleService.getByUserNo(userNo);
		System.out.println(userRoles.size());
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		for (SysRole role : allRoles) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("roleNo", role.getRoleNo());
			map.put("roleName", role.getRoleName());
			map.put("checked", "");
				for (SysRole r : userRoles) {
					if(r != null)
					if (role.getRoleNo().equals(r.getRoleNo())) {
						map.put("checked", "checked");
						break;
					}
				}
			
			result.add(map);
		}
		mv.addObject("user", sysUserService.getByUserNo(userNo));
		mv.addObject("allRoles", result);
		mv.setViewName("sys/SysUserA_U_D");
		return mv;
	}

	/**
	 * 准备添加或修改用�?
	 * @param userNo
	 * @return
	 */
	@RequestMapping(value = ADD)
	public ModelAndView toAddOrUpdate(String userNo) {
		System.out.println("准备添加或修改用户");
		ModelAndView mv = new ModelAndView();
		List<SysRole> allRoles = sysRoleService.getAll();
		List<SysRole> userRoles = null;
		if (StringUtils.hasText(userNo)){// 修改
			userRoles = sysRoleService.getByUserNo(userNo);
			mv.addObject("update", "1");
		}
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		for (SysRole role : allRoles) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("roleNo", role.getRoleNo());
			map.put("roleName", role.getRoleName());
			map.put("checked", "");
			if (StringUtils.hasText(userNo)) {// 修改
				if(userRoles != null){
					for (SysRole r : userRoles) {
						if(r != null)
						if (role.getRoleNo().equals(r.getRoleNo())) {
							map.put("checked", "checked");
							break;
						}
					}
				}
			}
			result.add(map);
		}
		if (StringUtils.hasText(userNo))
			mv.addObject("user", sysUserService.getByUserNo(userNo));
		mv.addObject("allRoles", result);
		mv.setViewName("sys/SysUserA_U_D");
		return mv;
	}

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@PermissionsAnno("us_save")
	@RequestMapping(value = SAVE)
	public String save(SysUser user, HttpServletRequest request) {
		user.setCreateDate(new Date());
		user.setCreater(sysUserService.getByUserNo(super.getCookieValue(
				request, WebConstant.COOKIE_KEY)));
		user.setStatus(1);
		user.setPwd(DigestUtils.md5DigestAsHex(user.getPwd().getBytes()));
		String[] roleNos = request.getParameterValues("ck_roleNo");
		List<String> addRoles = new ArrayList<String>();
		if(roleNos != null)
			for (String role : roleNos) {
				addRoles.add(role);
			}
		sysUserService.insert(user, addRoles);
		//更新用户权限
		initHandler.updateResourcesMap(user.getUserNo(), null, addRoles);
		return "redirect:/sys/sysUser/list/1.html";
	}

	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	@PermissionsAnno("us_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") String userNo, SysUser user,
			HttpServletRequest request) {
		user.setUserNo(userNo);
		String[] roleNos = request.getParameterValues("ck_roleNo");
		List<SysRole> roles = sysRoleService.getByUserNo(userNo);

		List<String> delRoles = new ArrayList<String>();
		List<String> addRoles = new ArrayList<String>();
		if (roles != null && !roles.isEmpty()) {
			for (SysRole role : roles) {
				boolean flag = true;
				if(roleNos != null){
					for (String rn : roleNos) {
						if (role.getRoleNo().equals(rn)) {
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					delRoles.add(role.getRoleNo());
				}
			}
		}
		if(roleNos != null){
			for (String rn : roleNos) {
				boolean flag = true;
				if (roles != null){
					for (SysRole role : roles) {
						if (role.getRoleNo().equals(rn)) {
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					addRoles.add(rn);
				}
			}
		}
		sysUserService.update(user, delRoles, addRoles);
		//更新用户权限
		initHandler.updateResourcesMap(user.getUserNo(), delRoles, addRoles);
		return "redirect:/sys/sysUser/list/1.html";
	}

	/**
	 * 删除用户
	 * 
	 * @param userNo
	 * @return
	 */
	@PermissionsAnno("us_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") String userNo) {
		if(!"admin".equalsIgnoreCase(userNo)){
			sysUserService.delete(userNo);
			//删除用户权限
			initHandler.cleanResourcesMap(userNo);
		}
		return "redirect:/sys/sysUser/list/1.html";
	}

	/**
	 * �?��/冻结用户
	 * 
	 * @param userNo
	 * @param status
	 * @return
	 */
	@PermissionsAnno("us_chasta")
	@RequestMapping("changeStatus")
	public String changeStatus(String userNo, Integer status) {
		if(!"admin".equalsIgnoreCase(userNo)){
			sysUserService.updateStatus(userNo, status);
			if(status == WebConstant.USER_ACTIVE){
				List<SysRole> roles = sysRoleService.getByUserNo(userNo);
				List<String> addRoles = new ArrayList<String>();
				if (roles != null)
					for(SysRole role : roles){
						addRoles.add(role.getRoleNo());
					}
				initHandler.updateResourcesMap(userNo, null, addRoles);//更新用户权限
			}else{
				initHandler.cleanResourcesMap(userNo);//清除用户权限
			}
		}
		return "redirect:/sys/sysUser/list/1.html";
	}

	/**
	 * 异步验证用户编号是否已存�?
	 * 
	 * @param userNo
	 * @return
	 */
	@RequestMapping("validUserNo")
	@ResponseBody
	public String validUserNo(String userNo) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("isFlag", sysUserService.getByUserNo(userNo) == null);
		return jsonObject.toString();
	}

	/**
	 * 用户管理的终�?
	 * @param userNo
	 * @return
	 */

		
	

	/**
	 * 跳转到修改密码页�?
	 * @return
	 */
	@RequestMapping("toModifyPwd")
	public String toModifyPwd(){
		return "sys/ModifyPwd";
	}
	
	/**
	 * 修改密码
	 * @param oldPwd
	 * @param newPwd
	 * @param request
	 * @return
	 */
	@RequestMapping("modifyPwd")
	public String modifyPwd(String oldPwd,String newPwd,HttpServletRequest request){
		String userNo = super.getCookieValue(request, WebConstant.COOKIE_KEY);
		SysUser user = sysUserService.getByUserNo(userNo);
		if(user.getPwd().equals(DigestUtils.md5DigestAsHex(oldPwd.getBytes()))){
			user.setPwd(DigestUtils.md5DigestAsHex(newPwd.getBytes()));
			sysUserService.updatePwd(user);
			request.setAttribute("msg", "密码修改成功！");
		}else{
			request.setAttribute("msg", "修改失败，旧密码不正确！");
		}
		return "sys/ModifyPwd";
	}
}
