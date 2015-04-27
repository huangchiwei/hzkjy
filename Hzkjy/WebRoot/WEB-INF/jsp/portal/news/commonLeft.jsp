 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <div class="list_left">
  <c:choose>
  <c:when  test="${cateCode=='park_intro'||cateCode=='park_frame'||cateCode=='park_site'||cateCode=='park_envir'}">
    <div class="list_lm">
   <h1>园区概况</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
      <li <c:if test="${cateCode=='park_intro'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=park_intro">园区介绍</a></li>
       <li <c:if test="${cateCode=='park_frame'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=park_frame">组织架构</a></li>
        <li <c:if test="${cateCode=='park_site'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=park_site">园区位置</a></li>
        <li <c:if test="${cateCode=='park_envir'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=park_envir">创业环境</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
 <c:when  test="${cateCode=='policy_regu'||cateCode=='policy_province'||cateCode=='policy_park'}">
    <div class="list_lm">
   <h1>政策法规</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
           <li <c:if test="${cateCode=='policy_regu'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=policy_regu">国家政策</a></li>
       <li <c:if test="${cateCode=='policy_province'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=policy_province">省市政策</a></li>
        <li <c:if test="${cateCode=='policy_park'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=policy_park">园区政策</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
   <c:when  test="${cateCode=='notice_lastest'}">
    <div class="list_lm">
   <h1>最新公告</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=notice_lastest">最新公告</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
    <c:when  test="${cateCode=='service_human'}">
    <div class="list_lm">
   <h1>人力资源</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=service_human">人力资源</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
     <c:when  test="${cateCode=='service_apply'}">
    <div class="list_lm">
   <h1>项目申报</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=service_apply">项目申报</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
     <c:when  test="${cateCode=='service_business'}">
    <div class="list_lm">
   <h1>招商信息</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=service_business">招商信息</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
     <c:when  test="${cateCode=='train_notice'||cateCode=='train_file'}">
    <div class="list_lm">
   <h1>交流培训</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li <c:if test="${cateCode=='train_notice'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=train_notice">培训通知</a></li>
           <li <c:if test="${cateCode=='train_file'}">class="current-cat"</c:if>><a href="${ctx }/portal/news/list/1.html?cateCode=train_file">培训课件</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
      <c:when  test="${cateCode=='contactUs'}">
    <div class="list_lm">
   <h1>联系我们</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
         <li class="current-cat"><a href="${ctx }/portal/news/contactUs.html">联系我们</a></li>
           
     </ul>
    </div>
  
  </div>
  </c:when>
  </c:choose>


  
 
 <div class="list_ad">
    <c:choose>
									<c:when test="${not empty adList2&&fn:length(adList2)>0}">
										<a href="${adList2[0].linkUrl }" target="_blank"><img src="${ctx}${adList2[0].path}" width="260px" height="70px"/></a>
									</c:when>
									
								</c:choose>
 
 </div>
  <div class="list_contus">联系我们</div>
  <div class="list_contus_l">
    <em>电话：${fn:substring(ncEntity.Tel, 0, 20)}</em>
    <em>传真：${fn:substring(ncEntity.Max, 0, 20)}</em>
  </div>
  <div class="list_contus_c">
  <em>地址：${fn:substring(ncEntity.Address, 0, 20)}</em></div>
  
 </div>
 