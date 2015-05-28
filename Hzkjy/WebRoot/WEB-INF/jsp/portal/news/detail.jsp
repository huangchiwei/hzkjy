<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${category.cateName }详细页</title>
    <script>
	function downloadFile(id){
		var userNo="${cookie.admin_key.value}";
		if(userNo==""){
			alert("请先登录再下载.");
			return false;
			}
		window.location.href="${ctx}/portal/news/downLoad/"+id+".html";
	}
	</script>

    </head>
  
  <body>
    
<div class="content2">
  <jsp:include page="/WEB-INF/jsp/portal/news/commonLeft.jsp"/>
 <div class="list_right">
  <div class="location"><font color="#393838">当前位置：首页 >&nbsp;</font> <font color="#999999">${category.cateName }</font></div>
  <div class="list_box">
   <h1>${category.cateName }</h1>
   <div class="list_box_l2">
     <div class="d_title">
      <h3>${entity.title}</h3>
      <em>
    
      <%--来源于：凤凰网广州站&nbsp;&nbsp;&nbsp;&nbsp;发布时间：--%><fmt:formatDate value="${entity.realTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;发布人：${entity.createUser}&nbsp;&nbsp;&nbsp;&nbsp;阅读次数：${entity.clicks}</em></div>
      <div class="text">
   ${entity.content }
</div><c:if test="${entity.cateCode=='train_file'}">
 <div class="down">
 <span class="c_ff0000">附件下载：</span><a onclick="downloadFile('${entity.id}')"  href="javascript:void(0)">${filePath}</a>
  </div></c:if>
   </div>
  </div>
  
 </div>
</div>
  </body>
</html>
