<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>入驻企业 </title>

	</head>

	<body>

		<div class="content2">
			<jsp:include page="/WEB-INF/jsp/portal/news/commonLeft.jsp" />
	<div class="list_right">
				<div class="location">
					<font color="#393838">当前位置：首页 >&nbsp;</font>
					<font color="#999999">入驻企业列表</font>
				</div>
				<div class="list_box2">
					<h1>
						入驻企业列表
					</h1>
					<ul class="ul">
						<c:forEach items="${list}" var="o" varStatus="sta">
							<li>
								<span><fmt:formatDate value="${o.qyrzsj}"
										pattern="yyyy-MM-dd" /> </span>
								<a href="${o.address }" target="_blank">${o.qymc}</a>

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
