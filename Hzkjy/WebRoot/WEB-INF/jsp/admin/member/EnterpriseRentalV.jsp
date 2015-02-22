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
<script language="javascript" src="${ctx}/js/jsp/member/MemberBasicV.js" type="text/javascript"></script>
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
<form id="add_form" enctype="multipart/form-data" action='<c:if test="${model == null}">${ctx}/admin/enterpriseRental/save.html</c:if><c:if test="${model != null}">${ctx}/admin/enterpriseRental/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>企业缴费单</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">企业名称:</th>
     <td>
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}" maxlength="100" style="width:160px" readonly="true"/>
     </td>
     
     <th>会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" maxlength="20" readonly="true" />
     </td>
     <th>企业面积：</th>
     <td>
    	<input id="qymj" name="qymj" type="text" value="${model.qymj}" maxlength="100" style="width:160px"  readonly="true"/>平方
     </td>
     
    </tr>
	    <tr>
	     <th>租用单元：</th>
	     <td>
	     <input id="zydy" name="zydy" type="text" value="${model.zydy}" maxlength="100" style="width:160px"  readonly="true"/>
	     </td>
	     <th>企业租金：</th>
	     <td>
	     <input name="qyzj"  id="qyzj" type="text" class="input_a1" value="${model.qyzj}" readonly="true"/>
	     	</td>
	     <th>管理服务费：</th>
	   	 <td>
	   	 	<input name="glfwf"  id="glfwf" type="text" class="input_a1" value="${model.glfwf}" readonly="true"/>
	   	 </td>
	    </tr>
    <tr>
     <th>水上月行度：</th>
     <td>
     	<input name="ssyhd"  id="ssyhd" type="text" class="input_a1" value="${model.ssyhd}" readonly="true"/>吨
     </td>
     <th>水本月行度：</th>
     <td>
     	<input name="sbyhd"  id="sbyhd" type="text" class="input_a1" value="${model.sbyhd}" readonly="true"/>吨
     </td>
     <th>水合计用量：</th>
     <td>
     	<input name="shjyl"  id="shjyl" type="text" class="input_a1" value="${model.shjyl}" readonly="true"/>吨
     </td>
    </tr>
    <tr>
     <th>电上月行度：</th>
     <td>
     	<input name="dsyhd"  id="dsyhd" type="text" class="input_a1" value="${model.dsyhd}" readonly="true"/>度
     </td>
     <th>电本月行度：</th>
     <td>
     	<input name="dbyhd"  id="dbyhd" type="text" class="input_a1" value="${model.dbyhd}" readonly="true"/>度
     </td>
     <th>电合计用量：</th>
     <td>
     	<input name="dhjyl"  id="dhjyl" type="text" class="input_a1" value="${model.dhjyl}" readonly="true"/>度
     </td>
    </tr>
     <tr>
     <th>其它费用：</th>
     <td>
     	<input name="qtfy"  id="qtfy" type="text" class="input_a1" value="${model.qtfy}" readonly="true"/>
     </td>
     <th>合计金额：</th>
     <td>
     	<input name="hjje"  id="hjje" type="text" class="input_a1" value="${model.hjje}" readonly="true"/>
     </td>
     <th>缴费年月：</th>
     <td>
     <input name="jfyd"  id="jfyd" type="text" class="input_a1" value="${model.jfyd}" readonly="true"/>
     </td>
    </tr>
     <tr>
     <th>企业电费：</th>
     <td>
     	<input name="qydf"  id="qydf" type="text" class="input_a1" value="${model.qydf}" readonly="true"/>
     </td>
     <th>企业水费：</th>
     <td>
     	<input name="qysf"  id="qysf" type="text" class="input_a1" value="${model.qysf}" readonly="true"/>
     </td>
     <th></th>
     <td>
     </td>
    </tr>
    <tr>
    <th>企业实缴金额</th>
    <td><input name="jnje"  id="jnje" type="text" class="input_a1" value="${model.jnje}"/></td>
     <th>缴费凭证上传：</th>
     <td  colspan="3">
     <input style="border:0px;" type="file" name="files" id="files"/>
     </td>
    </tr>
     <tr>
    <th>凭证图像</th>
    <td colspan="5">
    <img src="${ctx}/hzkjyFj/${model.accessory}" width="600px" height="400px"/>
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