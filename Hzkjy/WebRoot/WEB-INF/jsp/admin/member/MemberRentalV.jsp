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
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.select.js" charset="GBK"></script>
<script src="${ctx}/js/formValidator/jquery-1.4.4.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx }/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="${ctx }/ckfinder/ckfinder.js"></script> 
		<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
	formInitConfig("add_form",3000);
	autoValidate();
		
});

    
  var dwmc=""   
function loadQyxx(){

 dwmc=$("#qymc").val();
 if(dwmc !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+encodeURI(dwmc)+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#qymj").attr("value",data.mj);
		  	    $("#hybh").attr("value",data.hybh);
		  	    $("#zydy").attr("value",data.zydy);
		  	    sumzj();
	            sumglfwfdj();
	            sumzlbzjdj();
	            sumzxyjdj();
	            sumhjje();
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 
function loadHjjezw(){

 hjje=$("#hjje").val();
 if(hjje !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getHjje.html?hjje='+hjje+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#hjjedx").attr("value",data.hjjezw);
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 

function loadSqsj(){

 hybh=$("#hybh").val();
 jfyd=$("#jfyd").val();
 if(hybh !="" && jfyd!=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getSqsj.html?hybh='+hybh+'&jfyd='+jfyd+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#qyzj").attr("value",data.qyzj);
		  		$("#qyzjdj").attr("value",data.qyzjdj);
		  		$("#zjsq").attr("value",data.zjsq);
		  		$("#qyzjznj").attr("value",data.qyzjznj);
		  		$("#zjbz").attr("value",data.zjbz);
		  		
		  	
		  		$("#glfwf").attr("value",data.glfwf);
		  		$("#glfwfdj").attr("value",data.glfwfdj);
		  		$("#glfsq").attr("value",data.glfsq);
		  		$("#glfwfznj").attr("value",data.glfwfznj);
		  		$("#glfbz").attr("value",data.glfbz);
		  		
		  		
		  		
		  		
		  		$("#zlbzj").attr("value",data.zlbzj);
		  		$("#zlbzjdj").attr("value",data.zlbzjdj);
		  		$("#zlbzjsq").attr("value",data.zlbzjsq);
		  		$("#zlbzjznj").attr("value",data.zlbzjznj);
		  		$("#zlbzjbz").attr("value",data.zlbzjbz);

		  		
		  		
		  		$("#zxyj").attr("value",data.zxyj);
		  		$("#zxyjdj").attr("value",data.zxyjdj);
		  		$("#zxyjsq").attr("value",data.zxyjsq);
		  		$("#zxyjznj").attr("value",data.zxyjznj);
		  		$("#zxyjbz").attr("value",data.zxyjbz);
		  		
			    $("#sfsq").attr("value",data.sfsq);
		  	    $("#dfsq").attr("value",data.dfsq);
		  	    
		  	    
		  	      $("#qysfdj").attr("value",data.qysfdj);
		  	        $("#qydfdj").attr("value",data.qydfdj);
		  	          $("#dsyhd").attr("value",data.dsyhd);
		  	            $("#ssyhd").attr("value",data.ssyhd);
		  	    
		  		
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 
var corpNameJson="";


function sumhjje(){
var qyzj;
var glfwf;
var qysf;
var qydf;
if($("#qyzj").val()==""){
	qyzj="0.0";
	}else{
	qyzj=$("#qyzj").val();
	}
	if($("#glfwf").val()==""){
	glfwf="0.0";
	}else{
	glfwf=$("#glfwf").val();
	}
	if($("#qysf").val()==""){
	qysf="0.0";
	}else{
	qysf=$("#qysf").val();
	}
	if($("#qydf").val()==""){
	qydf="0.0";
	}else{
	qydf=$("#qydf").val();
	}
		if($("#zlbzj").val()==""){
	zlbzj="0.0";
	}else{
	zlbzj=$("#zlbzj").val();
	}
		if($("#zxyj").val()==""){
	zxyj="0.0";
	}else{
	zxyj=$("#zxyj").val();
	}
			if($("#qyzjznj").val()==""){
	qyzjznj="0.0";
	}else{
	qyzjznj=$("#qyzjznj").val();
	}
			if($("#glfwfznj").val()==""){
	glfwfznj="0.0";
	}else{
	glfwfznj=$("#glfwfznj").val();
	}
				if($("#zlbzjznj").val()==""){
	zlbzjznj="0.0";
	}else{
	zlbzjznj=$("#zlbzjznj").val();
	}
		if($("#zxyjznj").val()==""){
	zxyjznj="0.0";
	}else{
	zxyjznj=$("#zxyjznj").val();
	}
	if($("#qysfznj").val()==""){
	qysfznj="0.0";
	}else{
	qysfznj=$("#qysfznj").val();
	}
	if($("#qydfznj").val()==""){
    qydfznj="0.0";
	}else{
	qydfznj=$("#qydfznj").val();
	}
	

	var sumhjje=parseFloat(qyzj)+parseFloat(glfwf)+parseFloat(qysf)+parseFloat(qydf)+parseFloat(zlbzj)+parseFloat(zxyj)+parseFloat(qyzjznj)+parseFloat(glfwfznj)+parseFloat(zlbzjznj)+parseFloat(zxyjznj)+parseFloat(qysfznj)+parseFloat(qydfznj);
	  $("#hjje").attr("value",sumhjje.toFixed(1));
	  loadHjjezw();
	}
	
	
	function sumshjyl(){
var ssyhd;
var sbyhd;
if($("#ssyhd").val()==""){
	ssyhd="0.0";
	}else{
	ssyhd=$("#ssyhd").val();
	}
	if($("#sbyhd").val()==""){
	sbyhd="0.0";
	}else{
	sbyhd=$("#sbyhd").val();
	}

	var sumshjyl=parseFloat(sbyhd)-parseFloat(ssyhd);
	  $("#shjyl").attr("value",sumshjyl);
	  sumqysf();
	}
	
	function sumdhjyl(){
var dsyhd;
var dbyhd;
if($("#dsyhd").val()==""){
	dsyhd="0.0";
	}else{
	dsyhd=$("#dsyhd").val();
	}
	if($("#dbyhd").val()==""){
	dbyhd="0.0";
	}else{
	dbyhd=$("#dbyhd").val();
	}

		var sumdhjyl=parseFloat(dbyhd)-parseFloat(dsyhd);
	  $("#dhjyl").attr("value",sumdhjyl);
	}

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
	$("#qymc").autocomplete(data,{
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

function rtnn(val){
	if(val.value==""){
	val.value="0.0";
	}
	}
	function sumzj(){
	var qyzjdj;
   if($("#qyzjdj").val()==""){
	qyzjdj="0.0";
	}else{
	qyzjdj=$("#qyzjdj").val();
	}
	  if($("#qymj").val()==""){
	qymj="0.0";
	}else{
	qymj=$("#qymj").val();
	}
	
		var sumzj=parseFloat(qyzjdj)*parseFloat(qymj);
	  $("#qyzj").attr("value",sumzj.toFixed(1));
	    sumhjje();
	}	
	function sumglfwfdj(){
	var glfwfdj;
   if($("#glfwfdj").val()==""){
	glfwfdj="0.0";
	}else{
	glfwfdj=$("#glfwfdj").val();
	}
	  if($("#qymj").val()==""){
	qymj="0.0";
	}else{
	qymj=$("#qymj").val();
	}
	
		var sumglfwfdj=parseFloat(glfwfdj)*parseFloat(qymj);
	  $("#glfwf").attr("value",sumglfwfdj.toFixed(1));
	    sumhjje();
	}
	function sumzlbzjdj(){
	var zlbzjdj;
   if($("#zlbzjdj").val()==""){
	zlbzjdj="0.0";
	}else{
	zlbzjdj=$("#zlbzjdj").val();
	}
	  if($("#qymj").val()==""){
	qymj="0.0";
	}else{
	qymj=$("#qymj").val();
	}
	
		var sumzlbzjdj=parseFloat(zlbzjdj)*parseFloat(qymj)*parseFloat(2);
	  $("#zlbzj").attr("value",sumzlbzjdj.toFixed(1));
	    sumhjje();
	}
	function sumzxyjdj(){
	var zxyjdj;
   if($("#zxyjdj").val()==""){
	zxyjdj="0.0";
	}else{
	zxyjdj=$("#zxyjdj").val();
	}
	  if($("#qymj").val()==""){
	qymj="0.0";
	}else{
	qymj=$("#qymj").val();
	}
	
		var sumzxyjdj=parseFloat(zxyjdj)*parseFloat(qymj);
	  $("#zxyj").attr("value",sumzxyjdj.toFixed(1));
	  sumhjje();
	}
	
	
	
		function sumqysf(){
	var qysfdj;
   if($("#qysfdj").val()==""){
	qysfdj="0.0";
	}else{
	qysfdj=$("#qysfdj").val();
	}
	  if($("#shjyl").val()==""){
	shjyl="0.0";
	}else{
	shjyl=$("#shjyl").val();
	}
		var sumqysf=parseFloat(qysfdj)*parseFloat(shjyl);
	  $("#qysf").attr("value",sumqysf.toFixed(1));
	  $("#lqysf").attr("value",sumqysf.toFixed(1));
	    sumhjje();
	}
		function sumqydf(){ 
	var qydfdj;
   if($("#qydfdj").val()==""){
	qydfdj="0.0";
	}else{
	qydfdj=$("#qydfdj").val();
	}
	  if($("#dhjyl").val()==""){
	dhjyl="0.0";
	}else{
	dhjyl=$("#dhjyl").val();
	}
	
		var sumqydf=parseFloat(qydfdj)*parseFloat(dhjyl);
	  $("#qydf").attr("value",sumqydf.toFixed(1));
	  $("#lqydf").attr("value",sumqydf.toFixed(1));
	    sumhjje();
	}
	function sumfy(){
	sumzj();
	sumglfwfdj();
	sumzlbzjdj();
	sumzxyjdj();
	}
	
	function onchangebz(){
	 var sfbz=$("#sfbz").val();
	 $("#lsfbz").attr("value",sfbz);
	  var dfbz=$("#dfbz").val();
	 $("#ldfbz").attr("value",dfbz);
	 
	}
	
</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/memberRental/save.html</c:if><c:if test="${model != null}">${ctx}/admin/memberRental/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>新增缴费通知单</h2>
    <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
	<tr align="center">
     <th>房号:</th>
     <td colspan="2">
     	<input id="zydy" name="zydy" type="text" value="${model.zydy}" class="input_a1"  maxlength="100" />
     </td>
     <th>缴费年月：</th>
     <th align="center">会员编号：</th>
     <td colspan="2">
     <input id="shzt" name="shzt" type="hidden" value="${model.shzt}" />
      <input id="fbzt" name="fbzt" type="hidden" value="${model.fbzt}" />
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" class="input_a1"  maxlength="20" readonly="true" />
     </td>

  
    </tr>	
    <tr align="center">
     <th>用户:</th>
     <td colspan="2">
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}"  class="input_a1"  maxlength="100"  onfocus="loadCorpName();" onblur="loadQyxx();" />
     </td>
     <td>
     <input name="jfyd"  id="jfyd" type="text" class="input_a1" value="${model.jfyd}" onclick="WdatePicker({dateFmt:'yyyy-MM'});" onchange="loadSqsj();"/>
     </td>
     <th>建筑面积：</th>
     <td colspan="2">
     	<input id="qymj" name="qymj" type="text" value="${model.qymj}" class="input_a1"  maxlength="20" onchange="sumfy();"/>㎡
     </td>

  
    </tr>	
    <tr align="center">
     <th>序号：</th>
      <th>项目：</th>
     <th>单价：</th>
    <th>属期：</th>
     <th>金    额    （元）：</th>
     <th>滞纳金 （元）：</th>
     <th>备注：</th>			
	</tr>			

	     <tr align="center">
	     <td>1</td>
	      <th>租金：</th>
	         <td>
	     <input name="qyzjdj"  id="qyzjdj" type="text" class="input_a1" value="${model.qyzjdj}" onchange="sumzj();"/>元/平方
	     	</td>
	 
	        <td>
	     <input name="zjsq"  id="zjsq" type="text" class="input_a1" value="${model.zjsq}" />
	     	</td> 
	     <td>
	     <input name="qyzj"  id="qyzj" type="text" class="input_a1" value="<fmt:formatNumber value="${model.qyzj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	     	</td>
	  	   <td>
	     <input name="qyzjznj"  id="qyzjznj" type="text" class="input_a1" value="${model.qyzjznj!='' && model.qyzjznj != null?model.qyzjznj:'0.0'}" onchange="sumhjje();"/>
	     	</td> 
	     <td>
	     <input name="zjbz"  id="zjbz" type="text" class="input_a1" value="${model.zjbz}"/> 
	     	</td> 	
	    
	    </tr>
	    <tr align="center">
	    <td>2</td>
	    <th>管理服务费：</th>
	     <td>
	     <input name="glfwfdj"  id="glfwfdj" type="text" class="input_a1" value="${model.glfwfdj}" onchange="sumglfwfdj();"/>元/平方
	     	</td>
	     
	      <td>
	   	 	<input name="glfsq"  id="glfsq" type="text" class="input_a1" value="${model.glfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="glfwf"  id="glfwf" type="text" class="input_a1" value="<fmt:formatNumber value="${model.glfwf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="glfwfznj"  id="glfwfznj" type="text" class="input_a1" value="${model.glfwfznj!='' && model.glfwfznj != null?model.glfwfznj:'0.0'}" onchange="sumhjje();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="glfbz"  id="glfbz" type="text" class="input_a1" value="${model.glfbz}"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>3</td>
	     <th>租赁保证金：</th>
	     <td>
	     <input name="zlbzjdj"  id="zlbzjdj" type="text" class="input_a1" value="${model.zlbzjdj}" onchange="sumzlbzjdj();"/>元/平方
	     	</td>
	     
	      <td>
	   	 	<input name="zlbzjsq"  id="zlbzjsq" type="text" class="input_a1" value="${model.zlbzjsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zlbzj"  id="zlbzj" type="text" class="input_a1" value="<fmt:formatNumber value="${model.zlbzj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="zlbzjznj"  id="zlbzjznj" type="text" class="input_a1" value="${model.zlbzjznj!='' && model.zlbzjznj != null?model.zlbzjznj:'0.0'}" onchange="sumhjje();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zlbzjbz"  id="zlbzjbz" type="text" class="input_a1" value="${model.zlbzjbz}"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>4</td>
	      <th>装修押金：</th>
	     <td>
	     <input name="zxyjdj"  id="zxyjdj" type="text" class="input_a1" value="${model.zxyjdj}" onchange="sumzxyjdj();" />元/平方
	     	</td>
	    
	      <td>
	   	 	<input name="zxyjsq"  id="zxyjsq" type="text" class="input_a1" value="${model.zxyjsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zxyj"  id="zxyj" type="text" class="input_a1" value="<fmt:formatNumber value="${model.zxyj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="zxyjznj"  id="zxyjznj" type="text" class="input_a1" value="${model.zxyjznj!='' && model.zxyjznj != null?model.zxyjznj:'0.0'}" onchange="sumhjje();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zxyjbz"  id="zxyjbz" type="text" class="input_a1" value="${model.zxyjbz}"/>
	   	 </td>
	    </tr>
	    
	         <tr align="center">
	         <td>5</td>
	             <th>水费：</th>
	     <td>
	     	</td>
	 
	      <td>
	   	 	<input name="sfsq"  id="sfsq" type="text" class="input_a1" value="${model.sfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qysf"  id="qysf" type="text" class="input_a1" value="<fmt:formatNumber value="${model.qysf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="qysfznj"  id="qysfznj" type="text" class="input_a1" value="${model.qysfznj!='' && model.qysfznj != null?model.qysfznj:'0.0'}" onchange="sumhjje();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="lsfbz"  id="lsfbz" type="text" class="input_a1" value="${model.sfbz}"/>
	   	 </td>
	    </tr>
	    
	        <tr align="center">
	        <td>6</td>
	           <th>电费：</th>
	     <td>
	     	</td>
	  
	      <td>
	   	 	<input name="dfsq"  id="dfsq" type="text" class="input_a1" value="${model.dfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qydf"  id="qydf" type="text" class="input_a1" value="<fmt:formatNumber value="${model.qydf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="qydfznj"  id="qydfznj" type="text" class="input_a1" value="${model.qydfznj!='' && model.qydfznj != null ? model.qydfznj:'0.0'}" onchange="sumhjje();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="ldfbz"  id="ldfbz" type="text" class="input_a1" value="${model.dfbz}"/>
	   	 </td>
	    </tr>
	          <tr>
     <td colspan="4">小写：</td>
     <td align="center">
     	<input name="hjje"  id="hjje" type="text" class="input_a1" value="<fmt:formatNumber value="${model.hjje}" pattern="#.#" minFractionDigits="1" />" onchange="loadHjjezw();"/>
     </td>
    
       <td align="center"><input name="hjjeznj"  id="hjjeznj" type="text" class="input_a1" value="${model.hjjeznj!='' && model.hjjeznj != null ? model.hjjeznj:'0.0'}" /></td>
      <td align="center"><input name="bz"  id="bz" type="text" class="input_a1" value="${model.bz}"/></td>
    </tr>
     <tr>
     <td colspan="3">合计金额（人民币大写）：</td>
     <td colspan="4">
     	<input name="hjjedx"  id="hjjedx" type="text" class="input_a1" value="${model.hjjedx}" style="width:400px" />
     </td>
    </tr>
    <tr>
    	  <td colspan="7"><textarea name="a" style="width:90%;height:45px;color:red;">说明：1、费用采用现金或支票、公对公转账形式支付，租金水电费支票抬头写：广州市海珠科技产业园有限公司；帐号：635357744247 ，中国银行海珠支行                                                                                        2、请于每月5日前交纳以上列表之费用，逾期按每日5‰收取滞纳金；                                                                                                                                                                         3、如已交纳该款，可不予理会此单； </textarea></td>
    </tr>
    <tr>
    	  <td colspan="7">附件：</td>
    </tr>
      <tr>
    	  <th>项目</th>
    	  <th>上月行度</th>
    	  <th>本月行度</th>
    	  <th>合计用量</th>
    	  <th>单价</th>
    	  <th>金额（元）</th>
    	  <th>备注</th>
    </tr>
    

	    <tr>
	    <th>水：</th>
	     <td>
     	<input name="ssyhd"  id="ssyhd" type="text" class="input_a1" value="${model.ssyhd}"  onblur="rtnn(this);sumshjyl();"/>吨
     </td>
     <td>
     	<input name="sbyhd"  id="sbyhd" type="text" class="input_a1" value="${model.sbyhd}"  onblur="rtnn(this);sumshjyl();sumqysf();"/>吨
     </td>
      <td>
     	<input name="shjyl"  id="shjyl" type="text" class="input_a1" value="${model.shjyl}" onchange="sumqysf();"/>吨
     </td>
     <td>
     	<input name="qysfdj"  id="qysfdj" type="text" class="input_a1" value="${model.qysfdj}" onchange="sumqysf();"/>元/吨
     </td>
       <td>
     	<input name="lqysf"  id="lqysf" type="text" class="input_a1" value="<fmt:formatNumber value="${model.qysf}" pattern="#.#" minFractionDigits="1" />" />
     </td>
     
     <td>
     	<input name="sfbz"  id="sfbz" type="text" class="input_a1" value="${model.sfbz}" onchange="onchangebz();"/>
     </td>
      
	    </tr>
	    
	  
	    <tr>
	    <th>电：</th>
	   <td>
     	<input name="dsyhd"  id="dsyhd" type="text" class="input_a1" value="${model.dsyhd}" onblur="rtnn(this);sumdhjyl();"/>度
     </td>
     <td>
     	<input name="dbyhd"  id="dbyhd" type="text" class="input_a1" value="${model.dbyhd}" onblur="rtnn(this);sumdhjyl();sumqydf();"/>度
     </td>
     <td>
     	<input name="dhjyl"  id="dhjyl" type="text" class="input_a1" value="${model.dhjyl}"  onchange="sumqydf();"/>度
     </td>
     <td>
     	<input name="qydfdj"  id="qydfdj" type="text" class="input_a1" value="${model.qydfdj}" onchange="sumqydf();"/>元/度
     </td>
       <td>
     	<input name="lqydf"  id="lqydf" type="text" class="input_a1" value="<fmt:formatNumber value="${model.qydf}" pattern="#.#" minFractionDigits="1" />" />
     </td>
      
     <td>
     	<input name="dfbz"  id="dfbz" type="text" class="input_a1" value="${model.dfbz}" onchange="onchangebz();"/>
     </td>
      
	    </tr>  
	    
	          <tr>
     <th >备注：</th>
     <td colspan="6"><textarea id="xxbz" name="xxbz" rows="2" cols="120" >${model.xxbz}</textarea></td>
    </tr>
 </table>
     
   
    
    	
       <div class="div_submit">
					<input id="sumbit_bt" name="" type="submit" value="提  交"
						class="photo_btn" />
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div>
  </form>
</div>

</body>
</html>