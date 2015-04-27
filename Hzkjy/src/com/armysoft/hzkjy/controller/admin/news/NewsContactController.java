package com.armysoft.hzkjy.controller.admin.news;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.armysoft.security.annotation.PermissionsAnno;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.model.MemberFasic;
import com.armysoft.hzkjy.model.News;
import com.armysoft.hzkjy.model.NewsAdvert;
import com.armysoft.hzkjy.model.NewsContact;
import com.armysoft.hzkjy.model.NewsLink;
import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsContactService;
import com.armysoft.hzkjy.service.member.NewsLinkService;
import com.armysoft.hzkjy.service.member.NewsService;

/**
 * 资讯页左边的联系我们
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/newsContact")
public class  NewsContactController extends BaseController {

	@Resource
	private NewsContactService newsContactService;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	/**
	 * ������ҳ��ѯ
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
	@PermissionsAnno("newsContact_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model, HttpServletRequest request) {
	
		List<Map<String, Object>> list=newsContactService.getAll();
		if(list!=null&&list.size()>0){
			model.addAttribute("entity", list.get(0));
			model.addAttribute("type", "update");
		}else{
			model.addAttribute("type", "add");
		}
        
       String status=request.getParameter("status");
       if(status!=null&&status.isEmpty()==false){
    	   model.addAttribute("msg", "保存成功");
       }
		return "/admin/news/newsContactU";
	}



	@PermissionsAnno("newsContact_save")
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,NewsContact entity, Model model,String type) {
	
		
		//String key = super.getCookieValue(request,Constants.ADMIN_KEY);
		//entity.setCreateUser(key);
		if(type.equalsIgnoreCase("add")){
			newsContactService.insert(entity);
		}else if(type.equalsIgnoreCase("update")){
			newsContactService.update(entity);	
		}
		return "redirect:/admin/newsContact/list/1.html?status="+type;
	}

	


}
