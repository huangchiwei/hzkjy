package com.armysoft.hzkjy.controller.manage.member;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.armysoft.hzkjy.annotation.PermissionsAnno;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.Cn2Spell;
import com.armysoft.hzkjy.base.util.ExportExcel;
import com.armysoft.hzkjy.base.util.ExportExcel1;
import com.armysoft.hzkjy.base.util.ImportExcel;
import com.armysoft.hzkjy.model.MemberBasic;
import com.armysoft.hzkjy.service.member.MemberBasicService;


@Controller
@RequestMapping("member/memberBasic")
public class  MemberBasicController extends BaseController {

	@Resource
	private MemberBasicService service;
	@InitBinder   
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    }  
	/**
	 * ������ҳ��ѯ
	 * @param currentPage
	 * @param model
	 * @param entity
	 * @param request
	 * @return
	 */
	@PermissionsAnno("hy_list") 
    @RequestMapping(value = PAGE_LIST)
	public String getByPage(@PathVariable Integer currentPage,String fhymc,String fssq,String ffzjgNo, String hybh1,String dwmc,String cyqy,String hylbNo,String hyzcNo,String ssq,String fzjgNo,Model model,
			MemberBasic entity, HttpServletRequest request) {
		Pagination pager = initPage(currentPage);
		Map<String, Object> params = new HashMap<String, Object>();
		if(fhymc !="" && fhymc !=null){
		params.put("fhymc", fhymc);
		}
        model.addAttribute("list", service.getByPage(params, pager));
		request.setAttribute("zj",service.getCount(params));
		model.addAttribute("page", pager);
		model.addAttribute("model", entity);
		return "member/MemberBasicQ";
	}

	/**
	 * ����/׼���޸�
	 * @param key
	 * @param model
	 * @return
	 */
	@RequestMapping(value = DETAIL)
	public String detail(@PathVariable("id") Long key, Model model,HttpServletRequest request) {
		model.addAttribute("model", service.findByKey(key));
		return "member/MemberBasicV";
	}

	/**
	 * ׼�����
	 * @return
	 */

	@RequestMapping(value = ADD)
	public String toAdd(Long id,HttpServletRequest request,Model model) {
		
		MemberBasic mb=service.findByKey(id);
		if(mb!=null){
			model.addAttribute("model", mb);
		}
		return "member/MemberBasicV";
	}
	
	@RequestMapping(value = "/getSelectedCorpNameList.html")
	@ResponseBody
	public  List<Map<String, Object>> getSelectedCorpNameList() {
		 List<Map<String,Object>> selectedVCorpInfoList= service.getSelectedCorpNameList("1");
		return selectedVCorpInfoList;
	}

	/**
	 * ����
	 * @param entity
	 * @param model
	 * @return
	 */
	@PermissionsAnno("hy_updt")
	@RequestMapping(value = UPDATE)
	public String update(@PathVariable("id") Integer key,MemberBasic entity, Model model) {
		entity.setId(key);
		Cn2Spell cn2Spell = new Cn2Spell();
		entity.setQymcpy(cn2Spell.converterToFirstSpell(entity.getQymc()));
		System.out.println(entity.getId());
		service.update(entity);
		return "redirect://member/memberBasic/list/1.html";
	}
	@PermissionsAnno("hy_save")
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
		return "redirect://member/memberBasic/list/1.html";
	}
	
	/**
	 * ɾ��
	 * @param key
	 * @return
	 */
	@PermissionsAnno("hy_del")
	@RequestMapping(value = DELETE)
	public String delete(@PathVariable("id") Long key) {
		service.delete(key);
		return "redirect://member/memberBasic/list/1.html";
	}
	
	
	@RequestMapping(value = "/Zind.html")
	public String Zind(HttpServletRequest request) {
		return "member/MemberBasicZ";
	}
	
	@RequestMapping(value = "/Find.html")
	public String Find(HttpServletRequest request) {
		return "member/MemberBasicF";
	}
	
	@RequestMapping(value = "/inputExport.html")
	public String  OutPtqfqk(@RequestParam MultipartFile exlFile, String  nd1,String nd, HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException {
	        InputStream fis = exlFile.getInputStream();
	        //�õ�����Excel��ʵ�弯��  
	        List<MemberBasic> infos = ImportExcel.importMemberBasic(fis);  
	        
	        //��������Excel��ʵ�弯��  
	        for(MemberBasic info:infos) {  
	            //�ж�Ա������Ƿ����(���ڣ����޸Ĳ����������ڣ�����������)  
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
	               
	               if(info.getZt().equals("��԰")){
	            	   info.setZt("1");
	               }else{
	            	   info.setZt("0");
	               }
	               
	               Cn2Spell cn2Spell = new Cn2Spell();
					info.setQymcpy(cn2Spell.converterToFirstSpell(info.getQymc().replace("(","").replace("��","").replace("��","").replace(")","")));
	        	service.insert(info);
	        }  
	        request.setAttribute("exl", "ok");
	        return "member/MemberBasicF";
		
	}
	
	
	@RequestMapping("/outPtqfqk/1.html")
	public void OutPtqfqk(Model model,String fhymc,HttpServletRequest request,HttpServletResponse response) {
		String title="԰���������ϱ�";
		List headData =  new ArrayList();
		headData.add(new Object[] { "Hybh","��ҵ���"});
		headData.add(new Object[] { "Qymc","��ҵ����"});
		headData.add(new Object[] { "Address","��ַ"});
		headData.add(new Object[] { "Zydy","���õ�λ"});
		headData.add(new Object[] { "Mj","���"});
		headData.add(new Object[] { "Fzr","������"});
		headData.add(new Object[] { "Zczj","ע���ʽ�"});
		headData.add(new Object[] { "Lxr","��ϵ��"});
		headData.add(new Object[] { "ZtName","��԰��԰״̬"});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fhymc", fhymc);
		
		String userNo = super.getCookieValue(request, WebConstant.COOKIE_KEY).toLowerCase();
		
		List list =service.getCyqy(params);
         ExportExcel1 exportExcel = new ExportExcel1(title,title, headData);
		
		exportExcel.exportExcel_Applicant(request, response,list);
		
	}

}
