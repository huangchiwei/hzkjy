<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>

<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
</head>
<body>
<div class="content_box">
 <div class="c_b_div">
   <h3>欢迎您&nbsp;<font color="#FF3333">${userNo}</font>，<%
Calendar cal = Calendar.getInstance();
  int hour = cal.get(Calendar.HOUR_OF_DAY);
  if (hour >= 6 && hour < 8) {
   out.print("早上好，给您开心的一天！");
  } else if (hour >= 8 && hour < 12) {
   out.print("上午好，你对生活好点，生活才会对你好点！");
  } else if (hour >= 12 && hour < 14) {
   out.print("中午好，又到吃饭的时候了！");
  } else if (hour >= 14 && hour < 19) {
   out.print("下午好，美好的一天快要过去了！");
  } else {
   out.print("夜深了，早点休息哦！");
  }
%></h3>
   <h4>您现在有&nbsp;<font color="#FF3300">${countNum}</font>&nbsp;条未读信息&nbsp;&nbsp;<a href="${ctx}/admin/bsNews/list/1.html">查看</a></h4>
  </div>
  <div class="c_b_box">
   <div class="c_b_box_left">
    <div class="c_b_box_title relative">通知<div class="more"><a href="${ctx}/admin/bsNews/list/1.html">更多>></a></div>
    </div>
    <div class="c_b_box_text">
     <ul>
     <c:forEach items="${bslist}" var="mb" varStatus="sta">
     <li><span><fmt:formatDate value="${mb.createTime}" pattern="yyyy-MM-dd" /></span><a href="${ctx}/admin/bsNews/add/new.html?id=${mb.id}" style="text-decoration:none;">
     ${fn:length(mb.content) > 23 ? fn:substring(mb.content,0,23) : mb.content} ${fn:length(mb.content) > 23 ? '...' : ''}</a></li>
      </c:forEach>
     </ul>
    </div>
   </div>
   <div class="c_b_box_right">
   <div class="c_b_box_title">快捷操作</div>
   <div class="c_b_box_text">
   <c:if test="${userType=='4401'}">
       <a href="${ctx}/admin/sysUser/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a2.png" /></a>
    <a href="${ctx}/admin/bsNews/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a1.png" /></a>
    <a href="${ctx}/admin/memberBasic/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a4.png" /></a>
        <a href="http://znpp.hzkjcyy.com" target="_blank"><img src="${ctx}/theme/admin/default/images/admin_welcome_a5.png" /></a>
   </c:if>
   <c:if test="${userType!='4401'}">
    <a href="${ctx}/admin/sysUser/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a2.png" /></a>
    <a href="${ctx}/admin/bsNews/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a1.png" /></a>
    <a href="${ctx}/admin/memberBasic/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a4.png" /></a>
    <a href="${ctx}/admin/newsAdvert/list/1.html"><img src="${ctx}/theme/admin/default/images/admin_welcome_a3.png" /></a>
    <a href="http://znpp.hzkjcyy.com" target="_blank"><img src="${ctx}/theme/admin/default/images/admin_welcome_a5.png" /></a>
    <a href="http://znpp.hzkjcyy.com/system/login/" target="_blank"><img src="${ctx}/theme/admin/default/images/admin_welcome_a6.png" /></a>
     </c:if>
    </div>
   </div>
  </div>
 </div>
</body>
</html>