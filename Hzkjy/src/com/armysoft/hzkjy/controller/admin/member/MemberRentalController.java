package com.armysoft.hzkjy.controller.admin.member;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
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
import com.armysoft.hzkjy.service.member.EnterpriseRentalService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.MemberRentalService;

import com.alibaba.fastjson.JSONObject;
@Controller
@RequestMapping("admin/memberRental")
public class  MemberRentalController extends BaseController {
	@Resource
	private EnterpriseRentalService Erservice;
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
	public String getByPage(@PathVariable Integer currentPage,Model model,String fhymc,String fjfyd,String fsslq,
			MemberRental entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		pager.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		if(fhymc !="" && fhymc !=null){
		params.put("fhymc", fhymc);
		request.setAttribute("fhymc", fhymc);
		}
		if(fjfyd !="" && fjfyd !=null){
			params.put("fjfyd", fjfyd);
			request.setAttribute("fjfyd", fjfyd);
			}
		if(fsslq !="" && fsslq !=null){
			params.put("fsslq", fsslq);
			request.setAttribute("fsslq", fsslq);
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
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		request.setAttribute("userNo", userNo.substring(0, 4));
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
			
			String[] zjsqallf=mr.getZjsq().substring(0, 8).split("/");
			String[] zjsqalle=mr.getZjsq().substring(9, 17).split("/");
			String newzjsqy="";
			String newzjsqn="";
			String newzjsq="";
			String newzjsqallf="";
			String newzjsqalle="";
			String newzjsqallf1="";
			String newzjsqalle1="";
			String[] zjsqdall;
			if(zjsqallf!=null){
				newzjsqallf="20"+zjsqallf[0].toString()+"-"+zjsqallf[1].toString()+"-"+zjsqallf[2].toString();
				newzjsqalle="20"+zjsqalle[0].toString()+"-"+zjsqalle[1].toString()+"-"+zjsqalle[2].toString();
				newzjsqallf1=GetSysDate("yyyy-MM-dd",  newzjsqallf,   0,   1,   0);
				newzjsqalle1=GetSysDate("yyyy-MM-dd",   newzjsqalle,   0,   1,   0);
				newzjsq=newzjsqallf1.substring(2, 4)+"/"+newzjsqallf1.substring(5,7)+"/"+newzjsqallf1.substring(8,10)+"~"
				+newzjsqalle1.substring(2, 4)+"/"+newzjsqalle1.substring(5,7)+"/"+newzjsqalle1.substring(8,10);
				jsonObject.put("zjsq",newzjsq);
			}
			
			jsonObject.put("qyzjznj",mr.getQyzjznj());
			jsonObject.put("zjbz",mr.getZjbz());
			
			
			
			
			jsonObject.put("glfwf",mr.getGlfwf());
			jsonObject.put("glfwfdj",mr.getGlfwfdj());
			
			String[] glfsqallf=mr.getGlfsq().substring(0, 8).split("/");
			String[] glfsqalle=mr.getGlfsq().substring(9, 17).split("/");
			String newglfsqy="";
			String newglfsqn="";
			String newglfsq="";
			String newqlfsqallf="";
			String newqlfsqalle="";
			String newqlfsqallf1="";
			String newqlfsqalle1="";
			String[] glfsqdall;
			if(glfsqallf!=null){
				newqlfsqallf="20"+glfsqallf[0].toString()+"-"+glfsqallf[1].toString()+"-"+glfsqallf[2].toString();
				newqlfsqalle="20"+glfsqalle[0].toString()+"-"+glfsqalle[1].toString()+"-"+glfsqalle[2].toString();
				newqlfsqallf1=GetSysDate("yyyy-MM-dd",  newqlfsqallf,   0,   1,   0);
				newqlfsqalle1=GetSysDate("yyyy-MM-dd",   newqlfsqalle,   0,   1,   0);
				newglfsq=newqlfsqallf1.substring(2, 4)+"/"+newqlfsqallf1.substring(5,7)+"/"+newqlfsqallf1.substring(8,10)+"~"
				+newqlfsqalle1.substring(2, 4)+"/"+newqlfsqalle1.substring(5,7)+"/"+newqlfsqalle1.substring(8,10);
				jsonObject.put("glfsq",newglfsq);
			}
			
			jsonObject.put("glfwfznj",mr.getGlfwfznj());
			jsonObject.put("glfbz",mr.getGlfbz());
			
			
			
			
			jsonObject.put("zlbzj",mr.getZlbzj());
			jsonObject.put("zlbzjdj",mr.getZlbzjdj());
			
			String[] zlbzjsqallf=mr.getZlbzjsq().substring(0, 8).split("/");
			String[] zlbzjsqalle=mr.getZlbzjsq().substring(9, 17).split("/");
			String newzlbzjsq="";
			String newzlbzjsqallf="";
			String newzlbzjsqalle="";
			String newzlbzjsqallf1="";
			String newzlbzjsqalle1="";
			if(zlbzjsqallf!=null){
				newzlbzjsqallf="20"+zlbzjsqallf[0].toString()+"-"+zlbzjsqallf[1].toString()+"-"+zlbzjsqallf[2].toString();
				newzlbzjsqalle="20"+zlbzjsqalle[0].toString()+"-"+zlbzjsqalle[1].toString()+"-"+zlbzjsqalle[2].toString();
				newzlbzjsqallf1=GetSysDate("yyyy-MM-dd",  newzlbzjsqallf,   0,   1,   0);
				newzlbzjsqalle1=GetSysDate("yyyy-MM-dd",   newzlbzjsqalle,   0,   1,   0);
				newzlbzjsq=newzlbzjsqallf1.substring(2, 4)+"/"+newzlbzjsqallf1.substring(5,7)+"/"+newzlbzjsqallf1.substring(8,10)+"~"
				+newzlbzjsqalle1.substring(2, 4)+"/"+newzlbzjsqalle1.substring(5,7)+"/"+newzlbzjsqalle1.substring(8,10);
				jsonObject.put("zlbzjsq",newzlbzjsq);
			}
			jsonObject.put("zlbzjznj",mr.getZlbzjznj());
			jsonObject.put("zlbzjbz",mr.getZlbzjbz());
			
			
			
			
			jsonObject.put("zxyj",mr.getZxyj());
			jsonObject.put("zxyjdj",mr.getZxyjdj());
			jsonObject.put("zxyjsq",mr.getZxyjsq());
			
			String[] zxyjsqallf=mr.getZxyjsq().substring(0, 8).split("/");
			String[] zxyjsqalle=mr.getZxyjsq().substring(9, 17).split("/");
			String newzxyjsq="";
			String newzxyjsqallf="";
			String newzxyjsqalle="";
			String newzxyjsqallf1="";
			String newzxyjsqalle1="";
			if(zxyjsqallf!=null){
				newzxyjsqallf="20"+zxyjsqallf[0].toString()+"-"+zxyjsqallf[1].toString()+"-"+zxyjsqallf[2].toString();
				newzxyjsqalle="20"+zxyjsqalle[0].toString()+"-"+zxyjsqalle[1].toString()+"-"+zxyjsqalle[2].toString();
				newzxyjsqallf1=GetSysDate("yyyy-MM-dd",  newzxyjsqallf,   0,   1,   0);
				newzxyjsqalle1=GetSysDate("yyyy-MM-dd",   newzxyjsqalle,   0,   1,   0);
				newzxyjsq=newzxyjsqallf1.substring(2, 4)+"/"+newzxyjsqallf1.substring(5,7)+"/"+newzxyjsqallf1.substring(8,10)+"~"
				+newzxyjsqalle1.substring(2, 4)+"/"+newzxyjsqalle1.substring(5,7)+"/"+newzxyjsqalle1.substring(8,10);
				jsonObject.put("zxyjsq",newzxyjsq);
			}
			jsonObject.put("zxyjznj",mr.getZxyjznj());
			jsonObject.put("zxyjbz",mr.getZxyjbz());
			
			String[] sfsqsqallf=mr.getSfsq().substring(0, 8).split("/");
			String[] sfsqsqalle=mr.getSfsq().substring(9, 17).split("/");
			String newsfsqsq="";
			String newsfsqsqallf="";
			String newsfsqsqalle="";
			String newsfsqsqallf1="";
			String newsfsqsqalle1="";
			if(sfsqsqallf!=null){
				newsfsqsqallf="20"+sfsqsqallf[0].toString()+"-"+sfsqsqallf[1].toString()+"-"+sfsqsqallf[2].toString();
				newsfsqsqalle="20"+sfsqsqalle[0].toString()+"-"+sfsqsqalle[1].toString()+"-"+sfsqsqalle[2].toString();
				newsfsqsqallf1=GetSysDate("yyyy-MM-dd",  newsfsqsqallf,   0,   1,   0);
				newsfsqsqalle1=GetSysDate("yyyy-MM-dd",   newsfsqsqalle,   0,   1,   0);
				newsfsqsq=newsfsqsqallf1.substring(2, 4)+"/"+newsfsqsqallf1.substring(5,7)+"/"+newsfsqsqallf1.substring(8,10)+"~"
				+newsfsqsqalle1.substring(2, 4)+"/"+newsfsqsqalle1.substring(5,7)+"/"+newsfsqsqalle1.substring(8,10);
				jsonObject.put("sfsq",newsfsqsq);
			}
			
		
			String[] dfsqsqallf=mr.getDfsq().substring(0, 8).split("/");
			String[] dfsqsqalle=mr.getDfsq().substring(9, 17).split("/");
			String newdfsqsq="";
			String newdfsqsqallf="";
			String newdfsqsqalle="";
			String newdfsqsqallf1="";
			String newdfsqsqalle1="";
			if(dfsqsqallf!=null){
				newdfsqsqallf="20"+dfsqsqallf[0].toString()+"-"+dfsqsqallf[1].toString()+"-"+dfsqsqallf[2].toString();
				newdfsqsqalle="20"+dfsqsqalle[0].toString()+"-"+dfsqsqalle[1].toString()+"-"+dfsqsqalle[2].toString();
				newdfsqsqallf1=GetSysDate("yyyy-MM-dd",  newdfsqsqallf,   0,   1,   0);
				newdfsqsqalle1=GetSysDate("yyyy-MM-dd",   newdfsqsqalle,   0,   1,   0);
				newdfsqsq=newdfsqsqallf1.substring(2, 4)+"/"+newdfsqsqallf1.substring(5,7)+"/"+newdfsqsqallf1.substring(8,10)+"~"
				+newdfsqsqalle1.substring(2, 4)+"/"+newdfsqsqalle1.substring(5,7)+"/"+newdfsqsqalle1.substring(8,10);
				jsonObject.put("dfsq",newdfsqsq);
			}
			
			jsonObject.put("qysfdj",mr.getQysfdj());
			jsonObject.put("qydfdj",mr.getQydfdj());
			jsonObject.put("qysfdj2",mr.getQysfdj2());
			jsonObject.put("qydfdj2",mr.getQydfdj2());
			jsonObject.put("dsyhd",mr.getDbyhd());
			jsonObject.put("ssyhd",mr.getSbyhd());
			jsonObject.put("dsyhd2",mr.getSbyhd2());
			jsonObject.put("ssyhd2",mr.getDbyhd2());
			
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
	
	public static   String   GetSysDate(String   format,   String   StrDate,   int   year,   int   month,  int   day)   {   
      Calendar   cal   =   Calendar.getInstance();   
      SimpleDateFormat   sFmt   =   new   SimpleDateFormat(format);   
      cal.setTime(sFmt.parse(   (StrDate),   new   ParsePosition(0)));   
      if   (day   !=   0)   {   
      cal.add(cal.DATE,   day);   
      }   
      if   (month   !=   0)   {   
      cal.add(cal.MONTH,   month);   
      }   
      if   (year   !=   0)   {   
      cal.add(cal.YEAR,   year);   
      }   
return   sFmt.format(cal.getTime());   
}   


	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberRental entity, Model model, HttpServletRequest request) {
		entity.setId(key);
		service.update(entity);
		
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo.substring(0, 4).equals("cwry")){
			return "redirect://admin/rentalExamine/list/1.html";
		}else{
			return "redirect://admin/memberRental/list/1.html";
		}
		
	}
	@RequestMapping(value = SAVE)
	public String save(MemberRental entity, Model model, HttpServletRequest request) {
		if (entity.getId() == null) {
			entity.setShzt("未提交");
			entity.setFbzt("未发布");
			service.insert(entity);
		} else {
			service.update(entity);
		}
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo.substring(0, 4).equals("cwry")){
			return "redirect://admin/rentalExamine/list/1.html";
		}else{
			return "redirect://admin/memberRental/list/1.html";
		}
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key, HttpServletRequest request) {
		service.delete(key);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo.substring(0, 4).equals("cwry")){
			return "redirect://admin/rentalExamine/list/1.html";
		}else{
			return "redirect://admin/memberRental/list/1.html";
		}
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
			EnterpriseRental ert= new EnterpriseRental();
		    ert.setSslq(mdd.getSslq());
			ert.setAccessory("0");
			ert.setBz(mdd.getBz());
			ert.setDbyhd(mdd.getDbyhd());
			ert.setDfbz(mdd.getDfbz());
			ert.setDfsq(mdd.getDfsq());
			ert.setDhjyl(mdd.getDhjyl());
			ert.setDsyhd(mdd.getDsyhd());
			ert.setFbzt("未提交");
			ert.setGlfbz(mdd.getGlfbz());
			ert.setGlfsq(mdd.getGlfsq());
			ert.setGlfwf(mdd.getGlfwf());
			ert.setGlfwfdj(mdd.getGlfwfdj());
			ert.setGlfwfznj(mdd.getGlfwfznj());
			ert.setHjje(mdd.getHjje());
			ert.setHjjedx(mdd.getHjjedx());
			ert.setHjjeznj(mdd.getHjjeznj());
			ert.setHybh(mdd.getHybh());
			ert.setJfyd(mdd.getJfyd());
			ert.setJnje("0");
			ert.setQydf(mdd.getQydf());
			ert.setQydfznj(mdd.getQydfznj());
			ert.setQymc(mdd.getQymc());
			ert.setQymj(mdd.getQymj());
			ert.setQysf(mdd.getQysf());
			ert.setQysfznj(mdd.getQysfznj());
			ert.setSbyhd(mdd.getSbyhd());
			ert.setZjbz(mdd.getZjbz());
			ert.setZjsq(mdd.getZjsq());
			ert.setZlbzj(mdd.getZlbzj());
			ert.setZlbzjbz(mdd.getZlbzjbz());
			ert.setZlbzjdj(mdd.getZlbzjdj());
			ert.setZlbzjznj(mdd.getZlbzjznj());
			ert.setZxyj(mdd.getZxyj());
			ert.setZxyjbz(mdd.getZxyjbz());
			ert.setZxyjdj(mdd.getZxyjdj());
			ert.setZxyjdj(mdd.getZxyjdj());
			ert.setZxyjsq(mdd.getZxyjsq());
			ert.setZxyjznj(mdd.getZxyjznj());
			ert.setZydy(mdd.getZydy());
			ert.setSfqf("0");
			ert.setSsyhd(mdd.getSsyhd());
			ert.setShjyl(mdd.getShjyl());
			ert.setQydfdj(mdd.getQydfdj());
			ert.setQysfdj(mdd.getQysfdj());
		    ert.setSfsq(mdd.getSfsq());
		    ert.setQyzj(mdd.getQyzj());
		    ert.setQyzjdj(mdd.getQyzjdj());
		    ert.setZlbzjsq(mdd.getZlbzjsq());
		    ert.setXxbz(mdd.getXxbz());
		    ert.setLqydf(mdd.getLqydf());
		    ert.setLqysf(mdd.getLqysf());
		    ert.setSslq(mdd.getSslq());
		    ert.setSsyhd2(mdd.getSsyhd2());
		    ert.setSbyhd2(mdd.getSbyhd2());
		    ert.setShjyl2(mdd.getShjyl2());
		   ert.setQysfdj2(mdd.getQysfdj2());
		ert.setLqydf2(mdd.getLqydf2());
		ert.setLqysf2(mdd.getLqysf2());
		ert.setSfbz2(mdd.getSfbz2());
		ert.setDsyhd2(mdd.getDsyhd2());
	    ert.setZjmc(mdd.getZjmc());
			ert.setDbyhd2(mdd.getDbyhd2());
			ert.setDhjyl2(mdd.getDhjyl2());
			ert.setQydfdj2(mdd.getQydfdj2());
			ert.setDfbz2(mdd.getDfbz2());
			ert.setDfmc(mdd.getDfmc());
			ert.setSfmc(mdd.getSfmc());
			ert.setZxyjmc(mdd.getZxyjmc());
			ert.setZlbzjmc(mdd.getZlbzjmc());
			ert.setGlfwfmc(mdd.getGlfwfmc());
			Erservice.insert(ert);
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
	
	@RequestMapping("/outfpqs/1.html")
	public void outfpqs(Model model,String fhymc,String fjfyd,HttpServletRequest request,HttpServletResponse response) {
		String title="发票签收表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "sslqname","位置"});
		headData.add(new Object[] { "Kprq","开票日期"});
		headData.add(new Object[] { "rownum","顺序号"});
		headData.add(new Object[] { "flfph","发票号码"});
		headData.add(new Object[] { "flje","金额"});
		headData.add(new Object[] { "Qymc","单位名称"});
		headData.add(new Object[] { "Flname","内容"});
		headData.add(new Object[] { "qsbz","签收/日期"});
		headData.add(new Object[] { "qsbz","备注"});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fjfyd", fjfyd);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		List list =service.getFpqsb(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}
	@RequestMapping("/outPtqfqk/1.html")
	public void OutPtqfqk(Model model,String fhymc,String fjfyd,String fsslq,HttpServletRequest request,HttpServletResponse response) {
		String title="缴费表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Jfyd","缴费月度"});
		headData.add(new Object[] { "Hybh","企业编号"});
		headData.add(new Object[] { "Sslqname","所属楼区"});
		headData.add(new Object[] { "Qymc","企业名称"});
		headData.add(new Object[] { "Zydy","租用单元"});
		
		headData.add(new Object[] { "Qymj","企业面积"});
		headData.add(new Object[] { "Zjsq","租金属期"});
		headData.add(new Object[] { "Qyzj","企业租金"});
		headData.add(new Object[] { "Glfwf","管理服务费"});
		headData.add(new Object[] { "Glfwfsq","管理服务费属期"});
		headData.add(new Object[] { "Zlbzj","租赁保证金"});
		
		headData.add(new Object[] { "Zxyj","装修押金"});
		headData.add(new Object[] { "Hjjeznj","合计滞纳金"});
		headData.add(new Object[] { "Sfsq","水费属期"});
		
		headData.add(new Object[] { "Qysf","企业水费"});
		headData.add(new Object[] { "Dfsq","电费属期"});
		headData.add(new Object[] { "Qydf","企业电费"});
		
		
		headData.add(new Object[] { "Ssyhd","水上月行度"});
		headData.add(new Object[] { "Sbyhd","水本月行度"});
		headData.add(new Object[] { "Shjyl","水合计用量"});
		headData.add(new Object[] { "Dsyhd","电上月行度"});
		headData.add(new Object[] { "Dbyhd","电本月行度"});
		headData.add(new Object[] { "Dhjyl","电合计用量"});
		
		headData.add(new Object[] { "Hjje","合计金额"});
		
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		params.put("fjfyd", fjfyd);
		params.put("fsslq", fsslq);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
