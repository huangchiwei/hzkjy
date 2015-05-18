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
public class RentStatisticsExcel { 
	private String excelName="excel导出";
	private String sheetTitle="excel标题";
	private Object[] columnField;
	private Object[] columnField1;
	private Object[] columnCaption;
	public RentStatisticsExcel(String excelName, String sheetTitle,List exportlist,List exportlist1)
	  {
		this.excelName=excelName;
		this.sheetTitle=sheetTitle;
		setColumnNameAndMean(exportlist);
		setColumnNameAndMean1(exportlist1);
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
	private void setColumnNameAndMean1(List exportlist1){
		int i;
		int q;
		Object erowData[];
		Map map = new HashMap();
		List columnFieldList1=new ArrayList();
		if (exportlist1==null || exportlist1.size()==0){return ;}
		for(i=0;i<exportlist1.size();i++){
			erowData=(Object[]) exportlist1.get(i);
			columnFieldList1.add(erowData[0].toString());
		}
		columnField1= columnFieldList1.toArray();
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
	public  boolean exportExcel_Applicant(HttpServletRequest request,HttpServletResponse response,List list,List list2,List list3,List list4,List list5,List list6,List list7,List countHyfl1List,List countHyfl2List,List countHyfl3List,List countHyfl4List,List countHyfl5List,List countHyfl6List,List countHyfl7List,String fjjzbNy ) {		
		try{ 
			int columnCount=columnField.length;
			int columnCount1=columnField1.length;
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
			                       false,UnderlineStyle.NO_UNDERLINE,Colour.RED);   
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
 			wsheet.mergeCells(2, 1, columnCount-1, 1);//合并单元�?     
			wsheet.addCell(new Label(0, 2, "",wcfFQ)); 
			wsheet.addCell(new Label(columnCount-1, 2 , "单位：元 ",wcfFQ));    
			// 将第�?��的高度设�?00 sheet.setRowView( 0 , 200 );
			wsheet.mergeCells(0, 3, 1, 3);//合并垮了3列。
	         wsheet.addCell(new Label(0, 3, "位置",wcfFQ));   
	         wsheet.mergeCells(2, 3, 2, 3);//合并垮了3列。
	         wsheet.addCell(new Label(2, 3, "租金",wcfFQ));  
	         wsheet.mergeCells(3, 3, 3, 3);//合并垮了3列。
	         wsheet.addCell(new Label(3, 3, "管理服务费/管理费/物业管理费",wcfFQ));  
	         wsheet.mergeCells(4, 3, 4, 3);//合并垮了3列。
	         wsheet.addCell(new Label(4, 3, "水费/水电公摊费",wcfFQ));  
	         wsheet.mergeCells(5, 3, 5, 3);//合并垮了3列。
	         wsheet.addCell(new Label(5, 3, "电费",wcfFQ)); 
	         wsheet.mergeCells(6, 3, 6, 3);//合并垮了3列。
	         wsheet.addCell(new Label(6, 3, "租赁保证金",wcfFQ)); 
	         wsheet.mergeCells(7, 3, 7, 3);//合并垮了3列。
	         wsheet.addCell(new Label(7, 3, "装修押金",wcfFQ)); 
	         wsheet.mergeCells(8, 3, 8, 3);//合并垮了3列。
	         wsheet.addCell(new Label(8, 3, "缴费确认",wcfFQ));
	         wsheet.mergeCells(9, 3, 9, 3);//合并垮了3列。
	         wsheet.addCell(new Label(9, 3, "欠费金额",wcfFQ));
			for(int i=0;i<columnCount;i++){
				wsheet.setColumnView(i, 10); // 作用是指定第i+1列的宽度，比如： // 将第�?��的宽度设�?0 sheet.setColumnView( 0 , 30 );.setColumnView( 0 , 30 );
			}			
			// �?��生成列标�?           
			
			int countHyfl1=0;
			int countHyfl2=0;
			int countHyfl3=0;
			int countHyfl4=0;
			int countHyfl5=0;
			int countHyfl6=0;
			int countHyfl7=0;
			if(countHyfl1List.get(0)==null){
				countHyfl1=0;
			}else{
				countHyfl1=1;
			}
			if(countHyfl2List.get(0)==null){
				countHyfl2=0;
			}else{
				countHyfl2=1;
			}
			if(countHyfl3List.get(0)==null){
				countHyfl3=0;
			}else{
				countHyfl3=1;
			}
			if(countHyfl4List.get(0)==null){
				countHyfl4=0;
			}else{
				countHyfl4=1;
			}
			if(countHyfl5List.get(0)==null){
				countHyfl5=0;
			}else{
				countHyfl5=1;
			}
			if(countHyfl6List.get(0)==null){
				countHyfl6=0;
			}else{
				countHyfl6=1;
			}
			if(countHyfl7List.get(0)==null){
				countHyfl7=0;
			}else{
				countHyfl7=1;
			}
//			
//			
////			for (int j=0 ;j<columnCount;j++){
////			    wsheet.addCell(new Label(j,6, columnCaption[j].toString(),wcfFQ));   //列头部标�?
////			}
//			//行内�?
			Object rowData[];
			StringBuffer value=new StringBuffer("");
			if(list!=null){
			for(int i=0;i<list.size();i++){   
				System.out.println(String.valueOf(list.get(i)));
				 Map p = (Map)list.get(i);
				 if(p!=null){
				for (int j=0 ;j<columnCount;j++){
					value.delete(0, value.length());
						if (p.get(columnField[j])==null){
							 value.append("空");
						  }else{
					   value.append(p.get(columnField[j]).toString());
                    }
						if(j!=0){
							wsheet.addCell(new Label(j, i+4, value.toString(),wcfFQ));
						}
						
				       //姓名
				}
				 }
				if(i==list.size()-1){
					wsheet.mergeCells(0, 4, 0, i+4);
					 wsheet.addCell(new Label(0, 4, "生物/医药技术业",wcfFQ));   
				}
			}  
			}
			
			if(countHyfl1List!=null){
				for(int h=0;h<countHyfl1List.size();h++){   
					System.out.println(String.valueOf(countHyfl1List.get(h)));
					 Map p = (Map)countHyfl1List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size(), 1, 4+list.size());
					 wsheet.addCell(new Label(0, 4+list.size(), "小计：",wcfFQ));   
					
					for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
//			
//			
			if(list2!=null){
			for(int i2=0;i2<list2.size();i2++){   
				System.out.println(String.valueOf(list2.get(i2)));
				 Map p2 = (Map)list2.get(i2);
				 if(p2!=null){
				for (int j2=0 ;j2<columnCount;j2++){
					value.delete(0, value.length());
						if (p2.get(columnField[j2])==null){
							 value.append("空");
						  }else{
					   value.append(p2.get(columnField[j2]).toString());
                    }
						
						if(j2!=0){
							wsheet.addCell(new Label(j2, i2+4+list.size()+countHyfl1, value.toString(),wcfFQ));
						}
				   
				}
				 }
				if(i2==list2.size()-1){
					wsheet.mergeCells(0, 4+list.size()+countHyfl1, 0, i2+4+list.size()+countHyfl1);
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1, "电子与信息业",wcfFQ));   
				}
			}
			}
			
			if(countHyfl2List!=null){
				for(int h=0;h<countHyfl2List.size();h++){   
					System.out.println(String.valueOf(countHyfl2List.get(h)));
					 Map p = (Map)countHyfl2List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size(), 1, 4+list.size()+countHyfl1+list2.size());
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size(), "小计：",wcfFQ));   
					
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list4.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
//			
			if(list3!=null){
				for(int i3=0;i3<list3.size();i3++){   
					 Map p3 = (Map)list3.get(i3);
					 if(p3!=null){
					for (int j3=0 ;j3<columnCount;j3++){
						value.delete(0, value.length());
							if (p3.get(columnField[j3])==null){
								 value.append("空");
							  }else{
						   value.append(p3.get(columnField[j3]).toString());
	                    }
							if(j3!=0){
								 wsheet.addCell(new Label(j3, i3+4+list.size()+list2.size()+countHyfl1+countHyfl2, value.toString(),wcfFQ));
							}
					      //姓名
					}
					 }
					if(i3==list3.size()-1){
						wsheet.mergeCells(0, 4+list.size()+list2.size()+countHyfl1+countHyfl2, 0, i3+4+list.size()+list2.size()+countHyfl1+countHyfl2);
						 wsheet.addCell(new Label(0, 4+list.size()+list2.size()+countHyfl1+countHyfl2, "新材料技术/新材料业",wcfFQ));   
					}
				}
				}
			if(countHyfl3List!=null){
				for(int h=0;h<countHyfl3List.size();h++){   
					System.out.println(String.valueOf(countHyfl3List.get(h)));
					 Map p = (Map)countHyfl3List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size(), 1, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size());
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size(), "小计：",wcfFQ));   
					 
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
			if(list4!=null){
				for(int i4=0;i4<list4.size();i4++){   
					System.out.println(String.valueOf(list2.get(i4)));
					 Map p4 = (Map)list4.get(i4);
					 if(p4!=null){
					for (int j4=0 ;j4<columnCount;j4++){
						value.delete(0, value.length());
							if (p4.get(columnField[j4])==null){
								 value.append("空");
							  }else{
						   value.append(p4.get(columnField[j4]).toString());
	                    }
							if(j4!=0){
					    wsheet.addCell(new Label(j4, i4+4+list.size()+list2.size()+list3.size()+countHyfl1+countHyfl2+countHyfl3, value.toString(),wcfFQ));   //姓名
					 }
					}
					 }
					if(i4==list4.size()-1){
						wsheet.mergeCells(0, 4+list.size()+list2.size()+list3.size()+countHyfl1+countHyfl2+countHyfl3, 0, i4+4+list.size()+list2.size()+list3.size()+countHyfl1+countHyfl2+countHyfl3);
						 wsheet.addCell(new Label(0, 4+list.size()+list2.size()+list3.size()+countHyfl1+countHyfl2+countHyfl3, "展览服务",wcfFQ));   
					}
				}
				}
			
			if(countHyfl4List!=null){
				for(int h=0;h<countHyfl4List.size();h++){   
					System.out.println(String.valueOf(countHyfl4List.get(h)));
					 Map p = (Map)countHyfl4List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size(),1, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size());
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size(), "小计：",wcfFQ));   
					 
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
			
			if(list5!=null){
				for(int i5=0;i5<list5.size();i5++){   
					 Map p5 = (Map)list5.get(i5);
					for (int j5=0 ;j5<columnCount;j5++){
						value.delete(0, value.length());
							if (p5.get(columnField[j5])==null){
								 value.append("空");
							  }else{
						   value.append(p5.get(columnField[j5]).toString());
	                    }
							if(j5!=0){
					    wsheet.addCell(new Label(j5, i5+4+list.size()+list2.size()+list3.size()+list4.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4, value.toString(),wcfFQ));   //姓名
					}
					}
					if(i5==list5.size()-1){
						wsheet.mergeCells(0, 4+list.size()+list2.size()+list3.size()+list4.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4, 0, i5+4+list.size()+list2.size()+list3.size()+list4.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4);
						 wsheet.addCell(new Label(0, 4+list.size()+list2.size()+list3.size()+list4.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4, "其他",wcfFQ));   
					}
				}
				}
			
			if(countHyfl5List!=null){
				for(int h=0;h<countHyfl5List.size();h++){   
					System.out.println(String.valueOf(countHyfl5List.get(h)));
					 Map p = (Map)countHyfl5List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size(), 1, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size());
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size(), "小计：",wcfFQ));   
					
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
					
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
			
			if(list6!=null){
				for(int i6=0;i6<list6.size();i6++){   
					 Map p6 = (Map)list6.get(i6);
					for (int j6=0 ;j6<columnCount;j6++){
						value.delete(0, value.length());
							if (p6.get(columnField[j6])==null){
								 value.append("空");
							  }else{
						   value.append(p6.get(columnField[j6]).toString());
	                    }
							if(j6!=0){
					    wsheet.addCell(new Label(j6, i6+4+list.size()+list2.size()+list3.size()+list4.size()+list5.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4+countHyfl5, value.toString(),wcfFQ));   //姓名
					}
					}
					if(i6==list6.size()-1){
						wsheet.mergeCells(0, 4+list.size()+list2.size()+list3.size()+list4.size()+list5.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4+countHyfl5, 0, i6+4+list.size()+list2.size()+list3.size()+list4.size()+list5.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4+countHyfl5);
						 wsheet.addCell(new Label(0, 4+list.size()+list2.size()+list3.size()+list4.size()+list5.size()+countHyfl1+countHyfl2+countHyfl3+countHyfl4+countHyfl5, "工业",wcfFQ));   
					}
				}
				}
			if(countHyfl6List!=null){
				for(int h=0;h<countHyfl6List.size();h++){   
					System.out.println(String.valueOf(countHyfl6List.get(h)));
					 Map p = (Map)countHyfl6List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size(),1, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size());
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size(), "小计：",wcfFQ));   
					 
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
					
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size(), value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
				}  
				}
//			
//			
//			
			if(countHyfl7List!=null){
				for(int h=0;h<countHyfl7List.size();h++){   
					System.out.println(String.valueOf(countHyfl7List.get(h)));
					 Map p = (Map)countHyfl7List.get(h);
					 if(p!=null){
					 wsheet.mergeCells(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size()+countHyfl6, 1, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size()+countHyfl6);
					 wsheet.addCell(new Label(0, 4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size()+countHyfl6, "合计：",wcfFQ));   
					
					 for (int j=0 ;j<columnCount1;j++){
						value.delete(0, value.length());
							if (p.get(columnField1[j])==null){
								 value.append("空");
							  }else{
						   value.append(p.get(columnField1[j]).toString());
	                    }
                         
                            		wsheet.addCell(new Label(j+1, h+4+list.size()+countHyfl1+list2.size()+countHyfl2+list3.size()+countHyfl3+list4.size()+countHyfl4+list5.size()+countHyfl5+list6.size()+countHyfl6, value.toString(),wcfFQ));
								
							
							
					       //姓名
					}
					 }
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