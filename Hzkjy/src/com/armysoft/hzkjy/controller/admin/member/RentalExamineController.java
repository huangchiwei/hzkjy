package com.armysoft.hzkjy.controller.admin.member;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

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
import com.armysoft.hzkjy.base.util.ExportExcel3;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.DbMessage;
import com.armysoft.hzkjy.model.EnterpriseRental;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.model.RentalExamine;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.DbMessageService;
import com.armysoft.hzkjy.service.member.EnterpriseRentalService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.MemberRentalService;
import com.armysoft.hzkjy.service.member.RentalExamineService;

import com.alibaba.fastjson.JSONObject;
@Controller
@RequestMapping("admin/rentalExamine")
public class  RentalExamineController extends BaseController {

	@Resource
	private RentalExamineService service;
	@Resource
	private MemberBasicService Mbservice;
	
	
	@Resource
	private BsNewsService Bsservice;
	@Resource
	private DbMessageService dbservice;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	private static String url = null;
	/**
	 * 条件分页查询
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
	@PermissionsAnno("shzj_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model,String fhymc,String fjfyd,
			RentalExamine entity, HttpServletRequest request) {
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
        model.addAttribute("list", service.getByPage(params, pager));
		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/RentalExamineQ";
	}

	
	@RequestMapping("printHuiZhiList")
	@ResponseBody
	public void printHuiZhiList(String ids, HttpServletRequest request,
			HttpServletResponse response) throws IOException, JRException {
		String[] idArr = ids.split(",");
		List<MemberRental> stuList = service.findByIds(idArr);
		this.exportPdf(stuList, request, response);
	}
	
	@RequestMapping("ZShtg.html")
	@ResponseBody
	public String ZShtg(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			MemberRental mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("已审核");
			service.update(mdd);
			
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}
	
	@RequestMapping("Pltz.html")
	@ResponseBody
	public String Pltz(String ids,String examineTime,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		String[] idArr = ids.split(",");
		JSONObject jsonObject = new JSONObject();
		for(int id=0;id<idArr.length;id++){
			MemberRental mdd= service.findByKey(Long.valueOf(idArr[id]));
			
			Date now = new Date(); 
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
			BsNews bs=new BsNews();
			bs.setCreater(userNo);
			GregorianCalendar gcNew=new GregorianCalendar();
		    gcNew.set(Calendar.MONTH, gcNew.get(Calendar.MONTH)+1);
		    Date dtFrom=gcNew.getTime();
			bs.setCreateTime(now);
			bs.setTitle(mdd.getJfyd()+"缴费通知");
			bs.setActiveTime(dtFrom);
			bs.setIseveryone("0");
			bs.setReceiver(mdd.getQymc());
			bs.setReceiverBh(mdd.getHybh());
			bs.setIsReport("1");
			DbMessage dbmessage=dbservice.findByKey(Long.valueOf(2));
			String content=dbmessage.getMessage();
			bs.setContent(content);
			mdd.setFbzt("已发送");
			service.update(mdd);
			Bsservice.insert(bs);
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
	
	@RequestMapping("Thtg.html")
	@ResponseBody
	public String Thtg(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			MemberRental mdd= service.findByKey(Long.valueOf(idArr[id]));
			mdd.setShzt("退回");
			service.update(mdd);
		}
		
		request.setAttribute("exl", "ok");
		String exl="ok";
		return exl;
	}

	@SuppressWarnings("unchecked")
	public void exportPdf(List<MemberRental> stuList,
			HttpServletRequest request, HttpServletResponse response)
			throws JRException, IOException {
		List<Map> data = new ArrayList<Map>();
		Map map = null;
		for (MemberRental stu : stuList) {
			map = new HashMap();
			initPdfMap(map, stu);
			data.add(map);
		}
		String filePath="jasper/hz/";
		File reportFile = new File(request.getSession().getServletContext().getRealPath(filePath) + "/reportHuiZhi_map.jasper");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(
				data);

		Map<String, Object> parameters = new HashMap<String, Object>();
		// parameters.put("StuIds", dataSource);
		byte[] bytes = JasperRunManager.runReportToPdf(reportFile
				.getPath(), parameters, dataSource);
		response.setContentType("application/pdf");
		response.setContentLength(bytes.length);
		OutputStream ouputStream = null;
		ouputStream = response.getOutputStream();
		ouputStream.write(bytes);
		ouputStream.flush();
		ouputStream.close();
		/*
		JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile
				.getPath(), parameters, dataSource);
		JRPdfExporter exporter = new JRPdfExporter();
		resp.setContentType("application/pdf");
		resp.setCharacterEncoding("UTF-8");
		resp.setHeader("Content-Disposition", "attachment; filename=\""
				+ URLEncoder.encode("PDF报表", "UTF-8") + ".pdf\"");
		OutputStream ouputStream = resp.getOutputStream();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
		exporter.exportReport();
		ouputStream.close();
		*/
	}
	
	@SuppressWarnings("unchecked")
	private void initPdfMap(Map map, MemberRental mb) {
		map.put("Id", mb.getId());
		map.put("Qymc", mb.getQymc() + "");
		map.put("Qyzj", mb.getQyzj()+"");
		map.put("Hybh", mb.getHybh()+"");
		map.put("Glfwf", mb.getGlfwf()+"");
		map.put("Qysf", mb.getQysf()+"");
		map.put("Qydf", mb.getQydf()+"");
		map.put("Ssyhd", mb.getSsyhd()+"");
		map.put("Sbyhd", mb.getSbyhd()+"");
		map.put("Shjyl", mb.getShjyl()+"");
		map.put("Dhjyl", mb.getDhjyl()+"");
		map.put("Qymj", mb.getQymj()+"");
		map.put("Shzt", mb.getShzt()+"");
		map.put("Fbzt", mb.getFbzt()+"");
		map.put("Jfyd", mb.getJfyd()+"");
		map.put("Dsyhd", mb.getDbyhd()+"");
		map.put("Dbyhd", mb.getDbyhd()+"");
		map.put("Zydy", mb.getZydy()+"");
		map.put("Hjje", mb.getHjje()+"");
		map.put("Zjsq", mb.getZjsq()+"");
		map.put("Glfsq", mb.getGlfsq()+"");
		map.put("Sfsq", mb.getSfsq()+"");
		map.put("Dfsq", mb.getDfsq()+"");
		map.put("Zjbz", mb.getZjbz()+"");
		map.put("Glfbz", mb.getGlfbz()+"");
		map.put("Sfbz", mb.getSfbz()+"");
		map.put("Dfbz", mb.getDfbz()+"");
		map.put("Zlbzj", mb.getZlbzj()+"");
		map.put("Zlbzjsq", mb.getZlbzjsq()+"");
		map.put("Zlbzjznj", mb.getZlbzjznj()+"");
		map.put("Zlbzjbz",mb.getZlbzjbz()+"");
		map.put("Zxyj",mb.getZxyj()+"");
		map.put("Zxyjsq",mb.getZxyjsq()+"");
		map.put("Zxyjznj",mb.getZxyjznj()+"");
		map.put("Zxyjbz",mb.getZxyjbz()+"");
		map.put("Qyzjznj",mb.getQyzjznj()+"");
		map.put("Glfwfznj",mb.getGlfwfznj()+"");
		map.put("Qysfznj",mb.getQysfznj()+"");
		map.put("Qydfznj",mb.getQydfznj()+"");
		map.put("Hjjedx",mb.getHjjedx()+"");
		map.put("Qysfdj",mb.getQysfdj()+"");
		map.put("Qydfdj",mb.getQydfdj()+"");
		map.put("Hjjeznj",mb.getHjjeznj()+"");
		map.put("Sdhj",mb.getSdhj()+"");
		if(mb.getSslq().equals("1")){
			map.put("Sslq","科技大楼");
		}else if(mb.getSslq().equals("2")){
			map.put("Sslq","A栋");
		}else if(mb.getSslq().equals("3")){
			map.put("Sslq","B栋");
		}else if(mb.getSslq().equals("4")){
			map.put("Sslq","C栋");
		}else if(mb.getSslq().equals("5")){
			map.put("Sslq","D栋");
		}else{
			map.put("Sslq","琶洲科技创意中心");
		}
		
		map.put("Ssyhd2",mb.getSsyhd2()+"");
		map.put("Sbyhd2",mb.getSbyhd2()+"");
		map.put("Shjyl2",mb.getShjyl2()+"");
		map.put("Qysfdj2",mb.getQysfdj2()+"");
		map.put("Lqysf2",mb.getLqysf2()+"");
		map.put("Sfbz2",mb.getSfbz2()+"");
		
		map.put("Dsyhd2",mb.getDsyhd2()+"");
		map.put("Dbyhd2",mb.getDbyhd2()+"");
		map.put("Dhjyl2",mb.getDhjyl2()+"");
		map.put("Qydfdj2",mb.getQydfdj2()+"");
		map.put("Lqydf2",mb.getLqydf2()+"");
		map.put("Dfbz2",mb.getDfbz2()+"");
		map.put("Zjmc",mb.getZjmc()+"");
		map.put("Lqysf",mb.getLqysf()+"");
		
		map.put("Lqydf",mb.getLqydf()+"");
		map.put("Glfwfmc",mb.getGlfwfmc()+"");
		map.put("Zlbzjmc",mb.getZlbzjmc()+"");
		map.put("Zxyjmc",mb.getZxyjmc()+"");
		map.put("Sfmc",mb.getSfmc()+"");
		map.put("Dfmc",mb.getDfmc()+"");
		map.put("Lqysf2",mb.getLqysf2()+"");
		map.put("Lqydf2",mb.getLqydf2()+"");
//		String stuDiploma[] = { "初中", "高中", "大专", "本科", "研究生", "博士" };
//		map.put("StuDiploma", stuDiploma[Integer.valueOf(mb.getStuDiploma())]);
//		map.put("EduPeriod", mb.getEduPeriod() + "");
//		map.put("StuNo", mb.getStuNo());
//		map.put("StuTel", mb.getStuTel());
//		map.put("StuPhone", mb.getStuPhone());
//		map.put("StuAddress", mb.getStuAddress());
//		map.put("StuWorkUnit", mb.getStuWorkUnit() == null ? "" : mb
//				.getStuWorkUnit());
//		map.put("StuCertType", mb.getStuCertType() + "");
//		map.put("StuCertNo", mb.getStuCertNo() + "");
//		map.put("LicensingDay", new SimpleDateFormat("yyyy-MM-dd").format(mb
//				.getLicensingDay())
//				+ "");
//		map.put("CertStartDay", new SimpleDateFormat("yyyy-MM-dd").format(mb
//				.getCertStartDay())
//				+ "");
//		map.put("CertEndDay", new SimpleDateFormat("yyyy-MM-dd").format(mb
//				.getCertEndDay())
//				+ "");
//		map.put("EduType", mb.getEduType() + "");
//		map.put("SignDate", new SimpleDateFormat("yyyy-MM-dd").format(mb
//				.getSignDate()));
//		String newmm = mb.getStuNo().substring(0, 1)
//				+ mb.getStuNo().substring(2, 3) + mb.getStuNo().substring(4, 5)
//				+ mb.getStuNo().substring(6, 7) + mb.getStuNo().substring(8, 9)
//				+ mb.getStuNo().substring(10, 11)
//				+ mb.getStuNo().substring(12, 13)
//				+ mb.getStuNo().substring(14, 15);
//		map.put("SignPass", newmm);
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
		return "admin/member/RentalExamineV";
	}
     
	
	private String getUrl() {
		if (url == null) {
			String con1 = System.getProperty("Hzkjy");
			String _url = con1 + "/jasper/hz/";
			url = _url;
		}
		return url;
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
		return "admin/member/RentalExamineV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= Mbservice.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}
	
	@RequestMapping(value = "/getQyxx.html")
	@ResponseBody
	public  String getQyxx(HttpServletRequest request) {
		String qymc = request.getParameter("qymc");
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
		return jsonObject.toString();
	}

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("shzj_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberRental entity, Model model) {
		entity.setId(key);
		service.update(entity);
		return "redirect:/admin/rentalExamine/list/1.html";
	}
	@PermissionsAnno("shzj_save")
	@RequestMapping(value = SAVE)
	public String save(MemberRental entity, Model model) {
		if (entity.getId() == null) {
			entity.setShzt("未审核");
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect:/admin/rentalExamine/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("shzj_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect:/admin/rentalExamine/list/1.html";
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
	@RequestMapping("/outfpxt/1.html")
	public void outfpxt(Model model,String fhymc,String fjfyd,String fkpxm,String fpzl,HttpServletRequest request,HttpServletResponse response) {
		String title="发票系统表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "rownum","序号(*)"});
		headData.add(new Object[] { "Fpzlname","发票种类(*)"});
		headData.add(new Object[] { "Kpxmname","开票项目(*)"});
		headData.add(new Object[] { "Fkflxname","付款方类型(*)"});
		headData.add(new Object[] { "Fkfsjhm","付款方手机号码"});
		headData.add(new Object[] { "Fkfmc","付款方名称(*)"});
		headData.add(new Object[] { "Fkfzjlxname","付款方证件类型(*)"});
		headData.add(new Object[] { "Fkfsbh","付款方识别号"});
		headData.add(new Object[] { "Hjje","合计金额(*)"});
		headData.add(new Object[] { "Fz","附注"});
		headData.add(new Object[] { "Kpxmsm","开票项目说明(*)"});
		headData.add(new Object[] { "Fpje","金额(*)"});
		headData.add(new Object[] { "Fpbz","备注"});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		params.put("fjfyd", fjfyd);
		params.put("fkpxm", fkpxm);
		
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List list=null;
		if(fkpxm.equals("1")){
			if(fpzl.equals("1")){
				 list =service.getFpzly1(params);
			}else{
				 list =service.getFpzly2(params);
			}
			
		}else if(fkpxm.equals("2")){
			if(fpzl.equals("1")){
				 list =service.getFpglf1(params);
			}else{
				 list =service.getFpglf2(params);
			}
			
		}else if(fkpxm.equals("3")){
			
			 if(fpzl.equals("1")){
				 list =service.getFpdly1(params);
			}else{
				 list =service.getFpdly2(params);
			}
		}
         ExportExcel3 exportExcel = new ExportExcel3(title,title, headData);
		
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
