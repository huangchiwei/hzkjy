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
	 $("#iseveryone option[value='${model.iseveryone}']").attr("selected", true); 
	  $("#isReoprt option[value='${model.isReport}']").attr("selected", true); 
	 
	formInitConfig("add_form",3000);
	autoValidate();
		
});

    
  var dwmc=""   
function loadQyxx(){

 dwmc=$("#receiver").val();
 if(dwmc !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+dwmc+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  	    $("#receiverBh").attr("value",data.hybh);
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
	$("#receiver").autocomplete(data,{
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
 <pm:hasPermission permValue="tzgl_updt">
	       	<c:set var="tzgl_updt" value="true"/>
	       	    </pm:hasPermission>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:history.back(-1);"/>
   </div>
<form id="add_form" action='${ctx }/admin/bsNews/save.html' method="post">
	<input type="hidden" name="id" value="${model.id}"/>
  <div class="add_info">

   <h2>新增信息</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th >标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${model.title}"  maxlength="100" style="width:160px" />
     </td>
     
      <th>是否全部通知：</th>
     <td>
     	 <select name="iseveryone"  id="iseveryone" style="text-align:center">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
     </td>
     
    
    </tr>
       <tr>
     <th>有效时间：</th>
     <td>
     <input id="activeTime" name="activeTime" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" 
     	value="<fmt:formatDate value="${model.activeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" maxlength="20"/>
     </td>
     
     <th>是否发布：</th>
     <td>
      <select name="isReport"  id="isReport" style="text-align:center">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
     </td>
    
    </tr>
    
    <tr>
   
     
    
     <th>接收者：</th>
     <td>
     	<input id="receiver" name="receiver" type="text" value="${model.receiver}" maxlength="100" style="width:160px" onfocus="loadCorpName();" onblur="loadQyxx();" />
     </td>
      <th>接收者编号;</th>
     <td>
       <input id="receiverBh" name="receiverBh" type="text" value="${model.receiverBh}"  maxlength="100" style="width:160px"  readonly/> 
      </td>
    </tr>
    <%--
    <tr> <th>阅读次数：</th>
     <td>
    	<c:if test="${not empty entity.clicks }">${entity.clicks }</c:if>
    	<c:if test="${ empty entity.clicks }">0</c:if>
     </td>
      <th>创建用户：</th>
     <td>
    	${cookie.user_key.value }
     </td></tr>
	  --%><tr>
	  <th>内容</th>
	  <td colspan="3"><textarea id="content" name="content" rows="3" cols="120" >${model.content }</textarea>
	  </td>
	  </tr>
   
   
   </table>
  	<c:if test="${tzgl_updt == true}">
   <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
					</c:if>
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