package com.armysoft.hzkjy.controller.admin.member;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.DbMessage;
import com.armysoft.hzkjy.model.EccIndicator;
import com.armysoft.hzkjy.model.EnterpriseRental;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.DbMessageService;
import com.armysoft.hzkjy.service.member.EccIndicatorService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/economicReporting")
public class  EconomicReportingController extends BaseController {

	@Resource
	private EccIndicatorService service;
	@Resource
	private DbMessageService dbservice;
	@Resource
	private BsNewsService Bsservice;
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
	@PermissionsAnno("jjybtb_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fjjzbNy,String fqymc,String fssq,String ffzjgNo, String hybh1,String dwmc,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			EccIndicator entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && userNo.substring(0, 4).equals("4401")){
		params.put("fhybh", userNo);
		}
		if(fjjzbNy !="" && fjjzbNy !=null){
			params.put("fjjzbNy", fjjzbNy);
			request.setAttribute("fjjzbNy", fjjzbNy);
			}
		if(fqymc !="" && fqymc !=null){
			params.put("fqymc", fqymc);
			request.setAttribute("fqymc", fqymc);
			}
//		if(ftitle !="" && ftitle !=null){
//		params.put("ftitle", ftitle);
//		request.setAttribute("ftitle", ftitle);
//		}
//		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
//		if(!userNo.equals("admin")){
//			params.put("receiverBh", userNo);
//			}
        model.addAttribute("list", service.getByPage(params, pager));
//		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/EconomicReportingQ";
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
		return "admin/member/EconomicReportingV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		request.setAttribute("userNo", userNo.substring(0, 4));
		EccIndicator mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/EconomicReportingV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= service.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}
	@RequestMapping("Plsc.html")
	@ResponseBody
	public String delete(String ids, HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		String[] idArr = ids.split(",");
		for(int id=0;id<idArr.length;id++){
			service.delete(Long.valueOf(idArr[id]));
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
	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("jjybtb_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,EccIndicator entity, Model model) {
		entity.setId(key);
//		Cn2Spell cn2Spell = new Cn2Spell();
//		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
//		System.out.println(entity.getId());
		entity.setShzt("已提交");
		service.update(entity);
		return "redirect://admin/economicReporting/list/1.html";
	}
	@PermissionsAnno("jjybtb_save")
	@RequestMapping(value = SAVE)
	public String save(EccIndicator entity, Model model) {
		if (entity.getId() == null) {
			service.insert(entity);
			
		} else {
			entity.setShzt("已提交");
			service.update(entity);
		}
		return "redirect://admin/economicReporting/list/1.html";
	}
	
	
	@PermissionsAnno("jjybtb_tg")
	@RequestMapping("Tgtz.html")
	@ResponseBody
	public String Tgtz(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EccIndicator mdd= service.findByKey(Long.valueOf(idArr[id]));
			
			Date now = new Date(); 
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
			BsNews bs=new BsNews();
			bs.setCreater(userNo);
			GregorianCalendar gcNew=new GregorianCalendar();
		    gcNew.set(Calendar.MONTH, gcNew.get(Calendar.MONTH)+1);
		    Date dtFrom=gcNew.getTime();
			bs.setCreateTime(now);
			bs.setTitle("经济月报审核通过通知");
			bs.setActiveTime(dtFrom);
			bs.setIseveryone("0");
			bs.setReceiver(mdd.getRzqy());
			bs.setReceiverBh(mdd.getHybh());
			bs.setIsReport("1");
			DbMessage dbmessage=dbservice.findByKey(Long.valueOf(3));
			String content=dbmessage.getMessage();
			bs.setContent(content);
			Bsservice.insert(bs);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	@PermissionsAnno("jjybtb_btg")
	@RequestMapping("Btgtz.html")
	@ResponseBody
	public String Btgtz(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EccIndicator mdd= service.findByKey(Long.valueOf(idArr[id]));
			
			Date now = new Date(); 
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
			BsNews bs=new BsNews();
			bs.setCreater(userNo);
			GregorianCalendar gcNew=new GregorianCalendar();
		    gcNew.set(Calendar.MONTH, gcNew.get(Calendar.MONTH)+1);
		    Date dtFrom=gcNew.getTime();
			bs.setCreateTime(now);
			bs.setTitle("经济月报审核不通过通知");
			bs.setActiveTime(dtFrom);
			bs.setIseveryone("0");
			bs.setReceiver(mdd.getRzqy());
			bs.setReceiverBh(mdd.getHybh());
			bs.setIsReport("1");
			DbMessage dbmessage=dbservice.findByKey(Long.valueOf(4));
			String content=dbmessage.getMessage();
			bs.setContent(content);
			Bsservice.insert(bs);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("jjybtb_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/economicReporting/list/1.html";
	}
	
	
	@RequestMapping(value = "/Zind.html")
	public String Zind(HttpServletRequest request) {
		return "admin/member/MemberBasicZ";
	}
	
	@RequestMapping(value = "/Find.html")
	public String Find(HttpServletRequest request) {
		return "admin/member/MemberBasicF";
	}
	
	
	@RequestMapping("ZShtt.html")
	@ResponseBody
	public String ZShtt(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EccIndicator mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("已提交");
			service.update(mdd);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	
	@PermissionsAnno("jjybtb_sh")
	@RequestMapping("ZShtg.html")
	@ResponseBody
	public String ZShtg(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EccIndicator mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("已审核");
			service.update(mdd);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	@PermissionsAnno("jjybtb_th")
	@RequestMapping("ZShth.html")
	@ResponseBody
	public String ZShth(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EccIndicator mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("退回");
			service.update(mdd);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
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
