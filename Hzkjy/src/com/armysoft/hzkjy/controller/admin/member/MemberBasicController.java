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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.armysoft.core.Pagination;
import org.armysoft.security.annotation.PermissionsAnno;
import org.armysoft.security.model.sys.SysUser;
import org.armysoft.security.service.sys.SysUserService;
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

import com.alibaba.fastjson.JSONObject;
import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.BsNews;
import com.armysoft.hzkjy.model.DbMessage;
import com.armysoft.hzkjy.model.IncubatedEnterprises;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberRental;
import com.armysoft.hzkjy.service.member.BsNewsService;
import com.armysoft.hzkjy.service.member.DbMessageService;
import com.armysoft.hzkjy.service.member.IncubatedEnterprisesService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.gzjr.hzkjy.util.mail.SendEmailThread;
import com.gzjr.hzkjy.util.mail.SendnpEmailThread;


@Controller
@RequestMapping("admin/memberBasic")
public class  MemberBasicController extends BaseController {

	@Resource
	private MemberBasicService service;
	@Resource
	private DbMessageService dbservice;
	@Resource
	private BsNewsService Bsservice;
	@Resource
	private IncubatedEnterprisesService IEservice;
	@Resource
	private SysUserService sysUserService;
	
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
	@PermissionsAnno("mb_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fzt,String fsfjjyb,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			MemberBasic entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		pager.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		if(userNo !="" && userNo !=null && userNo.substring(0, 4).equals("4401")){
		params.put("fhybh", userNo);
		request.setAttribute("userNo", userNo.substring(0, 4));
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
		if(fsfjjyb !="" && fsfjjyb !=null){
			params.put("fsfjjyb", fsfjjyb);
			request.setAttribute("fsfjjyb",fsfjjyb);
			}
		if(fzt !="" && fzt !=null){
			params.put("fzt", fzt);
			request.setAttribute("fzt",fzt);
			}
		
        model.addAttribute("list", service.getByPage(params, pager));
        
        request.setAttribute("messagelist", service.getMessage(params));
		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "admin/member/MemberBasicQ";
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

	
	@RequestMapping(value = "/getNd.html")
	@ResponseBody
	public  String getSqsj(HttpServletRequest request,HttpServletResponse response) {
		String hybh = request.getParameter("hybh");
		String nd = request.getParameter("nd");
		IncubatedEnterprises mr=IEservice.findIeHybhS(hybh,nd);
		JSONObject jsonObject = new JSONObject();
		if(mr!=null){
			
			jsonObject.put("qymc",mr.getQymc());
			jsonObject.put("zczb",mr.getZczb());
			jsonObject.put("frdb",mr.getFrdb());
			jsonObject.put("frlxdh",mr.getFrlxdh());
			jsonObject.put("lxr",mr.getLxr()); 
			jsonObject.put("lxrdh",mr.getLxrlxdh());
			jsonObject.put("qyrzsj",mr.getQyrzsj());
			
			jsonObject.put("fmzl",mr.getFmzl());
			jsonObject.put("syxx",mr.getSyxx());
			jsonObject.put("wgsj",mr.getWgsj());
			jsonObject.put("rjzzq",mr.getRjzzq());
			jsonObject.put("htstze",mr.getHtstze());
			jsonObject.put("dzys",mr.getDzys());
			jsonObject.put("xnyjdxs",mr.getXnyjdxs());
		}else if(nd.equals("2015")){
			MemberBasic mb=service.findByHybh(hybh);
			jsonObject.put("fmzl",mb.getFmzl());
			jsonObject.put("syxx",mb.getSyxx());
			jsonObject.put("wgsj",mb.getWgsj());
			jsonObject.put("rjzzq",mb.getRjzzq());
			jsonObject.put("htstze",mb.getHtstze());
			jsonObject.put("dzys",mb.getDzys());
			jsonObject.put("xnyjdxs",mb.getXnyjdxs());
			

			jsonObject.put("qymc",mb.getQymc());
			jsonObject.put("zczb",mb.getZczb());
			jsonObject.put("frdb",mb.getFrdb());
			jsonObject.put("frlxdh",mb.getFrlxdh());
			jsonObject.put("lxr",mb.getLxr()); 
			jsonObject.put("lxrdh",mb.getLxrdh());
			jsonObject.put("qyrzsj",mb.getQyrzsj());
			
		}else{
			jsonObject.put("fmzl","");
			jsonObject.put("syxx","");
			jsonObject.put("wgsj","");
			jsonObject.put("rjzzq","");
			jsonObject.put("htstze","");
			jsonObject.put("dzys","");
			jsonObject.put("xnyjdxs","");
			
			jsonObject.put("qymc","");
			jsonObject.put("zczb","");
			jsonObject.put("frdb","");
			jsonObject.put("frlxdh","");
			jsonObject.put("lxr",""); 
			jsonObject.put("lxrdh","");
			jsonObject.put("qyrzsj","");
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
	 * 准备添加
	 * @return
	 */
	@RequestMapping("Pltz.html")
	@ResponseBody
	public String Pltz(String ids,String selectval,String examineTime,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		String[] idArr = ids.split(",");
		JSONObject jsonObject = new JSONObject();
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
			
			bs.setActiveTime(dtFrom);
			bs.setIseveryone("0");
			bs.setReceiver(mdd.getQymc());
			bs.setReceiverBh(mdd.getHybh());
			bs.setIsReport("1");
			DbMessage dbmessage=dbservice.findByKey(Long.valueOf(selectval));
			bs.setTitle(dbmessage.getMessagename());
			String content=dbmessage.getMessage();
			bs.setContent(content);
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
	

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		if(id!=null){
		MemberBasic mb=service.findByKey(id);
		IncubatedEnterprises ie=IEservice.findIeHybhM(mb.getHybh());
		if(ie!=null){
		request.setAttribute("year", ie.getSsn());
		}else{
			request.setAttribute("year", "2015");
		}
		
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		}
		return "admin/member/MemberBasicV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= service.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}
	@RequestMapping(value = "/getAllMember.html")
	@ResponseBody
	public  List<Map<String, Object>> getAllMember() {
		 List<Map<String,Object>> list=service.getAllMember();
		return list;
	}
	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("mb_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberBasic entity, Model model) {
		entity.setId(key);
		Cn2Spell cn2Spell = new Cn2Spell();
		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
		System.out.println(entity.getId());
		service.update(entity);
		//激活和发送邮件
		SysUser user = sysUserService.getByUserNo(entity.getHybh());
		sysUserService.updateStatus(user.getUserNo(), Constants.USER_ACTIVE);
		new SendEmailThread(user.getEmail(), user.getUserNo(), Constants.DEFAULT_PASSWORD).start();
		return "redirect://admin/memberBasic/list/1.html";
	}
	
	
	@RequestMapping("Shbtg.html")
	@ResponseBody
	public String Shbtg(String id,MemberBasic entity, Model model,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		MemberBasic mb=service.findByKey(Long.valueOf(id));
		JSONObject jsonObject = new JSONObject();
		SysUser user = sysUserService.getByUserNo(mb.getHybh());
		new SendnpEmailThread(user.getEmail(), user.getUserNo(), Constants.DEFAULT_PASSWORD).start();
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
	@PermissionsAnno("mb_save")
	@RequestMapping(value = SAVE)
	public String save(MemberBasic entity, Model model) {
		if (entity.getId() == null) {
			Cn2Spell cn2Spell = new Cn2Spell();
			entity.setQymcpy(cn2Spell.converterToFirstSpell(StringFilter(entity.getQymc())));
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
	public   String StringFilter(String   str)   throws   PatternSyntaxException   {      
		  // 只允许字母和数字        
		  // String   regEx  =  "[^a-zA-Z0-9]";                      
		  // 清除掉所有特殊字符   
		  String regEx="[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";   
		  Pattern   p   =   Pattern.compile(regEx);      
		  Matcher   m   =   p.matcher(str);      
		  return   m.replaceAll("").trim();      
		   }
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@PermissionsAnno("mb_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://admin/memberBasic/list/1.html";
	}
	
	
		@RequestMapping("Zcsave.html")
	public String zcsave(String id,MemberBasic entity, Model model) throws ParseException {
			entity.setId(Integer.valueOf(id));
			
			Cn2Spell cn2Spell = new Cn2Spell();
			entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
			System.out.println(entity.getId());
			service.update(entity);
			return "redirect://admin/memberBasic/list/1.html";
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
	public void OutPtqfqk(Model model,String fsfjjyb,String fhymc,String frysjf,String frysje, String fhtqxf,String fhtqxe,Integer nd,HttpServletRequest request,HttpServletResponse response) {
		String title="园区基本资料表";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Hybh","企业编号"});
		headData.add(new Object[] { "Qymc","企业名称"});
		headData.add(new Object[] { "Zydy","租用地址"});
		headData.add(new Object[] { "Mj","面积"});
		headData.add(new Object[] { "Zczb","注册资本"});
		headData.add(new Object[] { "Frdb","法人代表"});
		headData.add(new Object[] { "Frlxdh","联系电话"});
		headData.add(new Object[] { "Zzjgdm","组织机构代码"});
		headData.add(new Object[] { "Dzys","大专以上（人）"});
		headData.add(new Object[] { "Xnyjdxs","吸纳应届大学毕业生（人）"});
		headData.add(new Object[] { "Fmzl","发明专利（件）"});
		headData.add(new Object[] { "Wgsj","外观设计（个）"});
		headData.add(new Object[] { "Syxx","实用新型（件）"});
		headData.add(new Object[] { "Rjzzq","软件著作权（个）"});
		headData.add(new Object[] { "Qyrzsj","入驻时间"});
		headData.add(new Object[] { "Htqxf","合同期限至"});
		headData.add(new Object[] { "Htqxe","合同期限"});
		headData.add(new Object[] { "ZtName","状态"});
		headData.add(new Object[] { "Lxr","联系人"});
		headData.add(new Object[] { "Lxrdh","联系电话"});
		headData.add(new Object[] { "SfjjybName","经济月报"});
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		params.put("frysjf", frysjf);
		params.put("frysje", frysje);
		params.put("fhtqxf", fhtqxf);
		params.put("fhtqxe", fhtqxe);
		params.put("fsfjjyb", fsfjjyb);
		params.put("nd", nd);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		List list =null;
		if(nd!=null && nd>=2005){
			list =IEservice.getCyqy(params);
		}else{
			list =service.getCyqy(params);
		}
		
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
