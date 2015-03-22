package com.armysoft.hzkjy.controller.base;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.DateUtil;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.NewsService;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;
/**
 * 首页页面跳转Controller
 * @author wei
 *
 */
@Controller
@RequestMapping("centerPage")
public class CenterPageController extends BaseController {

	@RequestMapping("/{page}")
	public String center(@PathVariable("page") String page,HttpServletRequest request){
		if(page.equals("center"))
			System.out.println(page);
			request.setAttribute("userNo", super.getCookieValue(request, WebConstant.COOKIE_KEY));
		if(page.equals("welcome")){
			// 初始化分页实�?
			
			
			Pagination pager = initPage(1);
			pager.setPageSize(5);
			Calendar cal = Calendar.getInstance();
			String beginTime = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE) + " " + "00:00:00";
			String endTime = DateUtil.parseDate(new Date());
		
			
			
		}
		
		return "base/" + page;
	}

	
}
