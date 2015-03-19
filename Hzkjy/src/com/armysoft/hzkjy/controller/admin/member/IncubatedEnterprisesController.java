package com.armysoft.hzkjy.controller.admin.member;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.armysoft.security.annotation.PermissionsAnno;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.IncubatedEnterprises;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.IncubatedEnterprisesService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/incubatedEnterprises")
public class  IncubatedEnterprisesController extends BaseController {

	@Resource
	private IncubatedEnterprisesService service;
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
	@PermissionsAnno("mb_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			IncubatedEnterprises entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && !userNo.equals("admin")){
		params.put("fhybh", userNo);
		}
		if(fhymc !="" && fhymc !=null){
		params.put("fhymc", fhymc);
		request.setAttribute("fhymc", fhymc);
		}
		if(frysjf !="" && frysjf !=null){
			params.put("frysjf", frysjf);
			request.setAttribute("frysjf", frysjf);
			}
		if(frysje !="" && frysje !=null){
			params.put("frysje", frysje);
			request.setAttribute("frysje", frysje);
			}
		if(fhtqxf !="" && fhtqxf !=null){
			params.put("fhtqxf", fhtqxf);
			request.setAttribute("fhtqxf", fhtqxf);
			}
		if(fhtqxe !="" && fhtqxe !=null){
			params.put("fhtqxe", fhtqxe);
			request.setAttribute("fhtqxe", fhtqxe);
			}
        model.addAttribute("list", service.getByPage(params, pager));
		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/IncubatedEnterprisesQ";
	}

	/**
	 * 详情/准备修改
	 * @param key
	 * @param model
	 * @return
	 */
	@RequestMapping(value = DETAIL)
	public String detail(@PathVariable("id") Long key, Model model,HttpServletRequest request) {
		model.addAttribute("model", service.findByKey(key));
		return "admin/member/IncubatedEnterprisesV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		IncubatedEnterprises mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/IncubatedEnterprisesV";
	}
	
	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("mb_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,IncubatedEnterprises entity, Model model) {
		entity.setId(key);
		service.update(entity);
		return "redirect://admin/incubatedEnterprises/list/1.html";
	}
	@PermissionsAnno("mb_save")
	@RequestMapping(value = SAVE)
	public String save(IncubatedEnterprises entity, Model model) {
		if (entity.getId() == null) {
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect://admin/incubatedEnterprises/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("mb_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/incubatedEnterprises/list/1.html";
	}
	
	
	
	
	@RequestMapping("/outPtqfqk/1.html")
	public void OutPtqfqk(Model model,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,HttpServletRequest request,HttpServletResponse response) {
		String title="园区基本资料表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Hybh","企业编号"});
		headData.add(new Object[] { "Qymc","企业名称"});
		headData.add(new Object[] { "Address","地址"});
		headData.add(new Object[] { "Zydy","租用单位"});
		headData.add(new Object[] { "Mj","面积"});
		headData.add(new Object[] { "Fzr","负责人"});
		headData.add(new Object[] { "Zczj","注册资金"});
		headData.add(new Object[] { "Lxr","联系人"});
		headData.add(new Object[] { "ZtName","在园出园状态"});
		headData.add(new Object[] { "Rysj","入园时间"});
		headData.add(new Object[] { "Htqxf","合同期限至"});
		headData.add(new Object[] { "Htqxe","合同期限"});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		params.put("frysjf", frysjf);
		params.put("frysje", frysje);
		params.put("fhtqxf", fhtqxf);
		params.put("fhtqxe", fhtqxe);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
