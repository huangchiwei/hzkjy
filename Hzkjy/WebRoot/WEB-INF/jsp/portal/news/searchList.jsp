<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>搜索页</title>

	</head>

	<body>

		<div class="content2">
		 <div class="list_left">
  <div class="list_lm">
   <h1>搜索列表</h1>
  </div>
  <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
     
	  
     </ul>
    </div>
  
  </div>
   <div class="list_ad"><img src="${ctx}/theme/portal/default/images/ad_216.png" /></div>
  <div class="list_contus">联系我们</div>
  <div class="list_contus_l">
    <em>电话：020-89232382</em>
    <em>传真：020-89232138</em>
  </div>
  <div class="list_contus_c">
  <em>地址：广州市海珠区新港东路2429</em></div>
 </div>
			<div class="list_right">
				<div class="location">
					<font color="#393838">当前位置：首页 >&nbsp;</font>
					<font color="#999999">搜索列表</font>
				</div>
				<div class="list_box2">
					<h1>
						搜索列表
					</h1>
					<ul class="ul">
						<c:forEach items="${list}" var="o" varStatus="sta">
							<li>
								<span><fmt:formatDate value="${o.realTime}"
										pattern="yyyy-MM-dd" /> </span>
								<a href="${ctx}/portal/news/detail/${o.id}.html?cateCode=${cateCode}">${o.title}</a>

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
