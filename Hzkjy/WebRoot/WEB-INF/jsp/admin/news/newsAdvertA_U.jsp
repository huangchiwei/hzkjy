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

<script type="text/javascript">
function changeFlag(){
	 $("#flag").attr("value","1");
}
function onchangeFun(value){
	if(value=="0"){
		$("#redmsg").html("建议970*300px");
		}else if(value=="1"){
		$("#redmsg").html("建议690*90px");
		}else if(value=="2"){
		$("#redmsg").html("建议260*70px");
		}else if(value=="3"){
		$("#redmsg").html("建议970*100px");
		}
	
}
function submitFun(){
	
	var title=$("#title").val();
	if(title==""){
		alert("标题不允许为空!");
		$("#title").focus();
		return false;
		}
	var linkUrl=$("#linkUrl").val();
	if(linkUrl==""){
		alert("链接不允许为空!");
		$("#linkUrl").focus();
		return false;
		}
	var oriFile="${entity.path}";
	if(oriFile==""){
		var file=$("#file").val();
		if(file==""){
			alert("附件不允许为空!");
			return false;
			}
		}


	return true;
}
</script>

	


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/newsAdvert/list/1.html'"/>
   </div>
<form id="add_form" action='${ctx }/admin/newsAdvert/save.html'  method="post" enctype="multipart/form-data" onsubmit="return submitFun()">
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" name="id" value="${entity.id}"/>


  <div class="add_info">

   <h2>首页广告&gt;&gt;${type == 'add' ? '添加' : '修改'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th width="100px;">位置：</th>
     <td>
     	<select name="adType" id="adType" onchange="onchangeFun(this.options[this.options.selectedIndex].value)">
     	<option value="0" <c:if test="${entity.adType==0}">selected="selected"</c:if>>首页轮播图</option>
     	<option value="1" <c:if test="${entity.adType==1}">selected="selected"</c:if>>首页中间位置图</option>
     	<option value="2" <c:if test="${entity.adType==2}">selected="selected"</c:if>>首页右下角位置图</option>
     	<option value="3" <c:if test="${entity.adType==3}">selected="selected"</c:if>>首页底部位置图</option>
     	</select>
     </td>
   </tr>
    <tr>
     <th width="100px;">标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${entity.title}"  />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
   <tr>
     <th width="100px;">链接地址：</th>
     <td>
     	<input id="linkUrl" name="linkUrl" type="text" value="${entity.linkUrl}"  />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
   <tr>
	  <th width="100px;">备注</th>
	  <td ><textarea id="remark" name="remark" rows="3" cols="40" >${entity.remark }</textarea>
	  </td>
	  </tr>
     
  <tr >
      <th width="100px;">附件上传：</th>
     <td  >
     <input  id="flag" name="flag" type="hidden"   value="0"/>
      <input  id="file" name="file" type="file"  onchange="changeFlag()" value="${entity.path}"/>&nbsp;&nbsp;<font color="red">*(<span id="redmsg">
     						 	<c:choose>
									<c:when test="${entity.adType=='0'}">
										建议970*300px
									</c:when>
									<c:when test="${entity.adType=='1'}">
										建议690*90px
									</c:when>
										<c:when test="${entity.adType=='2'}">
										建议260*70px
									</c:when>
									<c:when test="${entity.adType=='3'}">
										建议970*100px
									</c:when>
									<c:otherwise>
									建议970*300px
									</c:otherwise>
								</c:choose>
     </span>)</font>
      <font color="red"><c:if test="${ empty entity.path }">未上传附件</c:if>
      <c:if test="${not empty entity.path }">已上传的附件(限一份):<a href="${ctx}/admin/newsAdvert/downLoad/${entity.id}.html">${fn:substringAfter(entity.path, '/userfiles/advertFile/')}</a></c:if></font> 
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