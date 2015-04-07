package com.armysoft.hzkjy.controller.portal.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.core.Pagination;
import org.armysoft.security.InitResourcesMap;
import org.armysoft.security.service.sys.SysUserService;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Resource
	private SysUserService sysUserService;
	@Resource
	private InitResourcesMap initResourcesMap;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	@RequestMapping("toRegist")
	public String toRegist(Model model,HttpServletRequest req){
		String token = UUID.randomUUID().toString();
		req.getSession().setAttribute("token", token);
		model.addAttribute("token", token);
		return "portal/member/regist";
	}
	
	/**
	 * 用户注册
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping("regist")
	public String regist(MemberBasic entity,String token, Model model,HttpServletRequest req) {
		Object oldToken = req.getSession().getAttribute("token");
		if(oldToken != null && oldToken.toString().equals(token)){
			entity.setQymcpy(Cn2Spell.converterToFirstSpell(entity.getQymc()));
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
			initResourcesMap.init();
			model.addAttribute("userNo", entity.getHybh());
			model.addAttribute("password", Constants.DEFAULT_PASSWORD);
			req.getSession().removeAttribute("token");
			return "portal/member/reg_ok";
		}
		return "redirect:/portal/index.html";
	}

	@RequestMapping("forget")
	public String forget(Model model,HttpServletRequest req){
		
		return "portal/member/forget";
	}
	@RequestMapping(value = "/forgetemail.html")
	  public String forgetemail(HttpServletRequest request,HttpServletResponse response,Model model,String email,String vcode)
	  {
		 String oldCode = (String) request.getSession().getAttribute(
					Constants.VERIFY_CODE);
		 model.addAttribute("email", email);
		 if(!oldCode.equalsIgnoreCase(vcode)){
			 model.addAttribute("msg", "验证码不正确");
			
			 return "portal/member/forget";
		 }
		 Map<String, Object> ac= sysUserService.getByEmail(email);
		 if(ac!=null){
			//发送邮箱到用户
			 ac.put("MailSeq", String.valueOf(new Date().getTime()));
			 sysUserService.updateMailSeq(ac.get("MailSeq").toString(),ac.get("UserNo").toString());
			 service.sendMail( ac,"reset");
				model.addAttribute("email", email);
				
				return "portal/member/forget_mail";
		 }else{
			 model.addAttribute("msg", "邮箱不存在");
			 return "portal/member/forget";
		 }
	  }
	@RequestMapping(value = "/resetPwd.html")
	  public String resetPwd(HttpServletRequest request,HttpServletResponse response,Model model,String userNo,String mailSeq)
	  {
		 Map<String, Object> ac= sysUserService.getByUserNo2(userNo);
		 if(ac!=null){
			 if(ac.get("MailSeq").toString().equals(mailSeq)){
				 model.addAttribute("userNo", userNo);
				 model.addAttribute("mailSeq", mailSeq);
				 return "portal/member/forget_reset";
			 }
		 }
		 return "portal/member/forget";
		
	  }
	@RequestMapping(value = "/submitResetPwd.html")
	  public String submitResetPwd(HttpServletRequest request,HttpServletResponse response,Model model,String pwd,String repwd,String userNo,String mailSeq)
	  {
		if(pwd.equals(repwd)==false){
			model.addAttribute("msg", "两次输入密码必须一致!");
			 return "portal/member/forget_reset";
		}
		
		 Map<String, Object> ac= sysUserService.getByUserNo2(userNo);
		 if(ac!=null){
			 if(ac.get("MailSeq").toString().equals(mailSeq)){
				 sysUserService.updatePwd(userNo,DigestUtils.md5DigestAsHex(pwd.getBytes()));
				 return "portal/member/forget_success"; 
			 }
			
		 }
			model.addAttribute("msg", "用户的用户名:"+userNo);
		 return "portal/member/forget_reset";
		
	  }
	@RequestMapping(value = "/loginMail.html")
	  public String loginMail(HttpServletRequest request,HttpServletResponse response,Model model,String email)
	  {
		String url="";
		if(email.contains("@163.com")){
			url="http://mail.163.com/";
		}else if(email.contains("@qq.com")){
			url="https://mail.qq.com/cgi-bin/loginpage?";
		}else if(email.contains("@sina.cn")){
			url="http://mail.sina.com.cn/";
		}else if(email.contains("@yahoo.com")){
			url="https://login.yahoo.com/config/login_verify2?&.src=ym&.intl=cn";
		}
		  return "redirect:"+url;
	  }
	  @RequestMapping(value = PAGE_LIST)
		public String getByPage(@PathVariable Integer currentPage,String fzt,String fsfjjyb,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
				MemberBasic entity, HttpServletRequest request) {
			Pagination pager = initPage(currentPage);
			Map<String, Object> params = new HashMap<String, Object>();
	        model.addAttribute("list", service.getByPage(params, pager));
	
			model.addAttribute("page", pager);
		
			return "portal/member/MemberBasicQ";
		}
}
