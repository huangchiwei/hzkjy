 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  <div class="list_left">
  <c:choose>
  <c:when  test="${cateCode=='park_intro'||cateCode=='park_frame'||cateCode=='park_site'||cateCode=='park_envir'}">
    <div class="list_lm">
   <h1>园区概况</h1>
  </div>
 <div class="list_box_b">
   <div class="left_nav">
     <ul id="menu">
      <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=park_intro">园区介绍</a></li>
       <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=park_frame">组织架构</a></li>
        <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=park_site">园区位置</a></li>
        <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=park_envir">创业环境</a></li>
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
           <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=policy_regu">国家政策</a></li>
       <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=policy_province">省市政策</a></li>
        <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=policy_park">园区政策</a></li>
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
         <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=train_notice">培训通知</a></li>
           <li class="current-cat no"><a href="${ctx }/portal/news/list/1.html?cateCode=train_file">培训课件</a></li>
     </ul>
    </div>
  
  </div>
  </c:when>
  </c:choose>


  
 
 <div class="list_ad"><img src="${ctx}/theme/portal/default/images/ad_216.png" /></div>
  <div class="list_contus">联系我们</div>
  <div class="list_contus_l">
    <em>电话：020-89232382</em>
    <em>传真：020-89232138</em>
  </div>
  <div class="list_contus_c">
  <em>地址：广州市海珠区新港东路2429</em></div>
  
 </div>
 