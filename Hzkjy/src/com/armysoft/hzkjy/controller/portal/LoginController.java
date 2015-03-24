package com.armysoft.hzkjy.controller.portal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.armysoft.security.model.sys.SysUser;
import org.armysoft.security.service.sys.SysUserService;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.armysoft.hzkjy.base.common.Constants;

/**
 * 登录Controller
 * 
 * @author wei
 */
@Controller
@RequestMapping("portal")
public class LoginController extends BaseController {

	@Resource
	private SysUserService sysUserService;

	/**
	 * 用户登录
	 * 
	 * @param userNo
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(
			String userNo,
			String password,
			String vcode,
			HttpServletRequest request,
			HttpServletResponse response,
			@CookieValue(value = Constants.ADMIN_KEY, required = false) String key) {
		try {
			if (StringUtils.hasText(key)) {// 已经登录
				return "redirect:/portal/index.html";
			}

			SysUser user = sysUserService.getByUserNo(userNo);
			if (user != null
					&& DigestUtils.md5DigestAsHex(password.getBytes()).equals(
							user.getPwd()) && user.getStatus() == 1) {
				HttpSession sessionOld = request.getSession(false);
				if (sessionOld != null) {
					sessionOld.invalidate();
				}
				request.getSession(true);
				super.setCookie(response, Constants.ADMIN_KEY, userNo);
			} else {
				request.setAttribute("msg", "用户名或密码不正确!");
				request.setAttribute("userNo", userNo);
			}
			return "redirect:/portal/index.html";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}