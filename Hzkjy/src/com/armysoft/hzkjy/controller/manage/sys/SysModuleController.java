package com.armysoft.hzkjy.controller.manage.sys;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.model.SysModule;
import com.armysoft.hzkjy.service.sys.SysModuleService;

/**
 * 模块Controller
 * 
 * @author wei
 * 
 */
@Controller
@RequestMapping("sys/sysModule")
public class SysModuleController extends BaseController {

	@Resource
	private SysModuleService sysModuleService;
	
	/**
	 * 根据用户加载功能菜单树（左侧菜单�?
	 * @param request
	 * @return
	 */
	@RequestMapping("loadModuleTreeByUserNo")
	public ResponseEntity<String> loadModuleTreeByUserNo(
			HttpServletRequest request) {
		//�?���?��菜单
		List<SysModule> module_1 = sysModuleService.getByModuleLevel(1);
		//用户拥有的菜�?
		List<SysModule> lists = null;
		String userNo = super.getCookieValue(request, WebConstant.COOKIE_KEY);
		if("admin".equalsIgnoreCase(userNo)){
			lists = sysModuleService.getByModuleLevel(2);
		}else{
			lists = sysModuleService.getByUserNo(userNo);
		}
		JSONArray jsonRes = new JSONArray();
		for(SysModule m1 : module_1){
			boolean flag = false;
			for(SysModule m2 : lists){
				if(m2.getParentNo().getModuleNo().equals(m1.getModuleNo())){
					if(!flag) flag = true;
					JSONObject child = new JSONObject();
					child.put("id", m2.getModuleNo());
					child.put("pId", m2.getParentNo() == null ? "0" : m2.getParentNo().getModuleNo());
					child.put("name", m2.getModName());
					if(m2.getUrl() != null)
						child.put("file", m2.getUrl());
					if(m2.getParentNo() == null)
						child.put("open", true);
					jsonRes.add(child);
				}
			}
			if(flag){
				JSONObject parent = new JSONObject();
				parent.put("id", m1.getModuleNo());
				parent.put("pId", m1.getParentNo() == null ? "0" : m1.getParentNo().getModuleNo());
				parent.put("name", m1.getModName());
				if(m1.getUrl() != null)
					parent.put("file", m1.getUrl());
				if(m1.getParentNo() == null)
					parent.put("open", true);
				jsonRes.add(parent);
			}
		}
		
		HttpHeaders headers = new HttpHeaders();     
        MediaType mediaType=new MediaType("text","html",Charset.forName("GBK"));     
        headers.setContentType(mediaType);     
        ResponseEntity<String> responseEntity =new ResponseEntity<String>(jsonRes.toString(),headers,HttpStatus.OK);     
        return responseEntity; 
	}

	/**
	 * 加载�?��菜单模块和权限树（角色分配权限时�?
	 * @param roleNo
	 * @return
	 */
	@RequestMapping("loadModuleTree")
	@ResponseBody
	public List<Map<String, Object>> loadModuleTreeByRoleNo(String roleNo) {
		List<Map<String, Object>> lists = sysModuleService
				.getModuleAndPermission(roleNo);
		return lists;
	}

}
