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
import java.util.UUID;

import java.io.File;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.armysoft.security.annotation.PermissionsAnno;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.EnterpriseRental;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.service.member.EnterpriseRentalService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.MemberRentalService;

import com.alibaba.fastjson.JSONObject;
@Controller
@RequestMapping("admin/enterpriseRental")
public class  EnterpriseRentalController extends BaseController {

	@Resource
	private EnterpriseRentalService service;
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
	@PermissionsAnno("hy_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,Model model,String fhymc,String fjfyd,
			MemberRental entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && !userNo.equals("admin")){
		params.put("fhybh", userNo);
		}
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
		return "admin/member/EnterpriseRentalQ";
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
		return "admin/member/EnterpriseRentalV";
	}

	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		EnterpriseRental mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "admin/member/EnterpriseRentalV";
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
	 * @throws Exception 
	 */
	@PermissionsAnno("hy_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,@RequestParam("files") MultipartFile[] files,EnterpriseRental entity, Model model,HttpServletRequest request) throws Exception {
		entity.setId(key);
		
		String fileName ;
		String FmPicture = "";
			
		upFile(entity,request);
		if(Double.valueOf(entity.getHjje())-Double.valueOf(entity.getJnje()) == Double.valueOf(0)){
			entity.setSfqf("1");
		}else{
			entity.setSfqf("0");
		}
		service.update(entity);
		return "redirect://admin/enterpriseRental/list/1.html";
	}
	 public void upFile(EnterpriseRental entity,HttpServletRequest request)throws Exception{
		  
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
			MultipartFile file = multipartRequest.getFile("files");
			String fileName ;
			String srcFileName= file.getOriginalFilename();
			if (srcFileName==null || srcFileName.equals("")){
				return ;
			}
			String ext = srcFileName.substring(srcFileName.lastIndexOf("."));
			fileName = UUID.randomUUID() + ext;
			String strFilePath;
			String PROJECT_LOCAL_PATH;
			String NEWS_UPLOADPath ="D:/";
			String NEWS_IMAGE_FILE_ADDR = this.getClass().getClassLoader().getResource("/").getPath().replace("WEB-INF/classes/", "")+"hzkjyFj/";
			 
		    String DRIVER_UPLOADPath ="D:/";
			String DRIVER_IMAGE_FILE_ADDR = "hzkjyFj/" + convertDate(new Date())+"/";
			PROJECT_LOCAL_PATH=getRealPath2();
			
			if (NEWS_UPLOADPath.equals("/")){
				strFilePath=PROJECT_LOCAL_PATH+ NEWS_IMAGE_FILE_ADDR+fileName;
			}else{
				  String rootPath  = "";
					rootPath  = NEWS_IMAGE_FILE_ADDR.substring(1,NEWS_IMAGE_FILE_ADDR.indexOf("hzkjyFj/"))+"hzkjyFj/";
					strFilePath=rootPath.replace("/", "\\");
					strFilePath=strFilePath.replaceAll("%20", " ")+fileName;
			}
			
			
			File newFile = new File(strFilePath);
			if(!newFile.getParentFile().exists()){
				newFile.getParentFile().mkdirs();
			}
			file.transferTo(newFile);
			entity.setAccessory(fileName);
//			private String firstImageAddr;//首页新闻图片路径
//			private String srcFileName;//首页新闻图片原文件名
//			private int hasImage;//判断此条记录是否有新闻图片，使用0和1来判断
		}
	public static String convertDate(Date date) {
		SimpleDateFormat todayDateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		return todayDateFormatter.format(date);
	}
	  public static String getRealPath2(){
	    	try{
	    		String classPath = EnterpriseRental.class.getClassLoader().getResource("/").getPath();
	    		  String rootPath  = "";
	    		  //windows下
	    		  if("\\".equals(File.separator)){   
	    		   rootPath  = classPath.substring(1,classPath.indexOf("/WEB-INF/classes"));
	    		   rootPath = rootPath.replace("/", "\\");
	    		  }
	    		  //linux下
	    		  if("/".equals(File.separator)){   
	    		   rootPath  = classPath.substring(0,classPath.indexOf("/WEB-INF/classes"));
	    		   rootPath = rootPath.replace("\\", "/");
	    		  }
	    		  rootPath=rootPath.replaceAll("%20", " ");
	    		  return rootPath;
	    	} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	    	}
	    	return "";
	    }
	@PermissionsAnno("hy_save")
	@RequestMapping(value = SAVE)
	public String save(EnterpriseRental entity, Model model) {
		if (entity.getId() == null) {
			if(Double.valueOf(entity.getHjje())-Double.valueOf(entity.getJnje()) == Double.valueOf(0)){
				entity.setSfqf("1");
			}else{
				entity.setSfqf("0");
			}
			service.insert(entity);
		} else {
			service.update(entity);
		}
		return "redirect://admin/enterpriseRental/list/1.html";
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
		return "redirect://admin/enterpriseRental/list/1.html";
	}
	
	
	@RequestMapping("ZShtg.html")
	@ResponseBody
	public String ZShtg(String ids,String examineTime,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			EnterpriseRental mdd= service.findByKey(Long.valueOf(idArr[id]));
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
		
		EnterpriseRental mdd= service.findByKey(id);
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
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && !userNo.equals("admin")){
		params.put("fhybh", userNo);
		}
		params.put("fhymc", fhymc);
		params.put("fjfyd", fjfyd);
		
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
