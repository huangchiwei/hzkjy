package org.armysoft.security.controller.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.security.model.sys.SysModule;
import org.armysoft.security.service.sys.SysModuleService;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.armysoft.hzkjy.base.common.Constants;

/**
 * 模块Controller
 * 
 * @author wei
 * 
 */
@Controller
@RequestMapping("admin/sysModule")
public class SysModuleController extends BaseController {

	@Resource
	private SysModuleService sysModuleService;
	
	
	/*** 根据用户加载功能菜单树（左侧菜单）
	 * @param request
	 * @return 
	 */
	 /**@RequestMapping("loadModuleTreeByUserNo")
	@ResponseBody
	public List<Map<String,Object>> loadModuleTreeByUserNo(
			HttpServletRequest request) {
		//所有一级菜单
		List<SysModule> module_1 = sysModuleService.getByModuleLevel(1);
		//用户拥有的菜单
		List<SysModule> lists = null;
		String userNo = "admin";//super.getCookieValue(request, Constants.ADMIN_KEY);
		if("admin".equalsIgnoreCase(userNo)){
			lists = sysModuleService.getByModuleLevel(2);
		}else{
			lists = sysModuleService.getByUserNo(userNo);
		}
		//JSONArray jsonRes = new JSONArray();
		List<Map<String,Object>> jsonRes = new ArrayList<Map<String,Object>>();
		for(SysModule m1 : module_1){
			boolean flag = false;
			for(SysModule m2 : lists){
				if(m2.getParentNo().getModuleNo().equals(m1.getModuleNo())){
					if(!flag) flag = true;
					//JSONObject child = new JSONObject();
					Map<String,Object> child = new HashMap<String, Object>();
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
				Map<String,Object> parent = new HashMap<String, Object>();
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
        return jsonRes;
	}*/
	
	@RequestMapping("loadModuleTreeByUserNo")
	@ResponseBody
	public List<Map<String,Object>> loadModuleTreeByUserNo(
			HttpServletRequest request) {
		 List<Map<String, Object>> treeList=  new ArrayList<Map<String, Object>>();
			//所有一级菜单
			List<SysModule> rootList = sysModuleService.getByModuleLevel(1);
			//用户拥有的菜单
			List<SysModule> allList = null;
			//String userNo = "admin";//super.getCookieValue(request, Constants.ADMIN_KEY);
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
			if("admin".equalsIgnoreCase(userNo)){
				allList = sysModuleService.getByModuleLevel(2);
				 addChildrenTree(rootList,allList,treeList);
                 return treeList;
			}else{
				allList = sysModuleService.getByUserNo(userNo);
				return addUserTree(rootList,allList,treeList);
			}
		// List<Map<String, Object>> rootList=epubBookService.getCatalogLevel(bookNo,"0");
		// List<Map<String, Object>> allList=epubBookService.getCatalogWithoutParentId(bookNo,"0");
		 
   
	
	}
	
public List<Map<String, Object>> addUserTree(List<SysModule> rootList,List<SysModule> childrenList, List<Map<String, Object>> treeList){
		
	//JSONArray jsonRes = new JSONArray();
	List<Map<String,Object>> jsonRes = new ArrayList<Map<String,Object>>();
	for(SysModule m1 : rootList){
		boolean flag = false;
		for(SysModule m2 : childrenList){
			if(m2.getParentNo().getModuleNo().equals(m1.getModuleNo())){
				if(!flag) flag = true;
				//JSONObject child = new JSONObject();
				Map<String,Object> child = new HashMap<String, Object>();
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
			Map<String,Object> parent = new HashMap<String, Object>();
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
    return jsonRes;
		
	}	
	
public void addChildrenTree(List<SysModule> rootList,List<SysModule> childrenList, List<Map<String, Object>> treeList){
		
		boolean isExit=false;
		for(SysModule root:rootList){
		
			 for(SysModule element:childrenList){
				 if(element.getParentNo().getModuleNo().equals(root.getModuleNo())){
					
					 HashMap<String, Object> child=new HashMap<String, Object>();
					 child.put("id", element.getModuleNo());
					 child.put("pId", element.getParentNo() == null ? "0" : element.getParentNo().getModuleNo());
					 child.put("name", element.getModName());
					 if(element.getUrl() != null)
							child.put("file", element.getUrl());
						if(element.getParentNo() == null)
							child.put("open", true);
				
					
					
					List<SysModule> tempList=new ArrayList<SysModule>();
					tempList.add(element);
					isExit=sysModuleService.assertHasChildren(tempList,childrenList);
					if(isExit){
						addChildrenTree(tempList,childrenList,treeList);  //递归添加
					}
					else{
						treeList.add(child);
					}
				 }
			 }
			
				 //存放父节点
					Map<String, Object> parent=new HashMap<String, Object>();
					
					parent.put("id", root.getModuleNo());
					parent.put("pId", root.getParentNo() == null ? "0" : root.getParentNo().getModuleNo());
					parent.put("name", root.getModName());
					if(root.getUrl() != null)
						parent.put("file", root.getUrl());
					if(root.getParentNo() == null)
						parent.put("open", true);
				
					treeList.add(parent);
		
		 }
		 
		
	}
	/**
	 * 加载所有菜单模块和权限树（角色分配权限时）
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
