<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/adminthemes/css/style.css" type="text/css"
			rel="stylesheet" />
		<link href="${ctx}/adminthemes/default/css/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/adminthemes/default/css/default.css"
			rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx }/js/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/tooltip/jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/tooltip/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${ctx}/js/tooltip/jquery.dimensions.js" type="text/javascript"></script>
<script src="${ctx}/js/tooltip/jquery.tooltip.js" type="text/javascript"></script>
<script src="${ctx}/js/tooltip/chili-1.7.pack.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#hyfl option[value='${model.hyfl}']").attr("selected", true);  
	 
	formInitConfig("add_form",3000);
	autoValidate();
		
});

    
  var dwmc=""   
function loadQyxx(){

 dwmc=$("#rzqy").val();
 if(dwmc !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+dwmc+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  	    $("#hybh").attr("value",data.hybh);
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 

var corpNameJson="";


function loadCorpName(){
	if(corpNameJson!=""){
		corpAutocomplete(corpNameJson);
		}else{
			$.ajax({
				url:'${ctx}/admin/memberBasic/getSelectedCorpNameList.html?random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  			corpAutocomplete(data);
		  			corpNameJson=data;
		  		},
		  		error:function(){
		  			alert('失败');
		  		} 
		  		
		  	});
			}
}
function corpAutocomplete(data){
	$("#rzqy").autocomplete(data,{
			 minChars:0,
			matchContains: true,
			//autoFill:true,
			//mustMatch:true,
			dataType:"json",
			formatItem: function(row, i, max) {
	                 return row.qymc;
	            },
	            formatMatch: function(row, i, max) {
	                 return row.qymc + row.qymcpy;
	            },
	            formatResult: function(row) {
	                 return row.qymc;
	            }
		}).result(function(event, data, formatted) {
			 
	});
}

	function sum(){
	var lrzeBys;
   if($("#lrzeBys").val()==""){
	lrzeBys="0.0";
	}else{
	lrzeBys=$("#lrzeBys").val();
	}
	  if($("#nsBys").val()==""){
	nsBys="0.0";
	}else{
	nsBys=$("#nsBys").val();
	}
	
		var sum=parseFloat(lrzeBys)+parseFloat(nsBys);
	  $("#lszeBys").attr("value",sum);
	}
	function sumlj(){
	var lrzeLjs;
   if($("#lrzeLjs").val()==""){
	lrzeLjs="0.0";
	}else{
	lrzeLjs=$("#lrzeLjs").val();
	}
	  if($("#nsLjs").val()==""){
	nsLjs="0.0";
	}else{
	nsLjs=$("#nsLjs").val();
	}
	
		var sum=parseFloat(lrzeLjs)+parseFloat(nsLjs);
	  $("#lszeLjs").attr("value",sum);
	}
	
$('#ChTitle').tooltip({
	track: true,
	delay: 0,
	showURL: false,
	showBody: " - "
});

function changeSecond(){
 if($("#zczj").val()==""){
	zczj="0.0";
	}else{
	zczj=$("#zczj").val();
	}
	var zczjs=parseFloat(zczj);
	  $("#zczj").attr("value",zczjs.toFixed(2));
 if($("#jgmzsrBys").val()==""){
	jgmzsrBys="0.0";
	}else{
	jgmzsrBys=$("#jgmzsrBys").val();
	}
	var jgmzsrByss=parseFloat(jgmzsrBys);
	  $("#jgmzsrBys").attr("value",jgmzsrByss.toFixed(2));	  
	   if($("#jgmzsrLjs").val()==""){
	jgmzsrLjs="0.0";
	}else{
	jgmzsrLjs=$("#jgmzsrLjs").val();
	}
	var jgmzsrLjss=parseFloat(jgmzsrLjs);
	  $("#jgmzsrLjs").attr("value",jgmzsrLjss.toFixed(2));	  
	   if($("#lrzeBys").val()==""){
	lrzeBys="0.0";
	}else{
	lrzeBys=$("#lrzeBys").val();
	}
	var lrzeByss=parseFloat(lrzeBys);
	  $("#lrzeBys").attr("value",lrzeByss.toFixed(2));	 
	   if($("#lrzeLjs").val()==""){
	lrzeLjs="0.0";
	}else{
	lrzeLjs=$("#lrzeLjs").val();
	}
	var lrzeLjss=parseFloat(lrzeLjs);
	  $("#lrzeLjs").attr("value",lrzeLjss.toFixed(2));	 
	   if($("#ch").val()==""){
	ch="0.0";
	}else{
	ch=$("#ch").val();
	}
	var chs=parseFloat(ch);
	  $("#ch").attr("value",chs.toFixed(2));	 
	     if($("#chLjs").val()==""){
	chLjs="0.0";
	}else{
	chLjs=$("#chLjs").val();
	}
	var chLjss=parseFloat(chLjs);
	  $("#chLjs").attr("value",chLjss.toFixed(2));	 
	  if($("#nsBys").val()==""){
	nsBys="0.0";
	}else{
	nsBys=$("#nsBys").val();
	}
	var nsByss=parseFloat(nsBys);
	  $("#nsBys").attr("value",nsByss.toFixed(2));	 
	    if($("#nsLjs").val()==""){
	nsLjs="0.0";
	}else{
	nsLjs=$("#nsLjs").val();
	}
	var nsLjss=parseFloat(nsLjs);
	  $("#nsLjs").attr("value",nsLjss.toFixed(2));	 
	  
	  
	  if($("#yfjf").val()==""){
	yfjf="0.0";
	}else{
	yfjf=$("#yfjf").val();
	}
	var yfjfs=parseFloat(yfjf);
	  $("#yfjf").attr("value",yfjfs.toFixed(2));	 
	  
	    if($("#yfjfLjs").val()==""){
	yfjfLjs="0.0";
	}else{
	yfjfLjs=$("#yfjfLjs").val();
	}
	var yfjfLjss=parseFloat(yfjfLjs);
	  $("#yfjfLjs").attr("value",yfjfLjss.toFixed(2));	 
	  
	    if($("#lszeBys").val()==""){
	lszeBys="0.0";
	}else{
	lszeBys=$("#lszeBys").val();
	}
	var lszeByss=parseFloat(lszeBys);
	  $("#lszeBys").attr("value",lszeByss.toFixed(2));	 
	  
	    if($("#lszeLjs").val()==""){
	lszeLjs="0.0";
	}else{
	lszeLjs=$("#lszeLjs").val();
	}
	var lszeLjss=parseFloat(lszeLjs);
	  $("#lszeLjs").attr("value",lszeLjss.toFixed(2));	 
	  
	  if($("#lszeLjs").val()==""){
	lszeLjs="0.0";
	}else{
	lszeLjs=$("#lszeLjs").val();
	}
	var lszeLjss=parseFloat(lszeLjs);
	  $("#lszeLjs").attr("value",lszeLjss.toFixed(2));	 
	  
	    if($("#gxjscpsr").val()==""){
	gxjscpsr="0.0";
	}else{
	gxjscpsr=$("#gxjscpsr").val();
	}
	var gxjscpsrs=parseFloat(gxjscpsr);
	  $("#gxjscpsr").attr("value",gxjscpsrs.toFixed(2));	
	  
	      if($("#gxjscpsrLjs").val()==""){
	gxjscpsrLjs="0.0";
	}else{
	gxjscpsrLjs=$("#gxjscpsrLjs").val();
	}
	var gxjscpsrLjss=parseFloat(gxjscpsrLjs);
	  $("#gxjscpsrLjs").attr("value",gxjscpsrLjss.toFixed(2));	  
	  
	   if($("#gyzcz").val()==""){
	gyzcz="0.0";
	}else{
	gyzcz=$("#gyzcz").val();
	}
	var gyzczs=parseFloat(gyzcz);
	  $("#gyzcz").attr("value",gyzczs.toFixed(2));	  
	  
	   if($("#gyzczLjs").val()==""){
	gyzczLjs="0.0";
	}else{
	gyzczLjs=$("#gyzczLjs").val();
	}
	var gyzczLjss=parseFloat(gyzczLjs);
	  $("#gyzczLjs").attr("value",gyzczLjss.toFixed(2));	  
	  
	   if($("#gyzjz").val()==""){
	gyzjz="0.0";
	}else{
	gyzjz=$("#gyzjz").val();
	}
	var gyzjzs=parseFloat(gyzjz);
	  $("#gyzjz").attr("value",gyzjzs.toFixed(2));	
	  
	     if($("#gyzjzLjs").val()==""){
	gyzjzLjs="0.0";
	}else{
	gyzjzLjs=$("#gyzjzLjs").val();
	}
	var gyzjzLjss=parseFloat(gyzjzLjs);
	  $("#gyzjzLjs").attr("value",gyzjzLjss.toFixed(2));	
	 
	  
	}
	
</script>

	


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="admin_table">

<form id="add_form" action='${ctx }/admin/economicReporting/save.html' method="post">
	<input type="hidden" name="id" value="${model.id}"/>
  <div class="add_info">

   <h2>新增经济月报</h2>
  <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
    <tr>
     <th >企业名称：</th>
     <td>
     	<input id="rzqy" name="rzqy" type="text" value="${model.rzqy}"  maxlength="100" style="width:160px" class="input_a1" onfocus="loadCorpName();" onblur="loadQyxx();" />
     </td>
     
      <th>会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}"  maxlength="100" style="width:160px" class="input_a1" />
     </td>
     
    
    </tr>
       <tr>
     <th>行业分类：</th>
     <td>
     <select name="hyfl"  id="hyfl" style="text-align:center"  class="input_a1">
           <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>
     </td>
    
     
     <th>注册资金（万元）</th>
     <td>
     <input id="zczj" name="zczj" type="text" value="${model.zczj}"  maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/>（万元）
     </td>
    
    </tr>
    
    <tr>
   
     
    
     <th>营业收入（本月数）：</th>
     <td>
     	<input id="jgmzsrBys" name="jgmzsrBys" type="text" value="${model.jgmzsrBys}" maxlength="100" style="width:160px" class="input_a1" onblur="changeSecond();" />
     </td>
      <th>营业收入（累计数）：</th>
     <td>
       <input id="jgmzsrLjs" name="jgmzsrLjs" type="text" value="${model.jgmzsrLjs}"  maxlength="100" style="width:160px" class="input_a1" onblur="changeSecond();"/> 
      </td>
    </tr>
    <tr>
   
     
    
     <th>利润总额（本月数）：</th>
     <td>
    
     <input  id="lrzeBys" name="lrzeBys" type="text" value="${model.lrzeBys}" maxlength="100" style="width:160px" class="input_a1" onchange="sum();changeSecond();"/>

     </td>
      <th>利润总额（累计数）：</th>
     <td>
       <input id="lrzeLjs" name="lrzeLjs" type="text" value="${model.lrzeLjs}"  maxlength="100" style="width:160px" class="input_a1" onchange="sumlj();changeSecond();" /> 
      </td>
    </tr>
      <tr>
     <th>创汇（本月数）：</th>
     <td>
     	<input title="创汇：一般是指出口创汇，是指出售给外贸部门或直接出售给外商的产品或商品的总金额。包括来料加工装配出口，境内外技术合同实现金额及在国内以外汇计价的商品出售和技术服务的总额等。" id="ch" name="ch" type="text" value="${model.ch}" maxlength="100" style="width:160px" class="input_a1" onblur="changeSecond();"/>
     </td>
      <th>创汇（累计数）：</th>
     <td>
     <input id="shzt" name="shzt" type="hidden" value="${model.shzt}"/>
     	<input id="chLjs" name="chLjs" type="text" value="${model.chLjs}" maxlength="100" style="width:160px" class="input_a1" onblur="changeSecond();"/>
     </td>
       </tr>
     <tr>
  
     
    
     <th>纳税（本月数）：</th> 
     <td>
    <input title="纳税=企业交给国家的所有税金" id="nsBys" name="nsBys" type="text" value="${model.nsBys}" maxlength="100" style="width:160px" class="input_a1" onchange="sum();changeSecond();"/>
     </td>
      <th>纳税（累计数）：</th>
     <td>
       <input id="nsLjs" name="nsLjs" type="text" value="${model.nsLjs}"  maxlength="100" style="width:160px" class="input_a1" onchange="sumlj();changeSecond();"/> 
      </td>
    </tr>
    
    
      <tr>
    <th>研发经费（本月数）：</th>
     <td>
     	<input title="研发经费：指企业在产品、技术、材料、工艺、标准的研究、开发过程中发生的各项费用。" id="yfjf" name="yfjf" type="text" value="${model.yfjf}" maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/>
     </td>
     <th>研发经费（累计数）：</th>
     <td>
     	<input id="yfjfLjs" name="yfjfLjs" type="text" value="${model.yfjfLjs}" maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/>
     </td> 
     </tr>
     <tr>
   
     
    
     <th>利税总额（本月数）：</th> 
     <td>
     	<input title="利税总额=利润总额+纳税" id="lszeBys" name="lszeBys" type="text" value="${model.lszeBys}" maxlength="100" style="width:160px" class="input_a1" readonly="true"  onblur="changeSecond();"/>
     </td>
      <th>利税总额（累计数）：</th>
     <td>
       <input id="lszeLjs" name="lszeLjs" type="text" value="${model.lszeLjs}"  maxlength="100" style="width:160px" class="input_a1" readonly="true"  onblur="changeSecond();"/> 
      </td>
    </tr>
    <tr>
     <th>高新技术产品收入（本月数）：</th>
     <td>
       <input title="高新技术产品收入：是指企业通过技术创新、开展研发活动所形成的符合《重点领域》要求的产品（服务）所获得的收入与企业技术性收入的总和。" id="gxjscpsr" name="gxjscpsr" type="text" value="${model.gxjscpsr}"  maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/> 
      </td>
      <th>高新技术产品收入（累计数）：</th>
     <td>
       <input id="gxjscpsrLjs" name="gxjscpsrLjs" type="text" value="${model.gxjscpsrLjs}"  maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/> 
      </td>
    </tr>
      <tr>
   
     
    
    <th>工业总产值（本月数）：</th>
     <td>
     	<input title="<font color='red'>工业总产值：是以货币表现的工业企业在报告期内生产的工业产品总量。</font>" id="gyzcz" name="gyzcz" type="text" value="${model.gyzcz}" maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/>
     </td>
     <th>工业总产值（累计数）：</th>
     <td>
     	<input id="gyzczLjs" name="gyzczLjs" type="text" value="${model.gyzczLjs}" maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/>
     </td>
    </tr>
    
       <tr>
   
     
    
     
      <th>工业增加值（本月数）：</th> 
     <td>
       <input title="工业增加值：工业增加值是指工业企业在报告期内以货币形式表现的工业生产活动的最终成果；是工业企业全部生产活动的总成果扣除了在生产过程中消耗或转移的物质产品和劳务价值后的余额；是工业企业生产过程中新增加的价值。" id="gyzjz" name="gyzjz" type="text" value="${model.gyzjz}"  maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/> 
      </td>
      <th>工业增加值（累计数）：</th>
     <td>
       <input id="gyzjzLjs" name="gyzjzLjs" type="text" value="${model.gyzjzLjs}"  maxlength="100" style="width:160px" class="input_a1"  onblur="changeSecond();"/> 
      </td>
    </tr>
    
    
       <tr>
   
      <th>职工数：</th>
     <td>
       <input title="职工数：在本单位工作并由单位支付工资的人员，以及有工作岗位，但由于学习、病伤产假等原因暂未工作，仍由单位支付工资的人员。" id="zgs" name="zgs" type="text" value="${model.zgs}"  maxlength="100" style="width:160px" class="input_a1"/> 
      </td>
    
     <th>填报年月：</th>
     <td>
     
     <input id="jjzbNy" name="jjzbNy" size="22"  type="text" 
     	value="${model.jjzbNy}" maxlength="20" readonly="true" class="input_a1"/>
     </td>
    </tr>
    
    
       <tr>
   
      <th>单位负责人：</th>
     <td>
       <input id="dwfzr" name="dwfzr" type="text" value="${model.dwfzr}"  maxlength="100" style="width:160px" class="input_a1"/> 
      </td>
    
     <th>统计负责人：</th>
     <td>
     <input id="tjfzr" name="tjfzr" type="text" value="${model.tjfzr}"  maxlength="100" style="width:160px" class="input_a1"/> 
     </td>
    </tr>
    <tr>
   
      <th>填表人：</th>
     <td>
       <input id="tbr" name="tbr" type="text" value="${model.tbr}"  maxlength="100" style="width:160px" class="input_a1"/> 
      </td>
    
     <th>联系电话：</th>
     <td>
     <input id="tbrlxdh" name="tbrlxdh" type="text" value="${model.tbrlxdh}"  maxlength="100" style="width:160px" class="input_a1"/> 
     </td>
    </tr>
    
      
       <tr>
    
     <th>填表日期：</th>
     <td>
     
     <input id="tbrq" name="tbrq" size="22"  type="text"  onclick="WdatePicker();" 
     	value="${model.tbrq}" maxlength="20" readonly="true" class="input_a1"  class="input_a1"/>
     </td>
     <th></th>
     <td></td>
    </tr>
   </table>
  
   <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
  </div>
  </form>
</div>
<script type="text/javascript">
	var editor;
	editor= CKEDITOR.replace("content"); 
	CKFinder.setupCKEditor(editor, '${ctx}/js/ckfinder/');
	

	function BrowseServer()
{
	var finder = new CKFinder();
	finder.basePath = '${ctx}/js/ckfinder/';
	finder.selectActionFunction = SetFileField;
	finder.popup();
}

</script>
</body>
</html>