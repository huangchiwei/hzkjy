<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>创业环境</title>
		<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
		<script type="text/javascript" >
		function imgClickFun(imgSrc){
			var i = $.layer({
			    type : 1,
			    title : false,
			    fix : false,
			    offset:['50px' , ''],
			    area : ['auto','auto'],
			    page : { html: '<img src="'+imgSrc+'" />'}
			});
		}
		</script>
	</head>

	<body>

		<div class="content2">
			<jsp:include page="/WEB-INF/jsp/portal/news/commonLeft.jsp" />
 <div class="list_right">
  <div class="location"><font color="#393838">当前位置：首页 >&nbsp;园区概况 ></font> <font color="#999999">创业环境</font></div>
  <div class="list_box">
   <h1>创业环境</h1>
   <div class="list_box_l2">
      <div class="pic">
      <c:forEach items="${picList}" var="o" varStatus="sta">
        <dl class="dl">
        <dt><img src="${o }" onclick="imgClickFun('${o }')"/></dt>
        <dd><a href="#">产业园主图</a></dd>
       </dl>
      </c:forEach>
     
     
      </div>
   </div>
  </div>
 </div>
		</div>
	</body>
</html>
