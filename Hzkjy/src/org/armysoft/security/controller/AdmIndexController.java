package org.armysoft.security.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdmIndexController {

	@RequestMapping("{page}")
	public String dispatcher(Model model,@PathVariable String page,HttpServletRequest req){
		//if("index".equalsIgnoreCase(page))
			//model.addAttribute("userNo", CookieUtil.getUserCookieValue(req, Constants.ADMIN_KEY));
		return "admin/base/" + page + ".jsp";
	}
}
