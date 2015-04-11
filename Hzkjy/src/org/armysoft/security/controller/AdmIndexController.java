package org.armysoft.security.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.CookieUtil;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.service.member.BsNewsService;

@Controller
@RequestMapping("admin")
public class AdmIndexController {
	
	@Resource
	private BsNewsService service;
	@RequestMapping("{page}")
	public String dispatcher(Model model, @PathVariable String page,
			HttpServletRequest req) {
		// if("index".equalsIgnoreCase(page))
		 model.addAttribute("userNo", CookieUtil.getUserCookieValue(req,
		 Constants.ADMIN_KEY));
		 List<Map<String,Object>> list=service.findByUser(CookieUtil.getUserCookieValue(req,
				 Constants.ADMIN_KEY));
			String tcnr="";
		 if(list!=null){
				
			 req.setAttribute("bslist", list);
			}
		return "admin/base/" + page;
	}
}
