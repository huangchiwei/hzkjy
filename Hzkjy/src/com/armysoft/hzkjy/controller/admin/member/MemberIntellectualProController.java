package com.armysoft.hzkjy.controller.admin.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.armysoft.hzkjy.base.util.ExportExcel_InteProCount;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberIntellectualPro;
import com.armysoft.hzkjy.service.member.MemberIntellectualProService;

/**
 * 科技项目，知识产权统计
 * @author Administrator
 *
 */
@Controller
@RequestMapping("admin/memberIntellectualPro")
public class  MemberIntellectualProController extends BaseController {

	@Resource
	private MemberIntellectualProService memberIntellectualProService;
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
    @SuppressWarnings("deprecation")
	@RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage, HttpServletRequest request, Model model,String year,String month) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		if(year!=null)
		params.put("year", year);
		else params.put("year",  Calendar.getInstance().get(Calendar.YEAR));
		
		if(month!=null)
		params.put("month", month);
		else params.put("month", "1");
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(!userNo.equals("admin"))
		params.put("memberNo", userNo);
        model.addAttribute("list", memberIntellectualProService.getByPage(params, pager));
		model.addAttribute("page", pager);
		model.addAttribute("params", params);
		return "admin/member/MemberIntellectualProQ";
	}


    @RequestMapping(value ="/updateStatus/${id}.html" )
	public String updateStatus(@PathVariable("id") Long key,HttpServletRequest request,Model model,Integer status) {
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", key);
    	params.put("status", status);
    	memberIntellectualProService.updateStatus(params);
		return "admin/member/MemberIntellectualProA_U";
	}
	
	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		model.addAttribute("type", "A");
		return "admin/member/MemberIntellectualProA_U";
	}
	

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,MemberIntellectualPro entity, Model model) {
		model.addAttribute("type", "U");
		model.addAttribute("entity",memberIntellectualProService.findByKey(key));
		return "admin/member/MemberIntellectualProA_U";
	}
	
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,MemberIntellectualPro entity, Model model,String type) {
		if(type.equals("U")){
			memberIntellectualProService.update(entity);
		}else if(type.equals("A")){
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
			entity.setMemberNo(userNo);
			memberIntellectualProService.insert(entity);
		}
		return "redirect://admin/memberIntellectualPro/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		memberIntellectualProService.delete(key);
		return "redirect://admin/memberIntellectualPro/list/1.html";
	}
	
	/**
	 * 导出excel
	 * @param model
	 * @param fhymc
	 * @param request
	 * @param response
	 */
	@RequestMapping("/outExcel/1.html")
	public void outExcel(Model model,Integer year,Integer month,HttpServletRequest request,HttpServletResponse response) {
		String title=year+"琶洲园区企业科技项目申报情况"+(month==0?"1~6月":"7~12月");
		List headData =  new ArrayList();
		headData.add(new Object[] { "RowNo","序号"});
		headData.add(new Object[] { "Qymc","企业"});
		headData.add(new Object[] { "ProjectLevel","项目级别"});
		headData.add(new Object[] { "ProjectType","项目类别"});
		headData.add(new Object[] { "ProjectName","项目名称"});
		headData.add(new Object[] { "ApplyAmount","申报额度(万)"});
		headData.add(new Object[] { "IsSetUp","立项"});
		headData.add(new Object[] { "SetUpAmount","立项资助金额(万)"});
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("year", year+"");
		params.put("month", month+"");
		//String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List<Map<String, Object>>  list =memberIntellectualProService.findAll(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}
	/**
	 * 知识产权统计
	 * @param request
	 * @param model
	 * @param year
	 * @return
	 */
	  @RequestMapping(value ="/inteProCount.html" )
		public String inteProCount(HttpServletRequest request,Model model,String year) {
	    	Map<String, Object> params = new HashMap<String, Object>();	   
	    	if(year!=null&&year.isEmpty()==false){
	    		params.put("year", year);
	    	}else{	
	    		params.put("year", new Date().getYear());
	    	}
	    	
	    	
	    	//memberIntellectualProService.inteProCount(params);
			return "admin/member/MemberIntelProCount";
		}
	  @RequestMapping(value ="/outInteProCount/1.html" )
		public void OutInteProCount(HttpServletRequest request,HttpServletResponse response,Model model,String year) {
	    	Map<String, Object> params = new HashMap<String, Object>();	   
	    	if(year!=null&&year.isEmpty()==false){
	    		params.put("year", year);
	    	}else{	
	    		params.put("year", new Date().getYear());
	    	}
	    	
	    	String title="企业知识产权情况";
			List headData =  new ArrayList();
			headData.add(new Object[] { "name","指标名称"});
			headData.add(new Object[] { "unit","计量单位"});
			headData.add(new Object[] { "number","数量"});
			
		
			
			List<Map<String, Object>>  list =new ArrayList<Map<String, Object>>();//memberIntellectualProService.findAll(params);
			list.add(memberIntellectualProService.createMap("知识产权授权数(1-6月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("其中:发明专利(1-6月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("实用新型(1-6月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("外观设计(1-6月)", "个", "0"));
			list.add(memberIntellectualProService.createMap("软件著作权(1-6月)", "个", "0"));
			list.add(memberIntellectualProService.createMap("知识产权授权数(7-12月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("其中:发明专利(7-12月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("实用新型(7-12月)", "件", "0"));
			list.add(memberIntellectualProService.createMap("外观设计(7-12月)", "个", "0"));
			list.add(memberIntellectualProService.createMap("软件著作权(7-12月)", "个", "0"));
			list.add(memberIntellectualProService.createMap("到上一年为止拥有有效知识产权数", "件", "0"));
			list.add(memberIntellectualProService.createMap("其中:发明专利", "件", "0"));
			list.add(memberIntellectualProService.createMap("实用新型", "件", "0"));
			list.add(memberIntellectualProService.createMap("外观设计", "个", "0"));
			list.add(memberIntellectualProService.createMap("软件著作权", "个", "0"));
			list.add(memberIntellectualProService.createMap("现拥有有效知识产权数", "件", "0"));
			list.add(memberIntellectualProService.createMap("其中:发明专利", "件", "0"));
			list.add(memberIntellectualProService.createMap("实用新型", "件", "0"));
			list.add(memberIntellectualProService.createMap("外观设计", "个", "0"));
			list.add(memberIntellectualProService.createMap("软件著作权", "个", "0"));
			list.add(memberIntellectualProService.createMap("获得奖项总数(1-6月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("其中:国家级奖项(1-6月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("省级奖项(1-6月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("市级奖项(1-6月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("获得奖项总数(7-12月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("其中:国家级奖项(7-12月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("省级奖项(7-12月)", "项", "0"));
			list.add(memberIntellectualProService.createMap("市级奖项(7-12月)", "项", "0"));
				
			
			
			
			
			ExportExcel_InteProCount ee = new ExportExcel_InteProCount(title,title, headData);
			
			ee.exportExcel_Applicant(request, response,list);
	    
		}
}
