package com.armysoft.hzkjy.controller.portal;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsService;

@Controller
@RequestMapping("portal/")
public class IndexController extends BaseController{
	@Resource
	private NewsAdvertService newsAdvertService;
	@Resource
	private NewsService newsService;
	
	@RequestMapping("{page}")
	public String dispatcher(Model model, @PathVariable String page,
			HttpServletRequest req) {
		if(page.equals("index")){}
		//首页轮播广告
		Pagination pager = initPage(1);
		model.addAttribute("adList", newsAdvertService.getByPage(null, pager));
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", 8);
		
		//最新公告
		params.put("prefixCode", "notice_");
		 model.addAttribute("noticeList", newsService.getLikePrefixCode(params));
		
		//交流培训
		params.put("prefixCode", "train_");
		 model.addAttribute("trainList", newsService.getLikePrefixCode(params));
		 
		//政府政策
		 params.put("prefixCode", "policy_");
		 model.addAttribute("policyList", newsService.getLikePrefixCode(params));
		 
		 
		 
		return "portal/index/" + page;
	}
	
}
