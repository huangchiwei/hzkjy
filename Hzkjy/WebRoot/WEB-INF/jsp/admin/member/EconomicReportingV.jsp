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
<script type="text/javascript" src="${ctx }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx }/js/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
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
<form id="add_form" action='${ctx }/admin/economicReporting/save.html' method="post">
	<input type="hidden" name="id" value="${model.id}"/>
  <div class="add_info">

   <h2>新增经济月报</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th >企业名称：</th>
     <td>
     	<input id="rzqy" name="rzqy" type="text" value="${model.rzqy}"  maxlength="100" style="width:160px"  onfocus="loadCorpName();" onblur="loadQyxx();" />
     </td>
     
      <th>会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}"  maxlength="100" style="width:160px" />
     </td>
     
    
    </tr>
       <tr>
     <th>行业分类：</th>
     <td>
     <select name="hyfl"  id="hyfl" style="text-align:center">
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
     <input id="zczj" name="zczj" type="text" value="${model.zczj}"  maxlength="100" style="width:160px" />（万元）
     </td>
    
    </tr>
    
    <tr>
   
     
    
     <th>技工贸总收入（本月数）：</th>
     <td>
     	<input id="jgmzsrBys" name="jgmzsrBys" type="text" value="${model.jgmzsrBys}" maxlength="100" style="width:160px"/>
     </td>
      <th>技工贸总收入（累计数）：</th>
     <td>
       <input id="jgmzsrLjs" name="jgmzsrLjs" type="text" value="${model.jgmzsrLjs}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    <tr>
   
     
    
     <th>利润总额（本月数）：</th>
     <td>
     	<input id="lrzeBys" name="lrzeBys" type="text" value="${model.lrzeBys}" maxlength="100" style="width:160px"/>
     </td>
      <th>利润总额（累计数）：</th>
     <td>
       <input id="lrzeLjs" name="lrzeLjs" type="text" value="${model.lrzeLjs}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
     <tr>
   
     
    
     <th>纳税（本月数）：</th>
     <td>
     	<input id="nsBys" name="nsBys" type="text" value="${model.nsBys}" maxlength="100" style="width:160px"/>
     </td>
      <th>纳税（累计数）：</th>
     <td>
       <input id="nsLjs" name="nsLjs" type="text" value="${model.nsLjs}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    <tr>
   
     
    
     <th>利税总额（本月数）：</th>
     <td>
     	<input id="lszeBys" name="lszeBys" type="text" value="${model.lszeBys}" maxlength="100" style="width:160px"/>
     </td>
      <th>利税总额（累计数）：</th>
     <td>
       <input id="lszeLjs" name="lszeLjs" type="text" value="${model.lszeLjs}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    
     <tr>
   
     
    
     <th>创汇：</th>
     <td>
     	<input id="ch" name="ch" type="text" value="${model.ch}" maxlength="100" style="width:160px"/>
     </td>
      <th>职工数：</th>
     <td>
       <input id="zgs" name="zgs" type="text" value="${model.zgs}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    
      <tr>
   
     
    
     <th>研发经费：</th>
     <td>
     	<input id="yfjf" name="yfjf" type="text" value="${model.yfjf}" maxlength="100" style="width:160px"/>
     </td>
      <th>高新技术产品收入：</th>
     <td>
       <input id="gxjscpsr" name="gxjscpsr" type="text" value="${model.gxjscpsr}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    
       <tr>
   
     
    
     <th>工业总产值：</th>
     <td>
     	<input id="gyzcz" name="gyzcz" type="text" value="${model.gyzcz}" maxlength="100" style="width:160px"/>
     </td>
      <th>工业增加值：</th>
     <td>
       <input id="gyzjz" name="gyzjz" type="text" value="${model.gyzjz}"  maxlength="100" style="width:160px"/> 
      </td>
    </tr>
    
    
       <tr>
   
     
    
     <th>填报年月：</th>
     <td>
     
     <input id="jjzbNy" name="jjzbNy" size="22" class="Wdate" type="text" 
     	value="${model.jjzbNy}" maxlength="20" readonly="true"/>
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