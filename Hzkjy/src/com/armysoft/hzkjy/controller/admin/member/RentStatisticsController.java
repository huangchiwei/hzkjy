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
import com.armysoft.hzkjy.base.util.RentStatisticsExcel;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.EccIndicator;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.EccIndicatorService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.RentStatisticsService;


@Controller
@RequestMapping("admin/rentStatistics")
public class  RentStatisticsController extends BaseController {

	@Resource
	private RentStatisticsService service;
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
	@PermissionsAnno("zjtj_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fjjzbNy,String fssq,String ffzjgNo, String hybh1,String dwmc,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			EccIndicator entity, HttpServletRequest request) {
		if(fjjzbNy !="" && fjjzbNy !=null){
			request.setAttribute("fjjzbNy", fjjzbNy);
			}else{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");  
				java.util.Date date=new java.util.Date();  
				fjjzbNy=sdf.format(date); 
				request.setAttribute("fjjzbNy", fjjzbNy);
			}
		String Hyfl1count=service.countSslq(fjjzbNy,"1");
		List<Map<String,Object>> Hyfl1List= service.getSslqList(fjjzbNy,"1");
		
		request.setAttribute("Hyfl1count", Hyfl1count);
		request.setAttribute("Hyfl1List", Hyfl1List);
		List<Map<String,Object>> countHyfl1List= service.countSslqList(fjjzbNy,"1");
		request.setAttribute("countHyfl1List", countHyfl1List);
		
		String Hyfl2count=service.countSslq(fjjzbNy,"2");
		List<Map<String,Object>> Hyfl2List= service.getSslqList(fjjzbNy,"2");
		request.setAttribute("Hyfl2count", Hyfl2count);
		request.setAttribute("Hyfl2List", Hyfl2List);
		List<Map<String,Object>> countHyfl2List= service.countSslqList(fjjzbNy,"2");
		request.setAttribute("countHyfl2List", countHyfl2List);
		
		String Hyfl3count=service.countSslq(fjjzbNy,"3");
		List<Map<String,Object>> Hyfl3List= service.getSslqList(fjjzbNy,"3");
		request.setAttribute("Hyfl3count", Hyfl3count);
		request.setAttribute("Hyfl3List", Hyfl3List);
		List<Map<String,Object>> countHyfl3List= service.countSslqList(fjjzbNy,"3");
		request.setAttribute("countHyfl3List", countHyfl3List);
		
		String Hyfl4count=service.countSslq(fjjzbNy,"4");
		List<Map<String,Object>> Hyfl4List= service.getSslqList(fjjzbNy,"4");
		request.setAttribute("Hyfl4count", Hyfl4count);
		request.setAttribute("Hyfl4List", Hyfl4List);
		List<Map<String,Object>> countHyfl4List= service.countSslqList(fjjzbNy,"4");
		request.setAttribute("countHyfl4List", countHyfl4List);
		
		String Hyfl5count=service.countSslq(fjjzbNy,"5");
		List<Map<String,Object>> Hyfl5List= service.getSslqList(fjjzbNy,"5");
		request.setAttribute("Hyfl5count", Hyfl5count);
		request.setAttribute("Hyfl5List", Hyfl5List);
		List<Map<String,Object>> countHyfl5List= service.countSslqList(fjjzbNy,"5");
		request.setAttribute("countHyfl5List", countHyfl5List);
		
		String Hyfl6count=service.countSslq(fjjzbNy,"6");
		List<Map<String,Object>> Hyfl6List= service.getSslqList(fjjzbNy,"6");
		request.setAttribute("Hyfl6count", Hyfl6count);
		request.setAttribute("Hyfl6List", Hyfl6List);
		List<Map<String,Object>> countHyfl6List= service.countSslqList(fjjzbNy,"6");
		request.setAttribute("countHyfl6List", countHyfl6List);
		
		
		
		List<Map<String,Object>> countHyfl8List= service.countSslqList(fjjzbNy,"");
		request.setAttribute("countHyfl8List", countHyfl8List);
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
		return "admin/member/RentStatisticsQ";
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
	@PermissionsAnno("jjybtj_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,EccIndicator entity, Model model) {
		entity.setId(key);
//		Cn2Spell cn2Spell = new Cn2Spell();
//		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
//		System.out.println(entity.getId());
		service.update(entity);
		return "redirect://admin/eccIndicator/list/1.html";
	}
	@PermissionsAnno("jjybtj_save")
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
	@PermissionsAnno("jjybtj_del")
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
		String title=fjjzbNy+"月份的费用明细";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Sslq","位置"});
		headData.add(new Object[] { "Qymc","企业名称"});
		headData.add(new Object[] { "Qyzj","租金"});
		headData.add(new Object[] { "Glfwf","管理服务费/管理费/物业管理费"});
		headData.add(new Object[] { "Qysf","水费/水电公摊费"});
		headData.add(new Object[] { "Qydf","电费"});//技工贸总收入
		headData.add(new Object[] { "Zlbzj","租赁保证金"});//技工贸总收入
		headData.add(new Object[] { "Zxyj","装修押金"});//利润总额
		
		
		List headData1 =  new ArrayList();
		headData1.add(new Object[] { "sumQymc","位置"});
		headData1.add(new Object[] { "sumQyzj","租金"});
		headData1.add(new Object[] { "sumGlfwf","管理服务费/管理费/物业管理费"});
		headData1.add(new Object[] { "sumQysf","水费/水电公摊费"});
		headData1.add(new Object[] { "sumQydf","电费"});//技工贸总收入
		headData1.add(new Object[] { "sumZlbzj","租赁保证金"});//技工贸总收入
		headData1.add(new Object[] { "sumZxyj","装修押金"});//利润总额
	
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fjjzbNy",fjjzbNy);
		List Hyfl1List= service.getSslqList(fjjzbNy,"1");
		List Hyfl2List= service.getSslqList(fjjzbNy,"2");
		List Hyfl3List= service.getSslqList(fjjzbNy,"3");
		List Hyfl4List= service.getSslqList(fjjzbNy,"4");
		List Hyfl5List= service.getSslqList(fjjzbNy,"5");
		List Hyfl6List= service.getSslqList(fjjzbNy,"6");
		List Hyfl7List= service.getSslqList(fjjzbNy,"");
		List countHyfl1List= service.countSslqList(fjjzbNy,"1");
		List countHyfl2List= service.countSslqList(fjjzbNy,"2");
		List countHyfl3List= service.countSslqList(fjjzbNy,"3");
		List countHyfl4List= service.countSslqList(fjjzbNy,"4");
		List countHyfl5List= service.countSslqList(fjjzbNy,"5");
		List countHyfl6List= service.countSslqList(fjjzbNy,"6");
		List countHyfl7List= service.countSslqList(fjjzbNy,"");
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		RentStatisticsExcel exportExcel = new RentStatisticsExcel(title,title, headData,headData1);
		
		exportExcel.exportExcel_Applicant(request, response,Hyfl1List,Hyfl2List,Hyfl3List,Hyfl4List,Hyfl5List,Hyfl6List,Hyfl7List,countHyfl1List,countHyfl2List,countHyfl3List,countHyfl4List,countHyfl5List,countHyfl6List,countHyfl7List,fjjzbNy);
		
	}

}
