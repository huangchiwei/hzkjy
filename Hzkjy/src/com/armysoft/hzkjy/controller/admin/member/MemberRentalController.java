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
			
			String[] zjsqall=mr.getZjsq().split("/");
			String newzjsqy="";
			String newzjsqn="";
			String newzjsq="";
			String[] zjsqdall;
			if(zjsqall!=null){
				System.out.println(zjsqall[0].toString());
				if(zjsqall[1].toString().equals("12")){
					newzjsqy="1";
					newzjsqn=String.valueOf(Integer.valueOf(zjsqall[0].toString())+1);
				}else{
					newzjsqy=String.valueOf(Integer.valueOf(zjsqall[1].toString())+1);
					newzjsqn=zjsqall[0].toString();
				}
				zjsqdall=zjsqall[2].toString().split("~");
				newzjsq=newzjsqn+"/"+newzjsqy+"/"+zjsqdall[0].toString()+"~"+newzjsqn+"/"+newzjsqy+"/"+zjsqall[4].toString();
				jsonObject.put("zjsq",newzjsq);
			}
			
			jsonObject.put("qyzjznj",mr.getQyzjznj());
			jsonObject.put("zjbz",mr.getZjbz());
			
			
			
			
			jsonObject.put("glfwf",mr.getGlfwf());
			jsonObject.put("glfwfdj",mr.getGlfwfdj());
			
			String[] glfsqall=mr.getGlfsq().split("/");
			String newglfsqy="";
			String newglfsqn="";
			String newglfsq="";
			String[] glfsqdall;
			if(glfsqall!=null){
				System.out.println(glfsqall[0].toString());
				if(glfsqall[1].toString().equals("12")){
					newglfsqy="1";
					newglfsqn=String.valueOf(Integer.valueOf(glfsqall[0].toString())+1);
				}else{
					newglfsqy=String.valueOf(Integer.valueOf(glfsqall[1].toString())+1);
					newglfsqn=glfsqall[0].toString();
				}
				glfsqdall=glfsqall[2].toString().split("~");
				newglfsq=newglfsqn+"/"+newglfsqy+"/"+glfsqdall[0].toString()+"~"+newglfsqn+"/"+newglfsqy+"/"+glfsqall[4].toString();
				jsonObject.put("glfsq",newglfsq);
			}
			
			jsonObject.put("glfwfznj",mr.getGlfwfznj());
			jsonObject.put("glfbz",mr.getGlfbz());
			
			
			
			
			jsonObject.put("zlbzj",mr.getZlbzj());
			jsonObject.put("zlbzjdj",mr.getZlbzjdj());
			
			String[] zlbzjsqall=mr.getZlbzjsq().split("/");
			String newzlbzjsqy="";
			String newzlbzjsqn="";
			String newzlbzjsq="";
			String[] zlbzjsqdall;
			if(zlbzjsqall!=null){
				System.out.println(zlbzjsqall[0].toString());
				if(zlbzjsqall[1].toString().equals("12")){
					newzlbzjsqy="1";
					newzlbzjsqn=String.valueOf(Integer.valueOf(zlbzjsqall[0].toString())+1);
				}else{
					newzlbzjsqy=String.valueOf(Integer.valueOf(zlbzjsqall[1].toString())+1);
					newzlbzjsqn=zlbzjsqall[0].toString();
				}
				zlbzjsqdall=zlbzjsqall[2].toString().split("~");
				newzlbzjsq=newzlbzjsqn+"/"+newzlbzjsqy+"/"+zlbzjsqdall[0].toString()+"~"+newzlbzjsqn+"/"+newzlbzjsqy+"/"+zlbzjsqall[4].toString();
				jsonObject.put("zlbzjsq",newzlbzjsq);
			}
			jsonObject.put("zlbzjznj",mr.getZlbzjznj());
			jsonObject.put("zlbzjbz",mr.getZlbzjbz());
			
			
			
			
			jsonObject.put("zxyj",mr.getZxyj());
			jsonObject.put("zxyjdj",mr.getZxyjdj());
			jsonObject.put("zxyjsq",mr.getZxyjsq());
			
			String[] zxyjsqall=mr.getZxyjsq().split("/");
			String newzxyjsqy="";
			String newzxyjsqn="";
			String newzxyjsq="";
			String[] zxyjsqdall;
			if(zxyjsqall!=null){
				System.out.println(zxyjsqall[0].toString());
				if(zxyjsqall[1].toString().equals("12")){
					newzxyjsqy="1";
					newzxyjsqn=String.valueOf(Integer.valueOf(zxyjsqall[0].toString())+1);
				}else{
					newzxyjsqy=String.valueOf(Integer.valueOf(zxyjsqall[1].toString())+1);
					newzxyjsqn=zxyjsqall[0].toString();
				}
				zxyjsqdall=zxyjsqall[2].toString().split("~");
				newzxyjsq=newzxyjsqn+"/"+newzxyjsqy+"/"+zxyjsqdall[0].toString()+"~"+newzxyjsqn+"/"+newzxyjsqy+"/"+zxyjsqall[4].toString();
				jsonObject.put("zxyjsq",newzxyjsq);
			}
			jsonObject.put("zxyjznj",mr.getZxyjznj());
			jsonObject.put("zxyjbz",mr.getZxyjbz());
			
			String[] sfsqall=mr.getSfsq().split("/");
			String newsfsqy="";
			String newsfsqn="";
			String newsfsq="";
			String[] sfsqdall;
			if(sfsqall!=null){
				System.out.println(sfsqall[0].toString());
				if(sfsqall[1].toString().equals("12")){
					newsfsqy="1";
					newsfsqn=String.valueOf(Integer.valueOf(sfsqall[0].toString())+1);
				}else{
					newsfsqy=String.valueOf(Integer.valueOf(sfsqall[1].toString())+1);
					newsfsqn=sfsqall[0].toString();
				}
				sfsqdall=sfsqall[2].toString().split("~");
				newsfsq=newsfsqn+"/"+newsfsqy+"/"+sfsqdall[0].toString()+"~"+newsfsqn+"/"+newsfsqy+"/"+sfsqall[4].toString();
				jsonObject.put("sfsq",newsfsq);
			}
			
		
			String[] dfsqall=mr.getDfsq().split("/");
			String newdfsqy="";
			String newdfsqn="";
			String newdfsq="";
			String[] dfsqdall;
			if(dfsqall!=null){
				System.out.println(dfsqall[0].toString());
				if(dfsqall[1].toString().equals("12")){
					newdfsqy="1";
					newdfsqn=String.valueOf(Integer.valueOf(dfsqall[0].toString())+1);
				}else{
					newdfsqy=String.valueOf(Integer.valueOf(dfsqall[1].toString())+1);
					newdfsqn=dfsqall[0].toString();
				}
				dfsqdall=dfsqall[2].toString().split("~");
				newdfsq=newdfsqn+"/"+newdfsqy+"/"+dfsqdall[0].toString()+"~"+newdfsqn+"/"+newdfsqy+"/"+dfsqall[4].toString();
				jsonObject.put("dfsq",newdfsq);
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
	public void OutPtqfqk(Model model,String fhymc,String fjfyd,HttpServletRequest request,HttpServletResponse response) {
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
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
