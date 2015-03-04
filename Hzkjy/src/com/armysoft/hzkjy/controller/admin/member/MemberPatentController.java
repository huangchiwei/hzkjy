package com.armysoft.hzkjy.controller.admin.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberIntellectualPro;
import com.armysoft.hzkjy.model.MemberPatent;
import com.armysoft.hzkjy.service.member.MemberIntellectualProService;
import com.armysoft.hzkjy.service.member.MemberPatentService;

/**
 * 专利
 * @author Administrator
 *
 */
@Controller
@RequestMapping("admin/memberPatent")
public class  MemberPatentController extends BaseController {

	@Resource
	private MemberPatentService memberPatentService;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	/**
	 * 条件分页查询
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage, HttpServletRequest request, Model model,String startTime,String endTime) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("endTime", endTime);
        model.addAttribute("list", memberPatentService.getByPage(params, pager));
		model.addAttribute("page", pager);
		model.addAttribute("params", params);
		return "admin/member/MemberPatentQ";
	}


    @RequestMapping(value ="/updateStatus/${id}.html" )
	public String updateStatus(@PathVariable("id") Long key,HttpServletRequest request,Model model,Integer status) {
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", key);
    	params.put("status", status);
    	memberPatentService.updateStatus(params);
		return "admin/member/MemberPatentA_U";
	}
	
	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		model.addAttribute("ptype", "A");
		return "admin/member/MemberPatentA_U";
	}
	

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,MemberIntellectualPro entity, Model model) {
		model.addAttribute("ptype", "U");
		model.addAttribute("entity",memberPatentService.findByKey(key));
		return "admin/member/MemberPatentA_U";
	}
	
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,MemberPatent entity, Model model,String ptype) {
		if(ptype.equals("U")){
			memberPatentService.update(entity);
		}else if(ptype.equals("A")){
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
			entity.setMemberNo(userNo);
			memberPatentService.insert(entity);
		}
		return "redirect://admin/memberPatent/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		memberPatentService.delete(key);
		return "redirect://admin/memberPatent/list/1.html";
	}
	
	/**
	 * 导出excel
	 * @param model
	 * @param fhymc
	 * @param request
	 * @param response
	 */
	@RequestMapping("/outExcel/1.html")
	public void OutPtqfqk(Model model,String startTime,String endTime,HttpServletRequest request,HttpServletResponse response) {
		String title="琶洲园区企业科技项目申报情况";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Hybh","企业名称"});
		headData.add(new Object[] { "ProjectLevel","项目级别"});
		headData.add(new Object[] { "ProjectType","项目类别"});
		headData.add(new Object[] { "ProjectName","项目名称"});
		headData.add(new Object[] { "ApplyAmount","申报额度"});
		headData.add(new Object[] { "IsSetUp","是否立项"});
		headData.add(new Object[] { "SetUpAmount","立项资助金额"});
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		//String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List<Map<String, Object>>  list =memberPatentService.findAll(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}
}
