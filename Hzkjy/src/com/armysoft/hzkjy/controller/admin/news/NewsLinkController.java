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
import com.armysoft.hzkjy.model.NewsLink;
import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsLinkService;
import com.armysoft.hzkjy.service.member.NewsService;

/**
 * 友情链接
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/newsLink")
public class  NewsLinkController extends BaseController {

	@Resource
	private NewsLinkService newsLinkService;
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
	@PermissionsAnno("newsAdvert_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		List<Map<String, Object>> list=newsLinkService.getByPage(null, pager);
        model.addAttribute("list", list);
        model.addAttribute("size", list.size());
		model.addAttribute("page", pager);

		return "/admin/news/newsLinkQ";
	}

	@PermissionsAnno("newsAdvert_add")
	@RequestMapping(value = ADD)
	public String toAdd(HttpServletRequest request,Model model) {
		model.addAttribute("type", "add");
		
		return "/admin/news/newsLinkA_U";
	}
	
	
	/**
	 * ����
	 * @param entity
	 * @param model
	 * @return
	 */

	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,Model model) {
	
		model.addAttribute("entity", newsLinkService.findByKey(key));
		 
		model.addAttribute("type", "update");
		
		return "/admin/news/newsLinkA_U";
	}
	@PermissionsAnno("newsAdvert_save")
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,NewsLink entity, Model model,String type,String flag) {
	
		
		String key = super.getCookieValue(request,Constants.ADMIN_KEY);
		//entity.setCreateUser(key);
		if(type.equalsIgnoreCase("add")){
			newsLinkService.insert(entity);
		}else if(type.equalsIgnoreCase("update")){
			newsLinkService.update(entity);	
		}
		return "redirect:/admin/newsLink/list/1.html";
	}

	/**
	 * ɾ��
	 * @param key
	 * @return
	 */

	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key,Model model) {
		newsLinkService.delete(key);
		//model.addAttribute("cateCode", cateCode);
		return "redirect:/admin/newsLink/list/1.html";
	}
	
	


}
