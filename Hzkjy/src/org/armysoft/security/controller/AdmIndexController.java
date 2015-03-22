package org.armysoft.security.controller;

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
			BsNews bs=service.findByUser(CookieUtil.getUserCookieValue(req,
					 Constants.ADMIN_KEY));
			String tcnr="";
		 if(bs!=null){
				
			 req.setAttribute("tcbt", bs.getTitle());
				if(bs.getContent().toString().length()>200){
				tcnr=	bs.getContent().toString().substring(0, 200)+"...";
				}else{
					tcnr=	bs.getContent().toString();
				}
				req.setAttribute("tcnr", tcnr);
				req.setAttribute("tcid", bs.getId());
			}
		return "admin/base/" + page;
	}
}
