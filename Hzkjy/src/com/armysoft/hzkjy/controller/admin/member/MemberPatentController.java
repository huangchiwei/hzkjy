package com.armysoft.hzkjy.controller.admin.member;

import java.text.DateFormat;
import java.text.ParseException;
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
import org.armysoft.security.annotation.PermissionsAnno;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberIntellectualPro;
import com.armysoft.hzkjy.model.MemberPatent;
import com.armysoft.hzkjy.service.member.MemberBasicService;
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
	@Resource
	private MemberBasicService memberBasicService;
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
	@PermissionsAnno("patent_list")
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
	/*	String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(userNo.equals("admin")){
			List<Map<String,Object>> list=memberBasicService.getAllMember();
			model.addAttribute("list", list);
		}*/
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
	public String update(@PathVariable("id") Long key,MemberIntellectualPro entity,HttpServletRequest request, Model model) {
		/*String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(userNo.equals("admin")){
			List<Map<String,Object>> list=memberBasicService.getAllMember();
			model.addAttribute("list", list);
		}*/
		model.addAttribute("ptype", "U");
		model.addAttribute("entity",memberPatentService.findByKey(key));
		return "admin/member/MemberPatentA_U";
	}
	
	
	
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,MemberPatent entity, Model model,String ptype) {
		if(ptype.equals("U")){
			memberPatentService.update(entity);
		}else if(ptype.equals("A")){
			if(entity.getMemberNo()==null||entity.getMemberNo().isEmpty()){
				String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
				entity.setMemberNo(userNo);
			}
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
	@PermissionsAnno("pass")
	@RequestMapping("pass.html")
	@ResponseBody
	public String pass(String ids,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			Map<String, Object> params = new HashMap<String, Object>();
	    	params.put("id", idArr[id].trim());
	    	params.put("status", "1");
	    	memberPatentService.updateStatus(params);
		}

		return "";
	}
	@PermissionsAnno("rollBack")
	@RequestMapping("rollBack.html")
	@ResponseBody
	public String roolBack(String ids,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			Map<String, Object> params = new HashMap<String, Object>();
	    	params.put("id", idArr[id].trim());
	    	params.put("status", "0");
	    	memberPatentService.updateStatus(params);
		}
		
		
		return "";
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
		String title=year+"琶洲园区企业专利获得情况"+(month==0?"1~6月":"7~12月");
		List headData =  new ArrayList();
		headData.add(new Object[] { "RowNo","序号"});
		headData.add(new Object[] { "Qymc","企业"});
		headData.add(new Object[] { "Type","专利类别"});
		headData.add(new Object[] { "Name","专利名称"});
		headData.add(new Object[] { "PatentNo","专利编号"});
		//headData.add(new Object[] { "ApplyTime","获取时间"});

		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("year", year+"");
		params.put("month", month+"");
		//String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List<Map<String, Object>>  list =memberPatentService.findAll(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}
}
