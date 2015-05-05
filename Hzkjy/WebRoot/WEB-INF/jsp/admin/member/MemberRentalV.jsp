<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/adminthemes/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="../../theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="../../theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.select.js" charset="GBK"></script>
<script src="${ctx}/js/formValidator/jquery-1.4.4.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx }/js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="${ctx }/js/ckfinder/ckfinder.js"></script> 
		<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
var userNo="${userNo}";
if(userNo=="cwry"){
$("#addinfo").find("input,select,textarea").attr("readonly",true);
}else{
 $("#addinfo1").hide();
}
 

	formInitConfig("add_form",3000);
	    $("#fpzl option[value='${model.fpzl}']").attr("selected", true); 
		$("#kpxm option[value='${model.kpxm}']").attr("selected", true); 
		$("#fkflx option[value='${model.fkflx}']").attr("selected", true); 
		$("#fkfzjlx option[value='${model.fkfzjlx}']").attr("selected", true); 
		$("#sslq option[value='${model.sslq}']").attr("selected", true); 
		

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
	            sumhjjeznj();
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
		  	        $("#qysfdj2").attr("value",data.qysfdj2);
		  	        $("#qydfdj2").attr("value",data.qydfdj2);
		  	        
		  	          $("#dsyhd").attr("value",data.dsyhd);
		  	            $("#ssyhd").attr("value",data.ssyhd);
		  	              $("#dsyhd2").attr("value",data.dsyhd2);
		  	            $("#ssyhd2").attr("value",data.ssyhd2);
		  	    
		  		
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
var lqysf2;
var lqydf2;
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
	
function sumhjjeznj(){
var qyzjznj;
var glfwfznj;
var zlbzjznj;
var zxyjznj;
var qysfznj;
var qydfznj;

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
	
	
	

	var sumhjjeznj=parseFloat(qyzjznj)+parseFloat(glfwfznj)+parseFloat(zlbzjznj)+parseFloat(zxyjznj)+parseFloat(qysfznj)+parseFloat(qydfznj);
	  $("#hjjeznj").attr("value",sumhjjeznj.toFixed(1));
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
	
		function sumshjyl2(){
var ssyhd;
var sbyhd;
if($("#ssyhd2").val()==""){
	ssyhd="0.0";
	}else{
	ssyhd=$("#ssyhd2").val();
	}
	if($("#sbyhd2").val()==""){
	sbyhd="0.0";
	}else{
	sbyhd=$("#sbyhd2").val();
	}

	var sumshjyl=parseFloat(sbyhd)-parseFloat(ssyhd);
	  $("#shjyl2").attr("value",sumshjyl);
	  sumqysf2();
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
	
	function sumdhjyl2(){
var dsyhd;
var dbyhd;
if($("#dsyhd2").val()==""){
	dsyhd="0.0";
	}else{
	dsyhd=$("#dsyhd2").val();
	}
	if($("#dbyhd2").val()==""){
	dbyhd="0.0";
	}else{
	dbyhd=$("#dbyhd2").val();
	}

		var sumdhjyl=parseFloat(dbyhd)-parseFloat(dsyhd);
	  $("#dhjyl2").attr("value",sumdhjyl);
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
	if($("#qysfdj2").val()==""){
	qysfdj2="0.0";
	}else{
	qysfdj2=$("#qysfdj2").val();
	}
	  if($("#shjyl2").val()==""){
	shjyl2="0.0";
	}else{
	shjyl2=$("#shjyl2").val();
	}
		var sumqysf=parseFloat(qysfdj)*parseFloat(shjyl);
		var sumqysf2=parseFloat(qysfdj2)*parseFloat(shjyl2);
			var sumqysf3=sumqysf+sumqysf2;
	  $("#qysf").attr("value",sumqysf3.toFixed(1));
	  $("#lqysf").attr("value",sumqysf.toFixed(1));
	    sumhjje();
	}
		function sumqysf2(){
	var qysfdj;
   if($("#qysfdj2").val()==""){
	qysfdj2="0.0";
	}else{
	qysfdj2=$("#qysfdj2").val();
	}
	  if($("#shjyl2").val()==""){
	shjyl2="0.0";
	}else{
	shjyl2=$("#shjyl2").val();
	}
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
		var sumqysf2=parseFloat(qysfdj2)*parseFloat(shjyl2);
		var sumqysf3=sumqysf+sumqysf2;
		 $("#qysf").attr("value",sumqysf3.toFixed(1));
	  $("#lqysf2").attr("value",sumqysf2.toFixed(1));
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
	 if($("#lqydf2").val()==""){
	lqydf2="0.0";
	}else{
	lqydf2=$("#lqydf2").val();
	}
	
		var sumqydf=parseFloat(qydfdj)*parseFloat(dhjyl);
		var sumqydf2=parseFloat(lqydf2)+sumqydf;
	  $("#qydf").attr("value",sumqydf2.toFixed(1));
	  $("#lqydf").attr("value",sumqydf.toFixed(1));
	    sumhjje();
	}
	function sumqydf2(){ 
	var qydfdj2;
   if($("#qydfdj2").val()==""){
	qydfdj2="0.0";
	}else{
	qydfdj2=$("#qydfdj2").val();
	}
	  if($("#dhjyl2").val()==""){
	dhjyl2="0.0";
	}else{
	dhjyl2=$("#dhjyl2").val();
	}
	 if($("#lqydf").val()==""){
	lqydf="0.0";
	}else{
	lqydf=$("#lqydf").val();
	}
		var sumqydf2=parseFloat(qydfdj2)*parseFloat(dhjyl2);
		var sumqydf=parseFloat(lqydf)+sumqydf2;
		$("#qydf").attr("value",sumqydf.toFixed(1));
	  $("#lqydf2").attr("value",sumqydf2.toFixed(1));
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
   <pm:hasPermission permValue="zjlr_updt">
	       	<c:set var="zjlr_updt" value="true"/>
	    </pm:hasPermission>
   <div class="content_box">
  <div class="add_info" id="addinfo">
   <h2>新增缴费通知单</h2>
    <table width="100%" border="0" cellpadding="0" cellspacing="1"
					class="ListTable" id="questTable" >
	<tr align="center">
     <th>房号:</th>
     <td colspan="3">
     	<input name="zydy" type="text" class="input_a1" id="zydy" value="${model.zydy}" size="15"  maxlength="100" />
     </td>
   
     <th align="center">会员编号：</th>
     <td colspan="2">
     <input id="shzt" name="shzt" type="hidden" value="${model.shzt}" />
      <input id="fbzt" name="fbzt" type="hidden" value="${model.fbzt}" />
     	<input name="hybh" type="text" class="input_a1" id="hybh" value="${model.hybh}" size="15"  maxlength="20" readonly="true" />
     </td>

  
    </tr>	
    <tr align="center">
     <th>用户:</th>
     <td colspan="3">
     	<input name="qymc" type="text"  class="input_a1" id="qymc"  onfocus="loadCorpName();" onblur="loadQyxx();" value="${model.qymc}" size="15"  maxlength="100" />
     </td>
     
     <th>建筑面积：</th>
     <td colspan="2">
     	<input name="qymj" type="text" class="input_a1" id="qymj" onchange="sumfy();" value="${model.qymj}" size="15"  maxlength="20"/>
&nbsp;㎡ </td>

  
    </tr>	
    <tr align="center">
       <th>缴费年月：</th>
      <td colspan="3">
     <input name="jfyd" type="text" class="input_a1"  id="jfyd" onchange="loadSqsj();" onclick="WdatePicker({dateFmt:'yyyy-MM'});" value="${model.jfyd}" size="15"/>
     </td>
     <th>所属楼区：</th>
       <td colspan="2">
     	 <select name="sslq"  id="sslq" class="input_a1">
          <option value="1">科技大楼</option>
          <option value="2">A栋</option>
          <option value="3">B栋</option>
          <option value="4">C栋</option>
          <option value="5">D栋</option>
          <option value="6">琶洲科技创意中心</option>
        </select>
     </td>
    </tr>	
    <tr>
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
	      <td>
	     <input name="zjmc"  id="zjmc" type="text" class="input_a1"  size=12 <c:if test="${not empty model.zjmc}">value="${model.zjmc}"</c:if> <c:if test="${ empty model.zjmc}">value="租金"</c:if> />
	     	</td> 
	         <td>
	     <input name="qyzjdj"  id="qyzjdj" type="text" class="input_a1" size=5 value="${model.qyzjdj}" onchange="sumzj();"/>
元/平方 </td>
	 
	        <td>
	     <input name="zjsq"  id="zjsq" type="text" class="input_a1" size=10 value="${model.zjsq}" />
	     	</td> 
	     <td>
	     <input name="qyzj"  id="qyzj" type="text" class="input_a1" size=12 value="<fmt:formatNumber value="${model.qyzj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	     	</td>
	  	   <td>
	     <input name="qyzjznj"  id="qyzjznj" type="text" class="input_a1" size=12  <c:if test="${not empty model.qyzjznj}">value="${model.qyzjznj}"</c:if> <c:if test="${ empty model.qyzjznj}">value="0.0"</c:if> onchange="sumhjje();sumhjjeznj();"/>
	     	</td> 
	     <td>
	     <input name="zjbz"  id="zjbz" type="text" class="input_a1" size=12 value="${model.zjbz}"/> 
	     	</td> 	
	    
	    </tr>
	    <tr align="center">
	    <td>2</td>
	      <td>
	     <input name="glfwfmc"  id="glfwfmc" type="text" size=12 class="input_a1" <c:if test="${not empty model.glfwfmc}">value="${model.glfwfmc}"</c:if> <c:if test="${ empty model.glfwfmc}">value="管理服务费"</c:if> />
	     	</td>
	     <td>
	     <input name="glfwfdj"  id="glfwfdj" type="text" size=5 class="input_a1" value="${model.glfwfdj}" onchange="sumglfwfdj();"/>
元/平方 </td>
	     
	      <td>
	   	 	<input name="glfsq"  id="glfsq" type="text" size=10 class="input_a1" value="${model.glfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="glfwf"  id="glfwf" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.glfwf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="glfwfznj"  id="glfwfznj" type="text" size=12 class="input_a1" <c:if test="${not empty model.glfwfznj}">value="${model.glfwfznj}"</c:if> <c:if test="${ empty model.glfwfznj}">value="0.0"</c:if> onchange="sumhjje();sumhjjeznj();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="glfbz"  id="glfbz" type="text" size=12 class="input_a1" value="${model.glfbz}"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>3</td>
	        <td>
	     <input name="zlbzjmc"  id="zlbzjmc" type="text" size=12 class="input_a1" <c:if test="${not empty model.zlbzjmc}">value="${model.zlbzjmc}"</c:if> <c:if test="${ empty model.zlbzjmc}">value="租赁保证金"</c:if>/>
	     	</td>
	     <td>
	     <input name="zlbzjdj"  id="zlbzjdj" type="text" size="5" class="input_a1" value="${model.zlbzjdj}" onchange="sumzlbzjdj();"/>
元/平方 </td>
	     
	      <td>
	   	 	<input name="zlbzjsq"  id="zlbzjsq" type="text" size=10 class="input_a1" value="${model.zlbzjsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zlbzj"  id="zlbzj" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.zlbzj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="zlbzjznj"  id="zlbzjznj" type="text" size=12 class="input_a1"  <c:if test="${not empty model.zlbzjznj}">value="${model.zlbzjznj}"</c:if> <c:if test="${ empty model.zlbzjznj}">value="0.0"</c:if> onchange="sumhjje();sumhjjeznj();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zlbzjbz"  id="zlbzjbz" type="text" size=12 class="input_a1" value="${model.zlbzjbz}"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>4</td>
	       <td>
	     <input name="zxyjmc"  id="zxyjmc" type="text" size=12 class="input_a1" <c:if test="${not empty model.zxyjmc}">value="${model.zxyjmc}"</c:if>  <c:if test="${ empty model.zxyjmc}">value="装修押金"</c:if> />
	     	</td>
	     <td>
	     <input name="zxyjdj"  id="zxyjdj" type="text" size=5 class="input_a1" value="${model.zxyjdj}" onchange="sumzxyjdj();" />
元/平方 </td>
	    
	      <td>
	   	 	<input name="zxyjsq"  id="zxyjsq" type="text" size=10 class="input_a1" value="${model.zxyjsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zxyj"  id="zxyj" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.zxyj}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="zxyjznj"  id="zxyjznj" type="text" size=12 class="input_a1"  <c:if test="${not empty model.zxyjznj}">value="${model.zxyjznj}"</c:if>  <c:if test="${ empty model.zxyjznj}">value="0.0"</c:if> onchange="sumhjje();sumhjjeznj();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zxyjbz"  id="zxyjbz" type="text" size=12 class="input_a1" value="${model.zxyjbz}"/>
	   	 </td>
	    </tr>
	    
	         <tr align="center">
	         <td>5</td>
	              <td>
	     <input name="sfmc"  id="sfmc" type="text" size=12 class="input_a1" <c:if test="${not empty model.sfmc}">value="${model.sfmc}"</c:if> <c:if test="${ empty model.sfmc}">value="水费"</c:if> />
	     	</td>
	     <td>
	     	</td>
	 
	      <td>
	   	 	<input name="sfsq"  id="sfsq" type="text" size=10 class="input_a1" value="${model.sfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qysf"  id="qysf" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.qysf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="qysfznj"  id="qysfznj" type="text" size=12 class="input_a1" <c:if test="${not empty model.qysfznj}">value="${model.qysfznj}"</c:if> <c:if test="${ empty model.qysfznj}">value="0.0"</c:if>  onchange="sumhjje();sumhjjeznj();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="lsfbz"  id="lsfbz" type="text" size=12 class="input_a1" value="${model.sfbz}"/>
	   	 </td>
	    </tr>
	    
	        <tr align="center">
	        <td>6</td>
	           <td>
	     <input name="dfmc"  id="dfmc" type="text" size=12 class="input_a1" <c:if test="${not empty model.dfmc}">value="${model.dfmc}"</c:if> <c:if test="${ empty model.dfmc}">value="电费"</c:if>  />
	     	</td>
	     <td>
	     	</td>
	  
	      <td>
	   	 	<input name="dfsq"  id="dfsq" type="text" size=10 class="input_a1" value="${model.dfsq}"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qydf"  id="qydf" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.qydf}" pattern="#.#" minFractionDigits="1" />"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	      <td>
	   	 	<input name="qydfznj"  id="qydfznj" type="text" size=12 class="input_a1" <c:if test="${not empty model.qydfznj}">value="${model.qydfznj}"</c:if> <c:if test="${ empty model.qydfznj}">value="0.0"</c:if>  onchange="sumhjje();sumhjjeznj();"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="ldfbz"  id="ldfbz" type="text" size=12 class="input_a1" value="${model.dfbz}"/>
	   	 </td>
	    </tr>
	          <tr>
     <td colspan="4">小写：</td>
     <td align="center">
     	<input name="hjje" type="text" class="input_a1"  id="hjje" value="<fmt:formatNumber value="${model.hjje}" pattern="#.#" minFractionDigits="1" />
" onchange="loadHjjezw();"/> </td>
    
       <td align="center"></td>
      <td align="center"></td>
    </tr>
     <tr>
     <td colspan="3">合计金额（人民币大写）：</td>
     <td colspan="4">
     	<input name="hjjedx"  id="hjjedx" type="text" size=12 class="input_a1" value="${model.hjjedx}" style="width:400px" />
     </td>
    </tr>
    <tr>
    	  <td colspan="7"><textarea name="a" style="width:100%;height:45px;color:red;">说明：1、费用采用现金或支票、公对公转账形式支付，租金水电费支票抬头写：广州市海珠科技产业园有限公司；帐号：635357744247 ，中国银行海珠支行                                                                                        2、请于每月5日前交纳以上列表之费用，逾期按每日5‰收取滞纳金；                                                                                                                                                                         3、如已交纳该款，可不予理会此单； </textarea></td>
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
	    <th>水1：</th>
	     <td>
     	<input name="ssyhd"  id="ssyhd" type="text" size=12 class="input_a1" value="${model.ssyhd}"  onblur="rtnn(this);sumshjyl();"/>吨
     </td>
     <td>
     	<input name="sbyhd"  id="sbyhd" type="text" size=12 class="input_a1" value="${model.sbyhd}"  onblur="rtnn(this);sumshjyl();sumqysf();"/>吨
     </td>
      <td>
     	<input name="shjyl"  id="shjyl" type="text" size=12 class="input_a1" value="${model.shjyl}" onchange="sumqysf();"/>吨
     </td>
     <td>
     	<input name="qysfdj"  id="qysfdj" type="text" size=12 class="input_a1" value="${model.qysfdj}" onchange="sumqysf();"/>元/吨
     </td>
       <td>
     	<input name="lqysf"  id="lqysf" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.lqysf}" pattern="#.#" minFractionDigits="1" />" />
     </td>
     
     
     <td>
     	<input name="sfbz"  id="sfbz" type="text" size=12 class="input_a1" value="${model.sfbz}" onchange="onchangebz();"/>
     </td>
      
	    </tr>
	     <tr>
	    <th>水2：</th>
	     <td>
     	<input name="ssyhd2"  id="ssyhd2" type="text" size=12 class="input_a1" value="${model.ssyhd2}"  onblur="rtnn(this);sumshjyl2();"/>吨
     </td>
      <td>
     	<input name="sbyhd2"  id="sbyhd2" type="text" size=12 class="input_a1" value="${model.sbyhd2}"  onblur="rtnn(this);sumshjyl2();sumqysf2();"/>吨
     </td>
      <td>
     	<input name="shjyl2"  id="shjyl2" type="text" size=12 class="input_a1" value="${model.shjyl2}" onchange="sumqysf2();"/>吨
     </td>
     <td>
     	<input name="qysfdj2"  id="qysfdj2" type="text" size=12 class="input_a1" value="${model.qysfdj2}" onchange="sumqysf2();"/>元/吨
     </td>
       <td>
     	<input name="lqysf2"  id="lqysf2" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.lqysf2}" pattern="#.#" minFractionDigits="1" />" />
     </td>
     
     <td>
     	<input name="sfbz2"  id="sfbz2" type="text" size=12 class="input_a1" value="${model.sfbz2}" onchange="onchangebz();"/>
     </td>
      
	    </tr>
	    
	  
	    <tr>
	    <th>电1：</th>
	   <td>
     	<input name="dsyhd"  id="dsyhd" type="text" size=12 class="input_a1" value="${model.dsyhd}" onblur="rtnn(this);sumdhjyl();"/>度
     </td>
     <td>
     	<input name="dbyhd"  id="dbyhd" type="text" size=12 class="input_a1" value="${model.dbyhd}" onblur="rtnn(this);sumdhjyl();sumqydf();"/>度
     </td>
     <td>
     	<input name="dhjyl"  id="dhjyl" type="text" size=12 class="input_a1" value="${model.dhjyl}"  onchange="sumqydf();"/>度
     </td>
     <td>
     	<input name="qydfdj"  id="qydfdj" type="text" size=12 class="input_a1" value="${model.qydfdj}" onchange="sumqydf();"/>元/度
     </td>
       <td>
     	<input name="lqydf"  id="lqydf" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.lqydf}" pattern="#.#" minFractionDigits="1" />" />
     </td>
      
     <td>
     	<input name="dfbz"  id="dfbz" type="text" size=12 class="input_a1" value="${model.dfbz}" onchange="onchangebz();"/>
     </td>
      
	    </tr>  
	    
	     <tr>
	    <th>电2：</th>
	   <td>
     	<input name="dsyhd2"  id="dsyhd2" type="text" size=12 class="input_a1" value="${model.dsyhd2}" onblur="rtnn(this);sumdhjyl2();"/>度
     </td>
     <td>
     	<input name="dbyhd2"  id="dbyhd2" type="text" size=12 class="input_a1" value="${model.dbyhd2}" onblur="rtnn(this);sumdhjyl2();sumqydf2();"/>度
     </td>
     <td>
     	<input name="dhjyl2"  id="dhjyl2" type="text" size=12 class="input_a1" value="${model.dhjyl2}"  onchange="sumqydf2();"/>度
     </td>
     <td>
     	<input name="qydfdj2"  id="qydfdj2" type="text" size=12 class="input_a1" value="${model.qydfdj2}" onchange="sumqydf2();"/>元/度
     </td>
       <td>
     	<input name="lqydf2"  id="lqydf2" type="text" size=12 class="input_a1" value="<fmt:formatNumber value="${model.lqydf2}" pattern="#.#" minFractionDigits="1" />" />
     </td>
      
     <td>
     	<input name="dfbz2"  id="dfbz2" type="text" size=12 class="input_a1" value="${model.dfbz2}" onchange="onchangebz();"/>
     </td>
      
	    </tr>  
	    
	          <tr>
     <th >备注：</th>
     <td colspan="6"><textarea id="xxbz" name="xxbz" rows="2" cols="120" >${model.xxbz}</textarea></td>
    </tr>
 </table>
       
   
    
    	
       
  
  </div>
  <div class="add_info" id="addinfo1">
       <table width="100%" border="0" cellpadding="0" cellspacing="1"
					class="ListTable" id="questTable" >
       <tr align="center">
       <th>发票种类：</th>
      <td colspan="3">
     <select name="fpzl"  id="fpzl" style="text-align:center">
          <option value="1">10000004 广东省地方税收通用发票（电子-单联平推式）</option>
          <option value="2">10000005 广东省地方税收通用发票（电子-两联打孔式）</option>
        </select>
     </td>
     <th>开票项目：</th>
       <td colspan="2">
     	 <select name="kpxm"  id="kpxm" style="text-align:center"> 
          <option value="1">0706 租赁业</option>
          <option value="2">0799 其他服务业</option>
          <option value="3">0701 代理业</option>
         </select>
     </td>
    </tr>	
     <tr align="center">
       <th>付款方类型：</th>
      <td colspan="3">
         <select name="fkflx"  id="fkflx" style="text-align:center">
          <option value="2">1 单位</option>
          <option value="1">0 个人</option>
         
         </select>
     </td>
     <th>付款方手机号码：</th>
       <td colspan="2">
     	<input name="fkfsjhm"  id="fkfsjhm" type="text" class="input_a1" value="${model.fkfsjhm}"/>
     </td>
    </tr>	
    <tr align="center">
       <th>付款方名称：</th>
      <td colspan="3">
      <input name="fkfmc"  id="fkfmc" type="text" class="input_a1" <c:if test="${not empty model.fkfmc}">value="${model.fkfmc}"</c:if> <c:if test="${ empty model.fkfmc}">value="${model.qymc}"</c:if>/>
     </td>
     <th>付款方证件类型：</th>
       <td colspan="2">
       <select name="fkfzjlx"  id="fkfzjlx" style="text-align:center">
          <option value="1">1 纳税人识别号</option>
          <option value="2">2 通行证</option>
          <option value="3">3 回乡证</option>
          <option value="4">4 台胞证</option>
          <option value="5">5 组织机构代码</option>
          <option value="6">6 身份证</option>
          <option value="7">7 军官证</option>
          <option value="8">8 护照</option>
          <option value="9">9 其他</option>
         </select>
     </td>
    </tr>		
    
    
    <tr align="center">
       <th>付款方识别号：</th>
      <td colspan="3">
      <input name="fkfsbh"  id="fkfsbh" type="text" class="input_a1" value="${model.fkfsbh}"/>
     </td>
     <th>合计金额：</th>
       <td colspan="2">
      <input name="fpje"  id="fpje" type="text" class="input_a1" <c:if test="${not empty model.fpje}">value="${model.fpje}"</c:if> <c:if test="${not empty model.fpje}">value="${model.hjje}"</c:if>/>
     </td>
    </tr>	
    
     <tr align="center">
       <th>附注：</th>
      <td colspan="3">
      <input name="fz"  id="fz" type="text" class="input_a1" value="${model.fz}"/>
     </td>
     <th>开票项目说明：</th>
       <td colspan="2">
      <input name="kpxmsm"  id="kpxmsm" type="text" class="input_a1" value="${model.kpxmsm}"/>
     </td>
    </tr>	
    
    <tr align="center">
       <th>备注：</th>
      <td colspan="3">
      <input name="fpbz"  id="fpbz" type="text" class="input_a1" value="${model.fpbz}"/>
     </td>
     <th></th>
       <td colspan="2">
     </td>
    </tr>								
					
					</table>
      </div>
  <div class="div_submit">
					<input id="sumbit_bt" name="" type="submit" value="提  交"
						class="photo_btn" />
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
		</div></div>
  </form>
</div>

</body>
</html>