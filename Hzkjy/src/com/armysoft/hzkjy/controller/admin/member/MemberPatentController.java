package com.armysoft.hzkjy.controller.admin.member;

import java.text.DateFormat;
import java.text.ParseException;
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
import org.armysoft.security.annotation.PermissionsAnno;
import org.armysoft.springmvc.controller.BaseController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.armysoft.hzkjy.base.common.Constants;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.model.IncubatedEnterprises;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.model.MemberIntellectualPro;
import com.armysoft.hzkjy.model.MemberPatent;
import com.armysoft.hzkjy.service.member.IncubatedEnterprisesService;
import com.armysoft.hzkjy.service.member.MemberBasicService;
import com.armysoft.hzkjy.service.member.MemberIntellectualProService;
import com.armysoft.hzkjy.service.member.MemberPatentService;

/**
 * 专利
 * @author Administrator
 *
 */
@Controller
@RequestMapping("admin/memberPatent")
public class  MemberPatentController extends BaseController {

	@Resource
	private MemberPatentService memberPatentService;
	@Resource
	private MemberBasicService memberBasicService;
	@Resource
	private IncubatedEnterprisesService incubatedEnterprisesService;
	
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
	@PermissionsAnno("patent_list")
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage, HttpServletRequest request, Model model,String year,String month) {
		Pagination pager = initPage(currentPage);
		pager.setPageSize(10);
		Map<String, Object> params = new HashMap<String, Object>();
		if(year!=null)
			params.put("year", year);
			else params.put("year",  Calendar.getInstance().get(Calendar.YEAR));
			if(month!=null)
			params.put("month", month);
		String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(userNo.substring(0, 4).equals("4401"))
		params.put("memberNo", userNo);
        model.addAttribute("list", memberPatentService.getByPage(params, pager));
		model.addAttribute("page", pager);
		model.addAttribute("params", params);
		System.out.println(System.getProperty("java.endorsed.dirs"));
		return "admin/member/MemberPatentQ";
	}


    @RequestMapping(value ="/updateStatus/${id}.html" )
	public String updateStatus(@PathVariable("id") Long key,HttpServletRequest request,Model model,Integer status) {
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("id", key);
    	params.put("status", status);
    	memberPatentService.updateStatus(params);
		return "admin/member/MemberPatentA_U";
	}
	
	/**
	 * 准备添加
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
	/*	String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(userNo.equals("admin")){
			List<Map<String,Object>> list=memberBasicService.getAllMember();
			model.addAttribute("list", list);
		}*/
		model.addAttribute("ptype", "A");
		return "admin/member/MemberPatentA_U";
	}
	

	/**
	 * 保存
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Long key,MemberIntellectualPro entity,HttpServletRequest request, Model model) {
		/*String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
		if(userNo.equals("admin")){
			List<Map<String,Object>> list=memberBasicService.getAllMember();
			model.addAttribute("list", list);
		}*/
		model.addAttribute("ptype", "U");
		model.addAttribute("entity",memberPatentService.findByKey(key));
		return "admin/member/MemberPatentA_U";
	}
	
	
	
	@RequestMapping(value = SAVE)
	public String save(HttpServletRequest request,MemberPatent entity, Model model,String ptype) {
		if(ptype.equals("U")){
			memberPatentService.update(entity);
		}else if(ptype.equals("A")){
			if(entity.getId()==null){
				String name1=new String(entity.getName());
				String type1=new String(entity.getType());
				String patentNo1=new String(entity.getPatentNo());
				String MemberNo="";
				
				if(entity.getMemberNo()==null || entity.getMemberNo().isEmpty()){
					String userNo = super.getCookieValue(request, Constants.ADMIN_KEY);
					MemberNo=userNo;
				}else{
					MemberNo=entity.getMemberNo();
				}
				  String[] name2 = name1.split(",");
				  String[] type2 = type1.split(",");
				  String[] patentNo2 = patentNo1.split(",");
				
				  
				  for (int i = 0; i < type2.length; i++) {  
					  MemberPatent mp=new MemberPatent();
					  mp.setMonth(entity.getMonth());
					  mp.setYear(entity.getYear());
					  mp.setName(name2[i]);
					  mp.setType(type2[i]);
					  mp.setPatentNo(patentNo2[i]);
					  mp.setMemberNo(MemberNo);
					 
							/*专利各项值累加*/
							
							/*end */
					  memberPatentService.insert(mp);
					 
				  }
				  /*累加值插入到孵化企业*/
				  
				  /*end */
			}
		
		}
		return "redirect://admin/memberPatent/list/1.html";
	}
	
	/**
	 * 删除
	 * @param key
	 * @return
	 */
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		memberPatentService.delete(key);
		return "redirect://admin/memberPatent/list/1.html";
	}
	@PermissionsAnno("pass")
	@RequestMapping("pass.html")
	@ResponseBody
	public String pass(String ids,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		String mpType="";
		String mpMemberNo="";
		String mpYear="";
		  String Fmzl="";
		  String Wgsj="";
		  String Syxx="";
		  String Rjzzq="";
		  String upYear="";
		for(int id=0;id<idArr.length;id++){
			Map<String, Object> params = new HashMap<String, Object>();
	    	params.put("id", idArr[id].trim());
	    	params.put("status", "1");
	    	memberPatentService.updateStatus(params);
	    	Map<String, Object> mp= memberPatentService.findByKey(Long.valueOf(idArr[id].toString()));
	    	
	    	mpType=mp.get("Type").toString();
	    	mpMemberNo=mp.get("MemberNo").toString();
	    	mpYear=mp.get("Year").toString();
	    	IncubatedEnterprises ie = incubatedEnterprisesService.findIeHybh(mpMemberNo, mpYear);
	    	IncubatedEnterprises ie2 =null;
	    	if(ie!=null){
				if(mpType.equals("0")){
					Fmzl=String.valueOf(Integer.valueOf(ie.getFmzl())+1);
				}else if(mpType.equals("1")){
					Syxx=String.valueOf(Integer.valueOf(ie.getSyxx())+1);
					
				}else if(mpType.equals("2")){
					Wgsj=String.valueOf(Integer.valueOf(ie.getWgsj())+1);
				}else if(mpType.equals("3")){
					Rjzzq=String.valueOf(Integer.valueOf(ie.getRjzzq())+1);
				}
			}
	    	if(ie==null){
	    		
	    		if(Integer.valueOf(mpYear)>2015){
	    			for(int i=Integer.valueOf(mpYear);i>2015;i--){
	    				upYear=String.valueOf(i);
	    			    ie2 = incubatedEnterprisesService.findIeHybh(mpMemberNo, upYear);
	    			    if(ie2!=null) {
					        break;
					     }
	    			}
	    		}
	    			MemberBasic mb=memberBasicService.findMbHybh(mpMemberNo);
	    		
	    		
				if(ie2!=null){
					if(mpType.equals("0")){
						Fmzl=String.valueOf(Integer.valueOf(ie2.getFmzl())+1);
					}else if(mpType.equals("1")){
						Syxx=String.valueOf(Integer.valueOf(ie2.getSyxx())+1);
						
					}else if(mpType.equals("2")){
						Wgsj=String.valueOf(Integer.valueOf(ie2.getWgsj())+1);
					}else if(mpType.equals("3")){
						Rjzzq=String.valueOf(Integer.valueOf(ie2.getRjzzq())+1);
					}
					
				}else{
					if(mpType.equals("0")){
						Fmzl=String.valueOf(Integer.valueOf(mb.getFmzl())+1);
					}else if(mpType.equals("1")){
						Syxx=String.valueOf(Integer.valueOf(mb.getSyxx())+1);
					}else if(mpType.equals("2")){
						Wgsj=String.valueOf(Integer.valueOf(mb.getWgsj())+1);
					}else if(mpType.equals("3")){
						Rjzzq=String.valueOf(Integer.valueOf(mb.getRjzzq())+1);
					}
					
				}
				}
				
	    	if(ie==null){
				  IncubatedEnterprises ii=new IncubatedEnterprises();
				  MemberBasic mb=memberBasicService.findMbHybh(mpMemberNo);
				 ii.setDzys(mb.getDzys());
				 if(Fmzl==""){
					 ii.setFmzl(mb.getFmzl());
				 }else{
					 ii.setFmzl(Fmzl);
				 }
				
				 ii.setFrdb(mb.getFrdb());
				 ii.setFrlxdh(mb.getFrlxdh());
				 ii.setGxjsqy(mb.getGxjsqy());
				 ii.setHtstze(mb.getHtstze());
				 ii.setHylb(mb.getHylb());
				 ii.setLxr(mb.getLxr());
				 ii.setLxrlxdh(mb.getLxrdh());
				 ii.setLxryqy(mb.getLxryqy());
				 ii.setQyclsj(mb.getQyclsj());
				 ii.setQydjzclx(mb.getQydjzclx());
				 ii.setQymc(mb.getQymc());
				 ii.setQyrzsj(mb.getQyrzsj());
				 ii.setQyssjsly(mb.getQyssjsly());
				 
				 if(Rjzzq==""){
					 ii.setRjzzq(mb.getRjzzq());
				 }else{
					 ii.setRjzzq(Rjzzq);
				 }
			
				 ii.setSsn(mpYear);
				 ii.setSynyxzscq(mb.getSynyxzscq());
				 
				 if(Syxx==""){
					 ii.setSyxx(mb.getSyxx());
				 }else{
					 ii.setSyxx(Syxx);
				 }
				 
				 if(Wgsj==""){
					 ii.setWgsj(mb.getWgsj());
				 }else{
					 ii.setWgsj(Wgsj);
				 }
				 ii.setXnyjdxs(mb.getXnyjdxs());
				 ii.setZczb(mb.getZczb());
				 ii.setZzjgdm(mb.getZzjgdm());
				 ii.setHybh(mpMemberNo);
				 incubatedEnterprisesService.insert(ii);
			  }else{
				  if(Fmzl==""){
						 Fmzl=ie.getFmzl();
					 }
				  if(Wgsj==""){
					  Wgsj=ie.getWgsj();
					 }
				  if(Syxx==""){
					  Syxx=ie.getSyxx();
					 }
				  if(Rjzzq==""){
					  Rjzzq=ie.getRjzzq();
					 }
				  memberPatentService.updateType(Fmzl, Wgsj, Syxx, Rjzzq, mpMemberNo, mpYear);
			  }
		}

		return "";
	}
	@PermissionsAnno("rollBack")
	@RequestMapping("rollBack.html")
	@ResponseBody
	public String roolBack(String ids,HttpServletRequest request) throws ParseException {
		String[] idArr = ids.split(",");
		
		for(int id=0;id<idArr.length;id++){
			Map<String, Object> params = new HashMap<String, Object>();
	    	params.put("id", idArr[id].trim());
	    	params.put("status", "0");
	    	memberPatentService.updateStatus(params);
		}
		
		
		return "";
	}
	
	/**
	 * 导出excel
	 * @param model
	 * @param fhymc
	 * @param request
	 * @param response
	 */
	@RequestMapping("/outExcel/1.html")
	public void outExcel(Model model,Integer year,Integer month,HttpServletRequest request,HttpServletResponse response) {
		
		String title;
		if(month!=null){
			title=year+"琶洲园区企业专利获得情况"+(month==0?"1~6月":"7~12月");
		}else{
			title=year+"琶洲园区企业专利获得情况";
		}
		List headData =  new ArrayList();
		headData.add(new Object[] { "RowNo","序号"});
		headData.add(new Object[] { "Qymc","企业"});
		headData.add(new Object[] { "Type","专利类别"});
		headData.add(new Object[] { "Name","专利名称"});
		headData.add(new Object[] { "PatentNo","专利编号"});
		//headData.add(new Object[] { "ApplyTime","获取时间"});

		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("year", year+"");
		params.put("month", month+"");
		//String userNo = super.getCookieValue(request, Constants.ADMIN_KEY).toLowerCase();
		
		List<Map<String, Object>>  list =memberPatentService.findAll(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}
}
