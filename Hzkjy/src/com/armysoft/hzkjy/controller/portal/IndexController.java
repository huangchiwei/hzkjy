package com.armysoft.hzkjy.controller.portal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("portal")
public class IndexController {

	@RequestMapping("{page}")
	public String dispatcher(Model model, @PathVariable String page,
			HttpServletRequest req) {
		
		return "portal/index/" + page;
	}
}
