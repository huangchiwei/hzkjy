package com.armysoft.hzkjy.base.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	/**
	 * 获取当前用户CookieValue
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getUserCookieValue(HttpServletRequest request,String key){
		Cookie[] cookies = request.getCookies();
		if (cookies != null){
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(key))
					return cookie.getValue();
			}
		}
		return "";
	}
	 public static void addCookie(HttpServletResponse response, String name, String value, int maxAge)
	  {
	    Cookie cookie = new Cookie(name, value);
	    cookie.setPath("/");
	    if (maxAge > 0) cookie.setMaxAge(maxAge);
	    response.addCookie(cookie);
	  }
	  public static void deleteCookie( HttpServletResponse response, String name) {
	    Cookie cookie = new Cookie(name, "");
	    cookie.setPath("/");
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	  }
}
