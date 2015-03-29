<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${category.cateName }详细页</title>
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
      <c:if test="${cateCode=='train_file'}">
   <c:if test="${not empty entity.filePath }"><font color="blue">课件下载:</font><a href="${ctx}/portal/news/downLoad/${entity.id}.html">${fn:substringAfter(entity.filePath, '/userfiles/trainFile/')}</a></c:if>    
      </c:if>
      <%--来源于：凤凰网广州站&nbsp;&nbsp;&nbsp;&nbsp;发布时间：--%><fmt:formatDate value="${entity.realTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;发布人：${entity.createUser}</em></div>
      <div class="text">
   ${entity.content }
</div>
   </div>
  </div>
 </div>
</div>
  </body>
</html>
