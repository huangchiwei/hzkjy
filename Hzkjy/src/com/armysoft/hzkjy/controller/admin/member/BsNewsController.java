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
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/bsNews")
public class  BsNewsController extends BaseController {

	@Resource
	private BsNewsService service;
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
	@PermissionsAnno("hy_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fhymc,String fssq,String ffzjgNo, String hybh1,String dwmc,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			BsNews entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
//		if(fhymc !="" && fhymc !=null){
//		params.put("fhymc", fhymc);
//		request.setAttribute("fhymc", fhymc);
//		}
        model.addAttribute("list", service.getByPage(params, pager));
//		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/BsNewsQ";
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
		return "admin/member/BsNewsV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		BsNews mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/BsNewsV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= service.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("hy_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,BsNews entity, Model model) {
		entity.setId(key);
//		Cn2Spell cn2Spell = new Cn2Spell();
//		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
//		System.out.println(entity.getId());
		service.update(entity);
		return "redirect://admin/bsNews/list/1.html";
	}
	@PermissionsAnno("hy_save")
	@RequestMapping(value = SAVE)
	public String save(BsNews entity, Model model) {
		if (entity.getId() == null) {
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect://admin/bsNews/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("hy_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/bsNews/list/1.html";
	}
	
	
	@RequestMapping(value = "/Zind.html")
	public String Zind(HttpServletRequest request) {
		return "admin/member/MemberBasicZ";
	}
	
	@RequestMapping(value = "/Find.html")
	public String Find(HttpServletRequest request) {
		return "admin/member/MemberBasicF";
	}
	
//	@RequestMapping(value = "/inputExport.html")
//	public String  OutPtqfqk(@RequestParam MultipartFile exlFile, String  nd1,String nd, HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException {
//	        InputStream fis = exlFile.getInputStream();
//	        //得到解析Excel的实体集合  
//	        List<MemberBasic> infos = ImportExcel.importMemberBasic(fis);  
//	        
//	        //遍历解析Excel的实体集合  
//	        for(MemberBasic info:infos) {  
//	            //判断员工编号是否存在(存在：做修改操作；不存在：做新增操作)  
//	        	   String newHybh="";
//	        	   String newHybh1="44";
//	        	   String newHybh2="01";
//	                
//	               Integer countI= service.CountHybh(newHybh1,newHybh2);
//	               if(countI == 0){
//	            	   newHybh=newHybh1+newHybh2+"00001";
//	            	   info.setHybh(newHybh);
//	               }else{
//	              MemberBasic entity= service.findByNewHybh(newHybh1, newHybh2);
//	               Long newbh= Long.parseLong(entity.getHybh());
//					newbh=newbh+1;
//					info.setHybh(newbh.toString());
//	               }
//	               
//	               if(info.getZt().equals("在园")){
//	            	   info.setZt("1");
//	               }else{
//	            	   info.setZt("0");
//	               }
//	               
//	               Cn2Spell cn2Spell = new Cn2Spell();
//					info.setQymcpy(cn2Spell.converterToFirstSpell(info.getQymc().replace("(","").replace("）","").replace("（","").replace(")","")));
//	        	service.insert(info);
//	        }  
//	        request.setAttribute("exl", "ok");
//	        return "admin/member/MemberBasicF";
//		
//	}
	
	
	@RequestMapping("/outPtqfqk/1.html")
	public void OutPtqfqk(Model model,String fhymc,HttpServletRequest request,HttpServletResponse response) {
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
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
