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

import com.alibaba.fastjson.JSONObject;
import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.IncubatedEnterprises;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.service.member.IncubatedEnterprisesService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/incubatedEnterprises")
public class  IncubatedEnterprisesController extends BaseController {

	@Resource
	private IncubatedEnterprisesService service;
	@Resource
	private MemberBasicService  mbservice;
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
	@PermissionsAnno("fhqytb_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fqymc,String fssn,String frysje, String fhtqxf,String fhtqxe,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			IncubatedEnterprises entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && userNo.substring(0, 4).equals("4401")){
			MemberBasic mb=mbservice.findByHybh(userNo);
			params.put("fqqymc", mb.getQymc());
			
			}
		if(fssn !="" && fssn !=null){
			params.put("fssn", fssn);
			request.setAttribute("fssn", fssn);
			}
		if(fqymc!="" && fqymc!=null){
			params.put("fqymc",fqymc);
			request.setAttribute("fqymc", fqymc);
			}
        model.addAttribute("list", service.getByPage(params, pager));
		request.setAttribute("zj",service.getCount(params));
		request.setAttribute("userNo", userNo.substring(0, 4));
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
	@RequestMapping("pass.html")
	@ResponseBody
	public String ZShtg(String ids,String examineTime,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		JSONObject jsonObject = new JSONObject();
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			IncubatedEnterprises mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("已审核");
			service.update(mdd);
		}
		
		jsonObject.put("exl","ok");
		 response.setContentType("text/html;charset=UTF-8");   
		 try {
			response.getWriter().print(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
	
	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		IncubatedEnterprises mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}else{
			
			if(userNo !="" && userNo !=null && userNo.substring(0, 4).equals("4401")){
				MemberBasic mc=mbservice.findByHybh(userNo);
				model.addAttribute("mc", mc);
				}
		}
		request.setAttribute("userNo", userNo.substring(0, 4));
		return "admin/member/IncubatedEnterprisesV";
	}
	
	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getSqsj.html")
	@ResponseBody
	public  String getSqsj(HttpServletRequest request,HttpServletResponse response) {
		String hybh = request.getParameter("hybh");
		String ssn = request.getParameter("ssn");
		Integer nyear;
		Integer nmonth;
		String nym;
		JSONObject jsonObject = new JSONObject();
		if(Integer.valueOf(ssn)<=2016){
			MemberBasic mb=mbservice.findByHybh(hybh);
			jsonObject.put("zzjgdm",mb.getZzjgdm());
			jsonObject.put("frdb",mb.getFrdb());
			jsonObject.put("zczb",mb.getZczb());
			jsonObject.put("qyclsj",mb.getQyclsj());
			jsonObject.put("qyrzsj",mb.getQyrzsj());
			jsonObject.put("lxr",mb.getLxr());
			jsonObject.put("lxrlxdh",mb.getLxrdh());
			jsonObject.put("qydjzclx",mb.getQydjzclx());
			jsonObject.put("frlxdh",mb.getFrlxdh());
			
			jsonObject.put("htstze",mb.getHtstze());
			jsonObject.put("dzys",mb.getDzys());
			jsonObject.put("xnyjdxs",mb.getXnyjdxs());
			jsonObject.put("qyssjsly",mb.getQyssjsly());
			jsonObject.put("hylb",mb.getHylb());
			jsonObject.put("gxjsqy",mb.getGxjsqy());
			jsonObject.put("lxryqy",mb.getLxryqy());
			jsonObject.put("fmzl",mb.getFmzl());
			jsonObject.put("wgsj",mb.getWgsj());
			jsonObject.put("syxx",mb.getSyxx());
			jsonObject.put("rjzzq",mb.getRjzzq());
			
			
		}else{
			IncubatedEnterprises ie=service.findIeHybh(hybh, String.valueOf(Integer.valueOf(ssn)-1));
			jsonObject.put("zzjgdm",ie.getZzjgdm());
			jsonObject.put("frdb",ie.getFrdb());
			jsonObject.put("zczb",ie.getZczb());
			jsonObject.put("qyclsj",ie.getQyclsj());
			jsonObject.put("qyrzsj",ie.getQyrzsj());
			jsonObject.put("lxr",ie.getLxr());
			jsonObject.put("lxrlxdh",ie.getLxrlxdh());
			jsonObject.put("frlxdh",ie.getFrlxdh());
			jsonObject.put("qydjzclx",ie.getQydjzclx());
			
			
			jsonObject.put("htstze",ie.getHtstze());
			jsonObject.put("dzys",ie.getDzys());
			jsonObject.put("xnyjdxs",ie.getXnyjdxs());
			jsonObject.put("qyssjsly",ie.getQyssjsly());
			jsonObject.put("hylb",ie.getHylb());
			jsonObject.put("gxjsqy",ie.getGxjsqy());
			jsonObject.put("lxryqy",ie.getLxryqy());
			jsonObject.put("fmzl",ie.getFmzl());
			jsonObject.put("wgsj",ie.getWgsj());
			jsonObject.put("syxx",ie.getSyxx());
			jsonObject.put("rjzzq",ie.getRjzzq());
		}
		
		
		
		 response.setContentType("text/html;charset=UTF-8");   
		 try {
			response.getWriter().print(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}

	
	@PermissionsAnno("fhqytb_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,IncubatedEnterprises entity, Model model) {
		entity.setId(key);
		service.update(entity);
		return "redirect://admin/incubatedEnterprises/list/1.html";
	}
	@PermissionsAnno("fhqytb_save")
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
	@PermissionsAnno("fhqytb_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/incubatedEnterprises/list/1.html";
	}
	
	
	
	
	@RequestMapping("/outPtqfqk/1.html")
	public void OutPtqfqk(Model model,String fqymc,String fssn,String frysje, String fhtqxf,String fhtqxe,HttpServletRequest request,HttpServletResponse response) {
		String title="科技企业孵化器在孵企业情况表";
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
		params.put("fssn", fssn);
		params.put("fqymc",fqymc);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
