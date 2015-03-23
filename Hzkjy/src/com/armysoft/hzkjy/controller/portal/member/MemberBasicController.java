package com.armysoft.hzkjy.controller.portal.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.MemberBasicService;

@Controller("PortalMemberBasicController")
@RequestMapping("portal/memberBasic")
public class MemberBasicController extends BaseController {

	@Resource
	private MemberBasicService service;
	

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	@RequestMapping("toRegist")
	public String toRegist(){
		return "portal/member/regist";
	}
	
	/**
	 * 用户注册
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping("regist")
	public String regist(MemberBasic entity, Model model) {
		if (entity.getId() == null) {
			Cn2Spell cn2Spell = new Cn2Spell();
			entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
			String newHybh = "";
			String newHybh1 = "44";
			String newHybh2 = "01";
			Integer countI = service.CountHybh(newHybh1, newHybh2);
			if (countI == 0) {
				newHybh = newHybh1 + newHybh2 + "00001";
				entity.setHybh(newHybh);
			} else {
				MemberBasic entity2 = service.findByNewHybh(newHybh1, newHybh2);
				Long newbh = Long.parseLong(entity2.getHybh());
				newbh = newbh + 1;
				entity.setHybh(newbh.toString());
			}
			service.insertMemberAndUser(entity);
			model.addAttribute("userNo", entity.getHybh());
			model.addAttribute("password", Constants.DEFAULT_PASSWORD);
			return "portal/member/reg_ok";
		} else {
			service.update(entity);
		}
		return "redirect:/portal/index.html";
	}

}
