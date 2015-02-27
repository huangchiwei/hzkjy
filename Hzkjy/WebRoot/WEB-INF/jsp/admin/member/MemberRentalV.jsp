<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.select.js" charset="GBK"></script>
<script src="${ctx}/js/formValidator/jquery-1.4.4.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script> 
<script language="javascript" src="${ctx}/js/jsp/member/memberRentalV.js" type="text/javascript"></script>
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
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+dwmc+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#qymj").attr("value",data.mj);
		  	    $("#hybh").attr("value",data.hybh);
		  	    $("#zydy").attr("value",data.zydy);
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

	var sumhjje=parseFloat(qyzj)+parseFloat(glfwf)+parseFloat(qysf)+parseFloat(qydf);
	  $("#hjje").attr("value",sumhjje);
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
</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:history.back(-1);"/>
   </div>
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/memberRental/save.html</c:if><c:if test="${model != null}">${ctx}/admin/memberRental/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>新增缴费通知单</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">企业名称:</th>
     <td>
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}" maxlength="100" onfocus="loadCorpName();" onblur="loadQyxx();" />
     </td>
     
     <th>会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" maxlength="20" readonly="true" />
     </td>
    <th>企业面积：</th>
     <td>
    	<input id="qymj" name="qymj" type="text" value="${model.qymj}" maxlength="100"   />平方
     </td>
  
    </tr>
	    <tr>
	     
	     
	     <th>企业租金：</th>
	     <td>
	     <input name="qyzj"  id="qyzj" type="text" class="input_a1" value="${model.qyzj}"  onblur="rtnn(this);sumhjje();"/>
	     	</td>
	     	
	     <th>租金属期：</th>
	     <td>
	     <input name="zjsq"  id="zjsq" type="text" class="input_a1" value="${model.zjsq}"/>
	     	</td> 	
	     <th>租金备注：</th>
	     <td>
	     <input name="zjbz"  id="zjbz" type="text" class="input_a1" value="${model.zjbz}"/>
	     	</td> 	
	    
	    </tr>
	    <tr>
	    
	     <th>管理服务费：</th>
	   	 <td>
	   	 	<input name="glfwf"  id="glfwf" type="text" class="input_a1" value="${model.glfwf}"  onblur="rtnn(this);sumhjje();"/>
	   	 </td>
	     <th>管理费属期：</th>
	   	 <td>
	   	 	<input name="glfsq"  id="glfsq" type="text" class="input_a1" value="${model.glfsq}"/>
	   	 </td>
	   	  <th>管理费备注：</th>
	   	 <td>
	   	 	<input name="glfbz"  id="glfbz" type="text" class="input_a1" value="${model.glfbz}"/>
	   	 </td>
	    </tr>
	    <tr>
	    <th>企业水费：</th>
     <td>
     	<input name="qysf"  id="qysf" type="text" class="input_a1" value="${model.qysf}"  onblur="rtnn(this);sumhjje();"/>
     </td>
	   <th>水费属期：</th>
     <td>
     	<input name="sfsq"  id="sfsq" type="text" class="input_a1" value="${model.sfsq}"/>
     </td>
     <th>水费备注：</th>
     <td>
     	<input name="sfbz"  id="sfbz" type="text" class="input_a1" value="${model.sfbz}"/>
     </td>
      
	    </tr>
	    <tr>
      <th>水上月行度：</th>
     <td>
     	<input name="ssyhd"  id="ssyhd" type="text" class="input_a1" value="${model.ssyhd}"  onblur="rtnn(this);sumshjyl();"/>吨
     </td>
     <th>水本月行度：</th>
     <td>
     	<input name="sbyhd"  id="sbyhd" type="text" class="input_a1" value="${model.sbyhd}"  onblur="rtnn(this);sumshjyl();"/>吨
     </td>
    <th>水合计用量：</th>
     <td>
     	<input name="shjyl"  id="shjyl" type="text" class="input_a1" value="${model.shjyl}" />吨
     </td>
    </tr>
    <tr>
	    <tr>
	     <th>企业电费：</th>
     <td>
     	<input name="qydf"  id="qydf" type="text" class="input_a1" value="${model.qydf}"  onblur="rtnn(this);sumhjje();"/>
     </td>
       <th>电费属期：</th>
     <td>
     	<input name="dfsq"  id="dfsq" type="text" class="input_a1" value="${model.dfsq}"/>
     </td>
       <th>电费备注：</th>
     <td>
     	<input name="dfbz"  id="dfbz" type="text" class="input_a1" value="${model.dfbz}"/>
     </td>
	    </tr>
    
     <th>电上月行度：</th>
     <td>
     	<input name="dsyhd"  id="dsyhd" type="text" class="input_a1" value="${model.dsyhd}" onblur="rtnn(this);sumdhjyl();"/>度
     </td>
     <th>电本月行度：</th>
     <td>
     	<input name="dbyhd"  id="dbyhd" type="text" class="input_a1" value="${model.dbyhd}" onblur="rtnn(this);sumdhjyl();"/>度
     </td>
     <th>电合计用量：</th>
     <td>
     	<input name="dhjyl"  id="dhjyl" type="text" class="input_a1" value="${model.dhjyl}"/>度
     </td>
    </tr>
     <tr>
     <th>其它费用：</th>
     <td>
     	<input name="qtfy"  id="qtfy" type="text" class="input_a1" value="${model.qtfy}"   onblur="rtnn(this);"/>
     </td>
     <th>合计金额：</th>
     <td>
     	<input name="hjje"  id="hjje" type="text" class="input_a1" value="${model.hjje}"/>
     </td>
     <th>缴费年月：</th>
     <td>
     <input name="jfyd"  id="jfyd" type="text" class="input_a1" value="${model.jfyd}" onclick="WdatePicker({dateFmt:'yyyy-MM'});"/>
     </td>
    </tr>
     <tr>
       <th>租用单元：</th>
	     <td>
	     <input id="zydy" name="zydy" type="text" value="${model.zydy}" maxlength="100"  />
	     </td>
     
     <th></th>
     <td>
     </td>
      <th></th>
     <td>
     </td>
    </tr>
    
   </table>
     
   
    
    	<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
  
  </div>
  </form>
</div>

</body>
</html>