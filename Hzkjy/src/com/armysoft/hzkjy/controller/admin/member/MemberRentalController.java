package com.armysoft.hzkjy.controller.admin.member;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
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
import com.armysoft.hzkjy.base.util.NumberToCN;
import com.armysoft.hzkjy.model.EnterpriseRental;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.MemberRentalService;

import com.alibaba.fastjson.JSONObject;
@Controller
@RequestMapping("admin/memberRental")
public class  MemberRentalController extends BaseController {

	@Resource
	private MemberRentalService service;
	@Resource
	private MemberBasicService Mbservice;
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
	@PermissionsAnno("zjlr_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model,String fhymc,String fjfyd,
			MemberRental entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		if(fhymc !="" && fhymc !=null){
		params.put("fhymc", fhymc);
		request.setAttribute("fhymc", fhymc);
		}
		if(fjfyd !="" && fjfyd !=null){
			params.put("fjfyd", fjfyd);
			request.setAttribute("fjfyd", fjfyd);
			}
		
        model.addAttribute("list", service.getByPage(params, pager));
		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/MemberRentalQ";
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
		return "admin/member/MemberRentalV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		MemberRental mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/MemberRentalV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= Mbservice.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}
	
	@RequestMapping(value = "/getQyxx.html")
	@ResponseBody
	public  String getQyxx(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		String qymc = URLDecoder.decode(request.getParameter("qymc"), "utf-8");
		 List QyxxList= Mbservice.getQyxx(qymc);
		 Map map =  new  HashMap(); 
		 JSONObject jsonObject = new JSONObject();
		 if(QyxxList.get(0)!=null){
		 map=(Map) QyxxList.get(0);
	    System.out.print(map.get("mj"));
		jsonObject.put("mj", map.get("mj"));
		jsonObject.put("hybh", map.get("hybh"));
		jsonObject.put("zydy", map.get("zydy"));
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
	
	@RequestMapping(value = "/getHjje.html")
	@ResponseBody
	public  String getHjjezw(HttpServletRequest request,HttpServletResponse response) {
		String hjje = request.getParameter("hjje");
		
		 double money = Double.valueOf(hjje);
	        BigDecimal numberOfMoney = new BigDecimal(money);
	       String s = NumberToCN.number2CNMontrayUnit(numberOfMoney);
		 JSONObject jsonObject = new JSONObject();
		jsonObject.put("hjjezw",s );
		 response.setContentType("text/html;charset=UTF-8");   
		 try {
			response.getWriter().print(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
	
	@RequestMapping(value = "/getSqsj.html")
	@ResponseBody
	public  String getSqsj(HttpServletRequest request,HttpServletResponse response) {
		String hybh = request.getParameter("hybh");
		String jfyd = request.getParameter("jfyd");
		Integer nyear;
		Integer nmonth;
		String nym;
		System.out.println(jfyd.substring(5, 7));
		if(jfyd.substring(5, 7).equals("01")){
			nyear=Integer.valueOf(jfyd.substring(0, 4))-1;
			nmonth=12;
			nym=String.valueOf(nyear)+"-"+String.valueOf(nmonth);
		}else{
			nyear=Integer.valueOf(jfyd.substring(0, 4));
			nmonth=Integer.valueOf(jfyd.substring(5, 7))-1;
			if(nmonth<10){
				nym=String.valueOf(nyear)+"-0"+String.valueOf(nmonth);
			}else{
				nym=String.valueOf(nyear)+"-"+String.valueOf(nmonth);
			}
			
		}
		MemberRental mr=service.findByBhny(hybh, nym);
		JSONObject jsonObject = new JSONObject();
		if(mr!=null){
			jsonObject.put("qyzj",mr.getQyzj());
			jsonObject.put("qyzjdj",mr.getQyzjdj());
			jsonObject.put("zjsq",mr.getZjsq());
			jsonObject.put("qyzjznj",mr.getQyzjznj());
			jsonObject.put("zjbz",mr.getZjbz());
			
			
			
			
			jsonObject.put("glfwf",mr.getGlfwf());
			jsonObject.put("glfwfdj",mr.getGlfwfdj());
			jsonObject.put("glfsq",mr.getGlfsq());
			jsonObject.put("glfwfznj",mr.getGlfwfznj());
			jsonObject.put("glfbz",mr.getGlfbz());
			
			
			
			
			jsonObject.put("zlbzj",mr.getZlbzj());
			jsonObject.put("zlbzjdj",mr.getZlbzjdj());
			jsonObject.put("zlbzjsq",mr.getZlbzjsq());
			jsonObject.put("zlbzjznj",mr.getZlbzjznj());
			jsonObject.put("zlbzjbz",mr.getZlbzjbz());
			
			
			
			
			jsonObject.put("zxyj",mr.getZxyj());
			jsonObject.put("zxyjdj",mr.getZxyjdj());
			jsonObject.put("zxyjsq",mr.getZxyjsq());
			jsonObject.put("zxyjznj",mr.getZxyjznj());
			jsonObject.put("zxyjbz",mr.getZxyjbz());
			
			jsonObject.put("sfsq",mr.getSfsq());
			jsonObject.put("dfsq",mr.getDfsq());
			
			
			jsonObject.put("qysfdj",mr.getQysfdj());
			jsonObject.put("qydfdj",mr.getQydfdj());
			jsonObject.put("dsyhd",mr.getDhjyl());
			jsonObject.put("ssyhd",mr.getShjyl());
			
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

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("zjlr_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberRental entity, Model model) {
		entity.setId(key);
		service.update(entity);
		return "redirect://admin/memberRental/list/1.html";
	}
	@PermissionsAnno("zjlr_save")
	@RequestMapping(value = SAVE)
	public String save(MemberRental entity, Model model) {
		if (entity.getId() == null) {
			entity.setShzt("未提交");
			entity.setFbzt("未发布");
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect://admin/memberRental/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("zjlr_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/memberRental/list/1.html";
	}
	
//	@RequestMapping(value = "/ZShtg.html")
//	@ResponseBody
//	public String ZShtg(Long id,String examineTime,HttpServletRequest request) throws ParseException {
//		MemberRental mdd= service.findByKey(id);
//        mdd.setShzt("已提交");
//		service.update(mdd);
//		request.setAttribute("exl", "ok");
//		String exl="ok";
//		return exl;
//	}
	@RequestMapping("ZShtg.html")
	@ResponseBody
	public String ZShtg(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			MemberRental mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("已提交");
			service.update(mdd);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	
	@RequestMapping(value = "/Sh.html")
	public String Sh(Long id,HttpServletRequest request) {
		request.setAttribute("id", id);
		return  "admin/member/MemberRentalS";
	}
	@RequestMapping(value = "/Shsj.html")
	public String Shsj(Long id,String bz,HttpServletRequest request) {
		request.setAttribute("id", id);
		
		MemberRental mdd= service.findByKey(id);
		mdd.setBz(bz);
		mdd.setShzt("退回");
		service.update(mdd);
		request.setAttribute("exl", "ok");
		return  "admin/member/MemberRentalS";
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
	public void OutPtqfqk(Model model,String fhymc,String fjfyd,HttpServletRequest request,HttpServletResponse response) {
		String title="缴费表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Hybh","企业编号"});
		headData.add(new Object[] { "Qymc","企业名称"});
		headData.add(new Object[] { "Qyzj","企业租金"});
		headData.add(new Object[] { "Glfwf","管理服务费"});
		headData.add(new Object[] { "Qysf","企业水费"});
		headData.add(new Object[] { "Qydf","企业电费"});
		headData.add(new Object[] { "Ssyhd","水上月行度"});
		headData.add(new Object[] { "Sbyhd","水本月行度"});
		headData.add(new Object[] { "Shjyl","水合计用量"});
		headData.add(new Object[] { "Dhjyl","电合计用量"});
		headData.add(new Object[] { "Qymj","企业面积"});
		headData.add(new Object[] { "Qtfy","其它费用"});
		headData.add(new Object[] { "Hjje","合计金额"});
		headData.add(new Object[] { "Jfyd","缴费月度"});
		headData.add(new Object[] { "Dsyhd","电上月行度"});
		headData.add(new Object[] { "Dbyhd","电本月行度"});
		headData.add(new Object[] { "Zydy","租用单元"});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		params.put("fjfyd", fjfyd);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
