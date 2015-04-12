package com.armysoft.hzkjy.controller.portal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.armysoft.hzkjy.base.util.StringUtil;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsService;

@Controller
@RequestMapping("portal/")
public class IndexController extends BaseController{
	@Resource
	private NewsAdvertService newsAdvertService;
	@Resource
	private NewsService newsService;
	@Resource
	private MemberBasicService memberBasicService;
	@RequestMapping("{page}")
	public String dispatcher(Model model, @PathVariable String page,
			HttpServletRequest req) {
		if(page.equals("index")){
		//首页轮播广告
		Pagination pager = initPage(1);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("adType", "0");
		model.addAttribute("adList0",newsAdvertService.getByAdType(params));
		params.put("adType", "1");
		model.addAttribute("adList1",newsAdvertService.getByAdType(params));
		//model.addAttribute("adList", newsAdvertService.getByPage(null, pager));
		
		params.clear();
		params.put("pageSize", 8);
		
		//最新公告
		params.put("prefixCode", "notice_");
		List<Map<String, Object>> noticeList=newsService.getLikePrefixCode(params);
		if (noticeList != null && noticeList.size() > 0) {
			for (Map<String, Object> h : noticeList) {				
				h.put("src", StringUtil.getImageSrc(h.get("content").toString()));
			}
		}
		 model.addAttribute("noticeList", noticeList);
		
		//交流培训
		params.put("prefixCode", "train_");
		 model.addAttribute("trainList", newsService.getLikePrefixCode(params));
		 
		//政府政策
		 params.put("prefixCode", "policy_");
		 model.addAttribute("policyList", newsService.getLikePrefixCode(params));
		 
		 //入驻企业 
		 params.put("pageSize", 10);
		 model.addAttribute("memberList", memberBasicService.getByPage(params, pager));
		 
		 model.addAttribute("cateCode", "index");
		}
		return "portal/index/" + page;
		
	}
	
}
