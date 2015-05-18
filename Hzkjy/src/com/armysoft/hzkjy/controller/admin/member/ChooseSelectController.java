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
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.DbMessageService;
import com.armysoft.hzkjy.service.member.EccIndicatorService;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("admin/chooseSelect")
public class  ChooseSelectController extends BaseController {

	@Resource
	private MemberBasicService service;
	@Resource
	private EccIndicatorService Eccservice;
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
	private static String url = null;
	/**
	 * 条件分页查询
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
	@PermissionsAnno("jjybsz_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			MemberBasic entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		pager.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && userNo.substring(0, 4).equals("4401")){
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
		return "admin/member/ChooseSelectQ";
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
		return "admin/member/MemberBasicV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		MemberBasic mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/MemberBasicV";
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
	@PermissionsAnno("jjybsz_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberBasic entity, Model model) {
		entity.setId(key);
		Cn2Spell cn2Spell = new Cn2Spell();
		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
		System.out.println(entity.getId());
		service.update(entity);
		return "redirect://admin/memberBasic/list/1.html";
	}
	@PermissionsAnno("jjybsz_save")
	@RequestMapping(value = SAVE)
	public String save(MemberBasic entity, Model model) {
		if (entity.getId() == null) {
			Cn2Spell cn2Spell = new Cn2Spell();
			entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
			String newHybh="";
     	   String newHybh1="44";
     	   String newHybh2="01";
			Integer countI= service.CountHybh(newHybh1,newHybh2);
           if(countI == 0){
        	   newHybh=newHybh1+newHybh2+"00001";
        	   entity.setHybh(newHybh);
           }else{
          MemberBasic entity2= service.findByNewHybh(newHybh1, newHybh2);
           Long newbh= Long.parseLong(entity2.getHybh());
			newbh=newbh+1;
			entity.setHybh(newbh.toString());
           }
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect://admin/memberBasic/list/1.html";
	}
	@RequestMapping("printHuiZhiList")
	@ResponseBody
	public void printHuiZhiList(String ids, HttpServletRequest request,
			HttpServletResponse response) throws IOException, JRException {
		String[] idArr = ids.split(",");
		List<EccIndicator> stuList = Eccservice.findByIds(idArr);
		this.exportPdf(stuList, request, response);
	}
	
	@SuppressWarnings("unchecked")
	public void exportPdf(List<EccIndicator> stuList,
			HttpServletRequest request, HttpServletResponse response)
			throws JRException, IOException {
		List<Map> data = new ArrayList<Map>();
		Map map = null;
		for (EccIndicator stu : stuList) {
			map = new HashMap();
			initPdfMap(map, stu);
			data.add(map);
		}
		String filePath="jasper/hz/";
		File reportFile = new File(request.getSession().getServletContext().getRealPath(filePath) + "/HuiZhi_map.jasper");
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
	private void initPdfMap(Map map, EccIndicator mb) {
		map.put("Id", mb.getId());
		map.put("Rzqy", mb.getRzqy() + "");
		map.put("Hybh", mb.getHybh() + "");
	  MemberBasic	mc=service.findByHybh(mb.getHybh());
	 
		String Hyfl = "";
		if(mb.getHyfl().equals("1")){
			Hyfl="生物/医药技术业";
		}else if(mb.getHyfl().equals("2")){
			Hyfl="电子与信息业";
		}else if(mb.getHyfl().equals("3")){
			Hyfl="新材料技术/新材料业";
		}else if(mb.getHyfl().equals("4")){
			Hyfl="展览服务";
		}else if(mb.getHyfl().equals("5")){
			Hyfl="其他";
		}else if(mb.getHyfl().equals("6")){
			Hyfl="工业";
		}
		map.put("Hyfl", Hyfl);
		map.put("Zczj", mb.getZczj() + "");
		map.put("JgmzsrBys", mb.getJgmzsrBys() + "");
		map.put("JgmzsrLjs", mb.getJgmzsrLjs() + "");
		map.put("LrzeBys", mb.getLrzeBys() + "");
		map.put("LrzeLjs", mb.getLrzeLjs() + "");
		map.put("NsBys", mb.getNsBys() + "");
		map.put("NsLjs", mb.getNsLjs() + "");
		map.put("LszeBys", mb.getLszeBys() + "");
		map.put("LszeLjs", mb.getLszeLjs() + "");
		map.put("Ch", mb.getCh() + "");
		map.put("Zgs", mb.getZgs() + "");
		map.put("Yfjf", mb.getYfjf()+ "");
		map.put("Gxjscpsr", mb.getGxjscpsr() + "");
		map.put("Gyzcz", mb.getGyzcz() + "");
		map.put("Gyzjz", mb.getGyzjz() + "");
		map.put("JjzbN", mb.getJjzbNy().substring(0, 4) + "");
		map.put("JjzbY", mb.getJjzbNy().substring(5, 7) + "");
		map.put("Shzt", mb.getShzt() + "");
		map.put("ChLjs", mb.getChLjs() + "");
		map.put("YfjfLjs", mb.getYfjfLjs() + "");
		map.put("GxjscpsrLjs", mb.getGxjscpsrLjs() + "");
		map.put("GyzczLjs", mb.getGyzczLjs() + "");
		map.put("GyzjzLjs", mb.getGyzjzLjs() + "");
		map.put("Tbr", mb.getTbr() + "");
		map.put("Dwfzr", mb.getDwfzr() + "");
		map.put("Tjfzr", mb.getTjfzr() + "");
		map.put("Tbrlxdh", mb.getTbrlxdh() + "");
		map.put("Tbrq", mb.getTbrq() + "");
		map.put("Zzjgdm", mc.getZzjgdm() + "");
		 

	}
	
	private String getUrl() {
		if (url == null) {
			String con1 = System.getProperty("Hzkjy");
			String _url = con1 + "/jasper/hz/";
			url = _url + "\\";
		}
		return url;
	}
	@RequestMapping("Pltz.html")
	@ResponseBody
	public String Pltz(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			MemberBasic mdd= service.findByKey(Long.valueOf(idArr[id]));
			
			Date now = new Date(); 
			String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
			BsNews bs=new BsNews();
			bs.setCreater(userNo);
			GregorianCalendar gcNew=new GregorianCalendar();
		    gcNew.set(Calendar.MONTH, gcNew.get(Calendar.MONTH)+1);
		    Date dtFrom=gcNew.getTime();
			bs.setCreateTime(now);
			bs.setTitle("经济月报通知");
			bs.setActiveTime(dtFrom);
			bs.setIseveryone("0");
			bs.setReceiver(mdd.getQymc());
			bs.setReceiverBh(mdd.getHybh());
			bs.setIsReport("1");
			DbMessage dbmessage=dbservice.findByKey(Long.valueOf(1));
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
	@PermissionsAnno("jjybsz_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/memberBasic/list/1.html";
	}
	
	@RequestMapping("ZShtg.html")
	@ResponseBody
	public String ZShtg(String settime,String examineTime,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		Map<String, Object> params = new HashMap<String, Object>();
		JSONObject jsonObject = new JSONObject();
		List list =service.getJjybsz(params);
		
		for(int id=0;id<list.size();id++){
			Map mmd=(Map) list.get(id);
			MemberBasic mdd= service.findByKey(Long.valueOf(mmd.get("ID").toString()));
			EccIndicator ert= new EccIndicator();
			ert.setHybh(mdd.getHybh());
			ert.setHyfl(mdd.getQyssjsly());
			ert.setJjzbNy(settime);
			ert.setRzqy(mdd.getQymc());
			ert.setZczj(mdd.getZczb());
			ert.setZt(mdd.getZt());
			ert.setCh("0");
			ert.setGxjscpsr("0");
			ert.setGyzcz("0");
			ert.setGyzjz("0");
			ert.setJgmzsrBys("0");
			ert.setJgmzsrLjs("0");
			ert.setLrzeBys("0");
			ert.setLrzeLjs("0");
			ert.setLszeBys("0");
			ert.setLszeLjs("0");
			ert.setNsBys("0");
			ert.setNsLjs("0");
			ert.setZgs("0");
			ert.setShzt("未提交");
			ert.setYfjf("0");
			Eccservice.insert(ert);
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
	
	
	@RequestMapping("Ishas.html")
	@ResponseBody
	public String Ishas(String settime,String examineTime,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		Map<String, Object> params = new HashMap<String, Object>();
		JSONObject jsonObject = new JSONObject();
		Integer countyear=Eccservice.CountYear(settime);
		if(countyear>0){
			jsonObject.put("exl","no");
		}else{
			jsonObject.put("exl","ok");
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
	
	@RequestMapping(value = "/Zind.html")
	public String Zind(HttpServletRequest request) {
		return "admin/member/MemberBasicZ";
	}
	
	@RequestMapping(value = "/Find.html")
	public String Find(HttpServletRequest request) {
		return "admin/member/MemberBasicF";
	}
	
	@RequestMapping(value = "/inputExport.html")
	public String  OutPtqfqk(@RequestParam MultipartFile exlFile, String  nd1,String nd, HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException {
	        InputStream fis = exlFile.getInputStream();
	        //得到解析Excel的实体集合  
	        List<MemberBasic> infos = ImportExcel.importMemberBasic(fis);  
	        
	        //遍历解析Excel的实体集合  
	        for(MemberBasic info:infos) {  
	            //判断员工编号是否存在(存在：做修改操作；不存在：做新增操作)  
	        	   String newHybh="";
	        	   String newHybh1="44";
	        	   String newHybh2="01";
	                
	               Integer countI= service.CountHybh(newHybh1,newHybh2);
	               if(countI == 0){
	            	   newHybh=newHybh1+newHybh2+"00001";
	            	   info.setHybh(newHybh);
	               }else{
	              MemberBasic entity= service.findByNewHybh(newHybh1, newHybh2);
	               Long newbh= Long.parseLong(entity.getHybh());
					newbh=newbh+1;
					info.setHybh(newbh.toString());
	               }
	               
	               if(info.getZt().equals("在园")){
	            	   info.setZt("1");
	               }else{
	            	   info.setZt("0");
	               }
	               
	               Cn2Spell cn2Spell = new Cn2Spell();
					info.setQymcpy(cn2Spell.converterToFirstSpell(info.getQymc().replace("(","").replace("）","").replace("（","").replace(")","")));
	        	service.insert(info);
	        }  
	        request.setAttribute("exl", "ok");
	        return "admin/member/MemberBasicF";
		
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
