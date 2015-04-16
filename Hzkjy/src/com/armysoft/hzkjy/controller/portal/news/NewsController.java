package com.armysoft.hzkjy.controller.portal.news;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.core.Pagination;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.armysoft.security.annotation.PermissionsAnno;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.model.MemberFasic;
import com.armysoft.hzkjy.model.News;
import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsService;


@Controller("PortalNewsController")
@RequestMapping("/portal/news")
public class  NewsController extends BaseController {
//
	@Resource
	private NewsAdvertService newsAdvertService;
	@Resource
	private NewsService newsService;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	
	/**
	 * 
	 * @param currentPage
	 * @param cateCode
	 * @param model
	 * @param request
	 * @return
	 */
    @RequestMapping(value = PAGE_LIST)
	public String list(@PathVariable Integer currentPage,String cateCode,Model model, HttpServletRequest request) {
    	
		
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("adType", "2");
		model.addAttribute("adList2",newsAdvertService.getByAdType(params));
		
		params.put("cateCode", cateCode);
		model.addAttribute("cateCode", cateCode);
		List<Map<String, Object>>  list=newsService.getByPage(params, pager);
        model.addAttribute("list", list);
        model.addAttribute("category", newsService.getCategory(cateCode));
		model.addAttribute("page", pager);
		if(cateCode.equals("park_intro")){
			return "/portal/news/park_intro";
		}else if(cateCode.equals("park_frame")){
			String content="";
			if(list!=null&&list.size()>0&&list.get(0)!=null) content=list.get(0).get("content").toString();
			model.addAttribute("content", content);
			return "/portal/news/park_frame";
		}if(cateCode.equals("park_site")){
			return "/portal/news/park_site";
		}if(cateCode.equals("park_envir")){
			//获取图片
			String content="";
			if(list!=null&&list.size()>0&&list.get(0)!=null) content=list.get(0).get("content").toString();
			List<Object> picList=newsService.getAllSrc(content);
			model.addAttribute("picList", picList);
			return "/portal/news/park_envir";
		}else{
			return "/portal/news/list";
		}
		

	}
	
    @RequestMapping(value = "/contactUs.html")
	public String contactUs(Model model) {
    	model.addAttribute("cateCode", "contactUs");
		return "/portal/news/contactUs";
	}

	@RequestMapping(value = "/detail/{id}.html")
	public String detail(@PathVariable("id") Long key,Model model,String cateCode) {
		model.addAttribute("cateCode", cateCode);
		model.addAttribute("entity", newsService.findByKey(key));
		 model.addAttribute("category", newsService.getCategory(cateCode));
		model.addAttribute("type", "update");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("adType", "2");
		model.addAttribute("adList2",newsAdvertService.getByAdType(params));
		return "/portal/news/detail";
	}
	@RequestMapping(value = "/search/{currentPage}.html")
	public String search(@PathVariable Integer currentPage,Model model,String searchTxt) {
		model.addAttribute("searchTxt", searchTxt);
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchTxt", searchTxt);
		List<Map<String, Object>>  list=newsService.getByPage(params, pager);
        model.addAttribute("list", list);
        model.addAttribute("page", pager);
		return "/portal/news/searchList";
	}
	
	 @RequestMapping(value = "/downLoad/{id}.html")
	  public void downLoad(HttpServletResponse response,HttpServletRequest request,@PathVariable("id") Long id)
	  {
		  try
		    {
			  String key = super.getCookieValue(request,Constants.ADMIN_KEY);
			  if(key==null||key==""){
				 return;
			  }
			  Map<String, Object> news=newsService.findByKey(id);
		      response.setContentType("application/x-download");
		      String realPath = request.getSession().getServletContext().getRealPath(news.get("filePath").toString());
		     String fileName=news.get("filePath").toString().substring(news.get("filePath").toString().lastIndexOf("/")+1);
		     // realPath = URLEncoder.encode(realPath, "UTF-8");
		      response.addHeader("Content-Disposition", "attachment;filename=" +fileName );
		      OutputStream out = response.getOutputStream();
		      InputStream inputStream = new FileInputStream(realPath);
		      byte[] buffer = new byte[1024];
		      int i = -1;
		      while ((i = inputStream.read(buffer)) != -1) {
		       out.write(buffer, 0, i);
		       }
		      out.flush();
		      out.close();
		    }
		    catch (Exception e) {
		      e.printStackTrace();
		    }

	    
	  }
	
	


}
