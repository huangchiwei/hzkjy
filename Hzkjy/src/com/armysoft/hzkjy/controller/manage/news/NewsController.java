package com.armysoft.hzkjy.controller.manage.news;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.armysoft.hzkjy.annotation.PermissionsAnno;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.model.MemberFasic;
import com.armysoft.hzkjy.model.News;
import com.armysoft.hzkjy.service.member.NewsService;


@Controller
@RequestMapping("/manager/news")
public class  NewsController extends BaseController {

	@Resource
	private NewsService newsService;
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
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String cateCode,Model model, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cateCode", cateCode);
		model.addAttribute("cateCode", cateCode);
        model.addAttribute("list", newsService.getByPage(params, pager));
        model.addAttribute("category", newsService.getCategory(cateCode));
		model.addAttribute("page", pager);

		return "/news/newsQ";
	}


	@RequestMapping(value = ADD)
	public String toAdd(HttpServletRequest request,Model model,String cateCode) {
		model.addAttribute("type", "add");
		model.addAttribute("cateCode", cateCode);
		 model.addAttribute("category", newsService.getCategory(cateCode));
		return "/news/newsA_U";
	}
	
	
	/**
	 * ����
	 * @param entity
	 * @param model
	 * @return
	 */

	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,Model model,String cateCode) {
		model.addAttribute("cateCode", cateCode);
		model.addAttribute("entity", newsService.findByKey(key));
		 model.addAttribute("category", newsService.getCategory(cateCode));
		model.addAttribute("type", "update");
		return "/news/newsA_U";
	}

	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,News entity, Model model,String cateCode,String type) {
		String key = super.getCookieValue(request, WebConstant.COOKIE_KEY);
		entity.setCreateUser(key);
		if(type.equalsIgnoreCase("add")){
			newsService.insert(entity);
		}else if(type.equalsIgnoreCase("update")){
			newsService.update(entity);	
		}
		return "redirect:/manager/news/list/1.html?cateCode="+cateCode;
	}
	
	/**
	 * ɾ��
	 * @param key
	 * @return
	 */

	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key,Model model,String cateCode) {
		newsService.delete(key);
		model.addAttribute("cateCode", cateCode);
		return "redirect:/manager/news/list/1.html?cateCode="+cateCode;
	}
	
	


}
