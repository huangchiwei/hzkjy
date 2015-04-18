<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${category.cateName }</title>

	</head>

	<body>

		<div class="content2">
			<jsp:include page="/WEB-INF/jsp/portal/news/commonLeft.jsp" />
 <div class="list_right">
  <div class="location"><font color="#393838">当前位置：首页 >&nbsp;园区概况 ></font> <font color="#999999">${category.cateName }</font></div>
  <div class="list_box">
   <h1>${category.cateName }</h1>
   <div class="list_box_l2">
      <div class="text">
       ${content}     </div>
   </div>
  </div>
 </div>
		</div>
	</body>
</html>
