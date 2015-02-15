/*package com.armysoft.hzkjy.controller.manage.login;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.armysoft.security.model.sys.SysUser;
import org.armysoft.security.service.sys.SysUserService;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.armysoft.hzkjy.base.common.WebConstant;

*//**
 * 登录Controller
 * @author wei
 *//*
@Controller
@RequestMapping("/")
public class LoginController extends BaseController {

	@Resource
	private SysUserService sysUserService;

	*//**
	 * 用户登录
	 * @param userNo
	 * @param password
	 * @param vcode
	 * @param request
	 * @return
	 *//*
	@RequestMapping(value="userLogin",method = RequestMethod.POST)
	public void userLogin(String userNo, String password, String vcode,
			HttpServletRequest request,HttpServletResponse response) {
//		String userpwd="chas123456";
//		String base64 =  new sun.misc.BASE64Encoder().encode(userpwd.getBytes());
//		MD5 md5 = new MD5();
//		System.out.println(md5.getMD5ofStr(base64));
		try {
			String key = super.getCookieValue(request, WebConstant.COOKIE_KEY);
			if(StringUtils.hasText(key)){//已经登录
				response.sendRedirect("centerPage/center.html");
				return;
			}
			String oldCode = (String) request.getSession().getAttribute(
					WebConstant.VERIFY_CODE);
			if (oldCode.equalsIgnoreCase(vcode)) { 
				SysUser user = sysUserService.getByUserNo(userNo);
				//if (user != null && DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPwd()) && user.getStatus() == 1) {
				if (user != null && user.getStatus() == 1) {
				HttpSession sessionOld = request.getSession(false);
					if(sessionOld != null){
						sessionOld.invalidate();
					}
					request.getSession(true);
					super.setCookie(response, WebConstant.COOKIE_KEY, userNo);
					response.sendRedirect("centerPage/center.html");
					return;
				} else {
					request.setAttribute("msg", "用户名或密码不正确");
				}
			} else {
				request.setAttribute("msg", "验证码不正确!");
				
			}
			request.setAttribute("userNo", userNo);
			request.getRequestDispatcher("/WEB-INF/jsp/admin/base/login.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	*//**
	 * 注销
	 * @param request
	 * @param response
	 * @return
	 *//*
	@RequestMapping("loginOut")
	public String loginOut(HttpServletRequest request,HttpServletResponse response){
		Cookie[] cks = request.getCookies();
		for(Cookie ck : cks){
			Cookie cookie = new Cookie(ck.getName(), "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		request.getSession().invalidate();
		return "redirect:/";
	}
	
}
*/