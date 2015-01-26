package com.armysoft.hzkjy.base.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.armysoft.hzkjy.base.common.WebConstant;

public class CookieUtil {
	/**
	 * 获取当前用户CookieValue
	 * @param request
	 * @return
	 */
	public static String getUserCookieValue(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if (cookies != null){
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(WebConstant.COOKIE_KEY))
					return cookie.getValue();
			}
		}
		return "";
	}
}
