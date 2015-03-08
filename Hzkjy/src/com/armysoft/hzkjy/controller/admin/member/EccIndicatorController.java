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
import com.armysoft.hzkjy.base.util.ExportExcel2;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.EccIndicator;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.EccIndicatorService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/eccIndicator")
public class  EccIndicatorController extends BaseController {

	@Resource
	private EccIndicatorService service;
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
	public String getByPage(@PathVariable Integer currentPage,String fjjzbNy,String fssq,String ffzjgNo, String hybh1,String dwmc,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			EccIndicator entity, HttpServletRequest request) {
		if(fjjzbNy !="" && fjjzbNy !=null){
			request.setAttribute("fjjzbNy", fjjzbNy);
			}else{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");  
				java.util.Date date=new java.util.Date();  
				fjjzbNy=sdf.format(date); 
			}
		String Hyfl1count=service.countHyfl(fjjzbNy,"1");
		List<Map<String,Object>> Hyfl1List= service.getHyflList(fjjzbNy,"1");
		
		request.setAttribute("Hyfl1count", Hyfl1count);
		request.setAttribute("Hyfl1List", Hyfl1List);
		List<Map<String,Object>> countHyfl1List= service.countHyflList(fjjzbNy,"1");
		request.setAttribute("countHyfl1List", countHyfl1List);
		
		String Hyfl2count=service.countHyfl(fjjzbNy,"2");
		List<Map<String,Object>> Hyfl2List= service.getHyflList(fjjzbNy,"2");
		request.setAttribute("Hyfl2count", Hyfl2count);
		request.setAttribute("Hyfl2List", Hyfl2List);
		List<Map<String,Object>> countHyfl2List= service.countHyflList(fjjzbNy,"2");
		request.setAttribute("countHyfl2List", countHyfl2List);
		
		String Hyfl3count=service.countHyfl(fjjzbNy,"3");
		List<Map<String,Object>> Hyfl3List= service.getHyflList(fjjzbNy,"3");
		request.setAttribute("Hyfl3count", Hyfl3count);
		request.setAttribute("Hyfl3List", Hyfl3List);
		List<Map<String,Object>> countHyfl3List= service.countHyflList(fjjzbNy,"3");
		request.setAttribute("countHyfl3List", countHyfl3List);
		
		String Hyfl4count=service.countHyfl(fjjzbNy,"4");
		List<Map<String,Object>> Hyfl4List= service.getHyflList(fjjzbNy,"4");
		request.setAttribute("Hyfl4count", Hyfl4count);
		request.setAttribute("Hyfl4List", Hyfl4List);
		List<Map<String,Object>> countHyfl4List= service.countHyflList(fjjzbNy,"4");
		request.setAttribute("countHyfl4List", countHyfl4List);
		
		String Hyfl5count=service.countHyfl(fjjzbNy,"5");
		List<Map<String,Object>> Hyfl5List= service.getHyflList(fjjzbNy,"5");
		request.setAttribute("Hyfl5count", Hyfl5count);
		request.setAttribute("Hyfl5List", Hyfl5List);
		List<Map<String,Object>> countHyfl5List= service.countHyflList(fjjzbNy,"5");
		request.setAttribute("countHyfl5List", countHyfl5List);
		
		String Hyfl6count=service.countHyfl(fjjzbNy,"6");
		List<Map<String,Object>> Hyfl6List= service.getHyflList(fjjzbNy,"6");
		request.setAttribute("Hyfl6count", Hyfl6count);
		request.setAttribute("Hyfl6List", Hyfl6List);
		List<Map<String,Object>> countHyfl6List= service.countHyflList(fjjzbNy,"6");
		request.setAttribute("countHyfl6List", countHyfl6List);
		
//		if(ftitle !="" && ftitle !=null){
//		params.put("ftitle", ftitle);
//		request.setAttribute("ftitle", ftitle);
//		}
//		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
//		if(!userNo.equals("admin")){
//			params.put("receiverBh", userNo);
//			}
//        model.addAttribute("list", service.getByPage(params, pager));
////		request.setAttribute("zj",service.getCount(params));
//		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/EccIndicatorQ";
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
		return "admin/member/EccIndicatorV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		EccIndicator mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/EccIndicatorV";
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
	public String update(@PathVariable("id") Integer key,EccIndicator entity, Model model) {
		entity.setId(key);
//		Cn2Spell cn2Spell = new Cn2Spell();
//		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
//		System.out.println(entity.getId());
		service.update(entity);
		return "redirect://admin/eccIndicator/list/1.html";
	}
	@PermissionsAnno("hy_save")
	@RequestMapping(value = SAVE)
	public String save(EccIndicator entity, Model model) {
		if (entity.getId() == null) {
			service.insert(entity);
			
		} else {
			service.update(entity);
		}
		return "redirect://admin/eccIndicator/list/1.html";
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
		return "redirect://admin/eccIndicator/list/1.html";
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
	public void OutPtqfqk(Model model,String fjjzbNy,HttpServletRequest request,HttpServletResponse response) {
		String title="广州市海珠区科技产业基地入驻企业经济指标月报表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "HyflName","行业分类"});
		headData.add(new Object[] { "Hybh","编号"});
		headData.add(new Object[] { "Rzqy","入驻企业"});
		headData.add(new Object[] { "Zczj","注册资金(万元)"});
		headData.add(new Object[] { "JgmzsrBys","本月数"});//技工贸总收入
		headData.add(new Object[] { "JgmzsrLjs","累计数"});//技工贸总收入
		headData.add(new Object[] { "LrzeBys","本月数"});//利润总额
		headData.add(new Object[] { "LrzeLjs","累计数"});//利润总额<td>${mb.NsBys}</td>    
		headData.add(new Object[] { "NsBys","本月数"});//纳税
		headData.add(new Object[] { "NsLjs","累计数"});//纳税
		headData.add(new Object[] { "LszeBys","本月数"});//纳税
		headData.add(new Object[] { "LszeLjs","累计数"});//纳税
		headData.add(new Object[] { "Ch","创汇"});//创汇
		headData.add(new Object[] { "Zgs","职工数"});//职工数
		headData.add(new Object[] { "Yfjf","研发经费"});//职工数
		headData.add(new Object[] { "Gxjscpsr","高新技术产品收入"});//高新技术产品收入
		headData.add(new Object[] { "Gyzcz","工业总产值"});//工业总产值
		headData.add(new Object[] { "Gyzjz","工业增加值"});//工业增加值
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fjjzbNy",fjjzbNy);
		List Hyfl1List= service.getHyflList(fjjzbNy,"1");
		List Hyfl2List= service.getHyflList(fjjzbNy,"2");
		List Hyfl3List= service.getHyflList(fjjzbNy,"3");
		List Hyfl4List= service.getHyflList(fjjzbNy,"4");
		List Hyfl5List= service.getHyflList(fjjzbNy,"5");
		List Hyfl6List= service.getHyflList(fjjzbNy,"6");
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
         ExportExcel2 exportExcel = new ExportExcel2(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,Hyfl1List,Hyfl2List,Hyfl3List,Hyfl4List,Hyfl5List,Hyfl6List,fjjzbNy);
		
	}

}
