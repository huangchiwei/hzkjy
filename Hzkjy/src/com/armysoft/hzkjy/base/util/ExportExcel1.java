package com.armysoft.hzkjy.base.util;

import jxl.*; 
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.*; 

import java.io.*; 
import java.util.*; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class ExportExcel1 { 
	private String excelName="excel导出";
	private String sheetTitle="excel标题";
	private Object[] columnField;
	private Object[] columnCaption;
	public ExportExcel1(String excelName, String sheetTitle,List exportlist)
	  {
		this.excelName=excelName;
		this.sheetTitle=sheetTitle;
		setColumnNameAndMean(exportlist);
	  }
	private void setColumnNameAndMean(List exportlist){
		int i;
		int q;
		Object erowData[];
		Map map = new HashMap();
		List columnFieldList=new ArrayList();
		List columnCaptionList=new ArrayList();
		if (exportlist==null || exportlist.size()==0){return ;}
		for(i=0;i<exportlist.size();i++){
			erowData=(Object[]) exportlist.get(i);
			columnFieldList.add(erowData[0].toString());
			columnCaptionList.add(erowData[1].toString());
		}
		columnField= columnFieldList.toArray();
		columnCaption= columnCaptionList.toArray();
	}
	

	/**
	 * 
	 * exportExcel_Applicant(导出excel)
	 * @param response
	 * @param list ：查询的记录
	 * @param exportlist ：excel导出配置(配置里的字段名要和查询的记录中的字段名要�?��，不然会报错)
	 * @return    
	 * boolean
	 */
	public  boolean exportExcel_Applicant(HttpServletRequest request,HttpServletResponse response,List list ) {		
		try{ 
			int columnCount=columnField.length;
			OutputStream os = response.getOutputStream();// 取得输出�?  
	        response.reset();// 清空输出�?  
//	        String fileName=java.net.URLEncoder.encode(excelName, "UTF-8");
	        //String fileName=new String((excelName).getBytes("utf-8"),"ISO-8859-1");;
	        String fileName=null;
	        if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0){
	        	 fileName=new String((excelName).getBytes("utf-8"),"ISO-8859-1");
	        }else if(request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
	        	 fileName=java.net.URLEncoder.encode(excelName, "UTF-8");
	        }
	        else if(request.getHeader("User-Agent").toLowerCase().indexOf("chrome") > 0) {
	        	 fileName=java.net.URLEncoder.encode(excelName, "UTF-8");
	        }
	        response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");// 设定输出文件�?  
	        response.setContentType("application/msexcel");// 定义输出类型 
	        
	        WritableWorkbook wbook = Workbook.createWorkbook(os); // 建立excel文件   
	        String tmptitle = sheetTitle; // 标题   
	        WritableSheet wsheet = wbook.createSheet(tmptitle, 0); // sheet名称  
	        wsheet.mergeCells( 0, 0, columnCount-1, 1);//合并单元�?    
	        
			// 设置excel标题   
	       // wsheet.mergeCells( 0, 0, 5, 0);//合并单元�?
			WritableFont wfont = new WritableFont(WritableFont.ARIAL, 16,WritableFont.BOLD, 
			                       false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);   
			WritableFont wfont1 = new WritableFont(WritableFont.ARIAL, 10,WritableFont.NO_BOLD, 
                    false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);   
			WritableCellFormat wcfFC = new WritableCellFormat(wfont); 
			wcfFC.setAlignment(jxl.format.Alignment.CENTRE);
			wcfFC.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN); 
			wcfFC.setBackground(Colour.WHITE); 
			wsheet.addCell(new Label(0, 0, tmptitle, wcfFC));   
			wfont = new jxl.write.WritableFont(WritableFont.ARIAL, 0,WritableFont.BOLD, 
			                   false, UnderlineStyle.NO_UNDERLINE,Colour.BLACK);   
			wcfFC = new WritableCellFormat(wfont);  
			WritableCellFormat wcfFQ = new WritableCellFormat(wfont1); 
			wcfFQ.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN); 
//			WritableSheet.setRowView( int i, int height); // 作用是指定第i+1行的高度，比如：
			// 将第�?��的高度设�?00 sheet.setRowView( 0 , 200 );
			for(int i=0;i<columnCount;i++){
				wsheet.setColumnView(i, 10); // 作用是指定第i+1列的宽度，比如： // 将第�?��的宽度设�?0 sheet.setColumnView( 0 , 30 );.setColumnView( 0 , 30 );
			}			
			// �?��生成列标�?           
			for (int j=0 ;j<columnCount;j++){
			    wsheet.addCell(new Label(j,2, columnCaption[j].toString(),wcfFQ));   //列头部标�?
			}
			//行内�?
			Object rowData[];
			StringBuffer value=new StringBuffer("");
			for(int i=0;i<list.size();i++){   
				System.out.println(String.valueOf(list.get(i)));
				 Map p = (Map)list.get(i);
				for (int j=0 ;j<columnCount;j++){
					value.delete(0, value.length());
						if (p.get(columnField[j])==null){
							 value.append("");
						  }else{
					   value.append(p.get(columnField[j]).toString());
                    }
				    wsheet.addCell(new Label(j, i+3, value.toString(),wcfFQ));   //姓名
				}
			}   		
			
			// 主体内容生成结束           
			wbook.write(); // 写入文件   
			wbook.close();  
			os.close(); // 关闭�?
			return true; 
		}catch(Exception e) { 
			//System.out.println("列名为："+columnField.toString());
			e.printStackTrace(); 
			return false; 
		}
	} 

}