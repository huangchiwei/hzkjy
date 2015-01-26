package com.armysoft.hzkjy.base.util;

import jxl.*; 
import jxl.format.UnderlineStyle;
import jxl.read.biff.BiffException;
import jxl.write.*; 
import java.io.*; 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*; 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.armysoft.motorcar.model.MemberBasic;
import com.armysoft.motorcar.service.member.MemberBasicService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class ImportExcel {  
    /** 
     * 解析Excel文件中的数据并把每行数据封装成一个实�?
     * @param fis 文件输入�?
     * @return List<MemberBasic> Excel中数据封装实体的集合 
     * @throws ParseException 
     */  
    public static List<MemberBasic> importMemberBasic(InputStream fis) throws ParseException {  
    	
    	

        List<MemberBasic> memberBasicinfos = new ArrayList<MemberBasic>();  
        MemberBasic memberBasic = null;  
          
        try {  
            //打开文件  
            Workbook book = Workbook.getWorkbook(fis);  
            //得到第一个工作表对象  
            Sheet sheet = book.getSheet(0);  
            //得到第一个工作表中的总行�? 
            int rowCount = sheet.getRows();  
            //日期格式�? 
            //循环取出Excel中的内容  
            for (int i = 1; i < rowCount; i++) {  
            	Date rhdate =new Date();
            	memberBasic = new MemberBasic();  
                Cell[] cells = sheet.getRow(i);  
                memberBasic.setHymc(cells[0].getContents());
                memberBasic.setFddbr(cells[1].getContents());
                memberBasic.setLxdh(cells[2].getContents());
                memberBasic.setCz(cells[3].getContents());
                memberBasic.setJyxkh(cells[4].getContents());
                memberBasic.setYyzzh(cells[5].getContents()); 
                memberBasic.setJyfw(cells[6].getContents());
                memberBasic.setLxrxm(cells[7].getContents());
                memberBasic.setLxrdwzw(cells[8].getContents());
                memberBasic.setLxrsjhm(cells[9].getContents());
                
             
               
                
                
                memberBasic.setRhsj(rhdate);
                memberBasic.setYb(cells[11].getContents());
                memberBasic.setHydz(cells[12].getContents());
                memberBasic.setSsq(cells[13].getContents());
                memberBasic.setMunicipal(cells[14].getContents());
                memberBasic.setRhzt(cells[15].getContents());
                memberBasic.setFzjgNo(cells[16].getContents());
                memberBasic.setCyqy(cells[17].getContents());
                memberBasic.setFddbrDwzw(cells[18].getContents());
                memberBasic.setHyzcNo(cells[19].getContents());
                memberBasic.setHylbNo(cells[20].getContents());
                memberBasic.setFddbrsj(cells[21].getContents());
                memberBasic.setZlxydjNo(cells[22].getContents());
                
                memberBasicinfos.add(memberBasic);  
            }  
              
        } catch (BiffException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return memberBasicinfos;  
    }  
}  