package com.armysoft.hzkjy.controller.admin.news;

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
import com.armysoft.hzkjy.model.NewsAdvert;
import com.armysoft.hzkjy.service.member.NewsAdvertService;
import com.armysoft.hzkjy.service.member.NewsService;


@Controller
@RequestMapping("/admin/newsAdvert")
public class  NewsAdvertController extends BaseController {

	@Resource
	private NewsAdvertService newsAdvertService;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	/**
	 * ������ҳ��ѯ
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
	@PermissionsAnno("newsAdvert_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
	
        model.addAttribute("list", newsAdvertService.getByPage(null, pager));
      
		model.addAttribute("page", pager);

		return "/admin/news/newsAdvertQ";
	}

	@PermissionsAnno("newsAdvert_add")
	@RequestMapping(value = ADD)
	public String toAdd(HttpServletRequest request,Model model) {
		model.addAttribute("type", "add");
	
		return "/admin/news/newsAdvertA_U";
	}
	
	
	/**
	 * ����
	 * @param entity
	 * @param model
	 * @return
	 */

	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,Model model) {
	
		model.addAttribute("entity", newsAdvertService.findByKey(key));
		 
		model.addAttribute("type", "update");
		return "/admin/news/newsAdvertA_U";
	}
	@PermissionsAnno("newsAdvert_save")
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,NewsAdvert entity, Model model,String type,String flag) {
		if(flag!=null&&flag.equals("1")){
			//上传附件
			  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
			  MultipartFile file = multipartRequest.getFile("file");  
			  if (!file.isEmpty()) {
				  String filePath="/userfiles/advertFile/"+new Date().getTime()+"_"+file.getOriginalFilename();
				  entity.setPath(filePath);
				  try {
						file.transferTo(new File(request.getSession().getServletContext().getRealPath(filePath)));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			  }
		}
		
		String key = super.getCookieValue(request,Constants.ADMIN_KEY);
		//entity.setCreateUser(key);
		if(type.equalsIgnoreCase("add")){
			newsAdvertService.insert(entity);
		}else if(type.equalsIgnoreCase("update")){
			newsAdvertService.update(entity);	
		}
		return "redirect:/admin/newsAdvert/list/1.html";
	}
	 @RequestMapping(value = "/downLoad/{id}.html")
	  public void downLoad(HttpServletResponse response,HttpServletRequest request,@PathVariable("id") Long id)
	  {
		  try
		    {
			  Map<String, Object> advert=newsAdvertService.findByKey(id);
		      response.setContentType("application/x-download");
		      String realPath = request.getSession().getServletContext().getRealPath(advert.get("path").toString());
		     String fileName=advert.get("path").toString().substring(advert.get("path").toString().lastIndexOf("/")+1);
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
	/**
	 * ɾ��
	 * @param key
	 * @return
	 */

	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key,Model model) {
		newsAdvertService.delete(key);
		//model.addAttribute("cateCode", cateCode);
		return "redirect:/admin/newsAdvert/list/1.html";
	}
	
	


}
