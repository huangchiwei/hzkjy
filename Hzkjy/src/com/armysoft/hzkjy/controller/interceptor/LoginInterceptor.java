package com.armysoft.hzkjy.controller.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.CookieUtil;

/**
 * 登录拦截
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}
	
	/** 
	* 登入免检查地�?
	*/ 
	private List<String> uncheckUrls;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		request.setAttribute("cssFile", WebConstant.cssFile);
		String url = request.getServletPath().toString();
		System.out.println("url:" + url);
		for(String str : uncheckUrls){
			if(url.indexOf(str) != -1){
				return true;
			}
		}
		
		String userNo = CookieUtil.getUserCookieValue(request);
		if(StringUtils.hasText(userNo)){
				return true;
		}else{
			if(url.indexOf("centerPage/center") != -1){
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			}else{
			
				String contextPath = request.getContextPath();//上下�?
				PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<head><title>redirecting...</title></head>");
				out.println("<body>");
				out.println("<script language='javascript'>");
				out.println("top.location.href='" + contextPath + "'");
				out.println("</script>");
				out.println("</body>");
				out.println("</html>");
				out.flush();
				out.close();
			}
		}
		return false;
	}

	public List<String> getUncheckUrls() {
		return uncheckUrls;
	}

	public void setUncheckUrls(List<String> uncheckUrls) {
		this.uncheckUrls = uncheckUrls;
	}

	
}
