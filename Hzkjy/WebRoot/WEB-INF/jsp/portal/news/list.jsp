<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${category.cateName }列表页</title>
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
			<jsp:include page="/WEB-INF/jsp/portal/news/commonLeft.jsp" />
			<div class="list_right">
				<div class="location">
					<font color="#393838">当前位置：首页 >&nbsp;</font>
					<font color="#999999">${category.cateName}</font>
				</div>
				<div class="list_box2">
					<h1>
						${category.cateName}
					</h1>
					<ul class="ul">
						<c:forEach items="${list}" var="o" varStatus="sta">
							<li>
								<span><fmt:formatDate value="${o.realTime}"
										pattern="yyyy-MM-dd" /> </span>
							<c:choose>
									<c:when test="${cateCode=='train_file'}">
										<a onclick="downloadFile('${o.id}')" style="cursor:pointer;">${fn:substring(o.title, 0, 40)}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${ctx}/portal/news/detail/${o.id}.html?cateCode=${cateCode}">${fn:substring(o.title, 0, 40)}</a>
									</c:otherwise>
								</c:choose>


							</li>
						</c:forEach>

					</ul>
					<div class="page">
						<p:pager />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
