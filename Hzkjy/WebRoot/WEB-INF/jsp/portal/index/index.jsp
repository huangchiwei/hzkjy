<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<%--<link href="${ctx}/theme/portal/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/portal/default/style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
--%><script type="text/javascript" src="${ctx}/theme/portal/default/js/common.js"></script>
<script>
$(function(){
	/*var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});*/
	$('#login_btn').click(function(){
		var msg = '';
		if($.trim($("#userNo").val()) == ''){
			msg = '请输入登录账号';
			$("#userNo").focus();
		}else if($("#password").val() == ''){
			msg = '请输入登录密码';
			$("#password").focus();
		}
		if(msg != ''){
			alert(msg);
			return;
		}
		$.ajax({
				url:'${ctx}/portal/userLogin.html',
		  		type:'post',
		  		dataType:'json',
		  		data:'userNo=' + $("#userNo").val() + "&password=" + $("#password").val(),
		  		async:true,
		  		success:function(data){
		  			if(data.flag == "1"){
		  				location.href = "${ctx}/admin/index.html";
		  			}else{
		  				alert(data.msg);
		  			}
		  			
		  		}
		  	});
	});
});
function downloadFile(id){
	var userNo="${cookie.admin_key.value}";
	if(userNo==""){
		alert("请先登录再下载.");
		return false;
		}
	window.location.href="${ctx}/portal/news/downLoad/"+id+".html";
}
</script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/lrtk.js"></script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/lrtk_bht.js"></script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/scroll.js"></script>
</head>

<body>
<%--<jsp:include page="/WEB-INF/jsp/portal/common/head.jsp" />
--%><!--变化图样式-->
<div class="banner_index">
  <a href="javascript:void(0);" class="btn btnPre" id="banner_index_pre"></a>
  <a href="javascript:void(0);" class="btn btnNext" id="banner_index_next"></a>
    <ul class="banner_wrap" id="banner_index">
    <c:forEach items="${adList0}" varStatus="index" var="o" >  
     <li><a href="${o.linkUrl}" target="_blank"><img src="${ctx}${o.path}" width="970px" height="300px"/></a></li>
    </c:forEach>
    
    </ul>
</div>
<div class="indexBanner_num" id="index_numIco"></div>
<script type="text/javascript">
var ShowPre1 = new ShowPre({box:"banner_index",Pre:"banner_index_pre",Next:"banner_index_next",numIco:"index_numIco",loop:1,auto:1});
</script>
<!-- 代码 结束 -->
<div class="content">
 <div class="left">
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>园区概况</h1>
    <span>Park Overview</span>
    <div class="more"><a href="${ctx }/portal/news/list/1.html?cateCode=park_intro">更多&gt;&gt;</a></div>
   </div>
   <div class="introduction relative">
    <h1>广州市海珠科技产业园有限公司</h1>
    <p>广州市海珠科技产业园有限公司（以下简称科技园公司）成立于1998年，是广州市海珠区科技产业基地琶洲园区的经营管理单位。琶洲园区成立于1998年，地处琶洲岛东部黄埔村北侧，距会展中心2.3公里，以国家科技兴海——广东海珠海洋生物技术产业开发示范基地.....</p>
    <div class="float_btn">
     <a class="icon_a1" href="${ctx }/portal/news/list/1.html?cateCode=park_intro">园区介绍</a>
     <a class="icon_a2" href="${ctx }/portal/news/list/1.html?cateCode=park_frame">组织架构</a>
     <a class="icon_a3" href="${ctx }/portal/news/list/1.html?cateCode=park_site">园区位置</a>
     <a class="icon_a4" href="${ctx }/portal/news/list/1.html?cateCode=park_envir">创业环境</a>
    </div>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>最新公告</h1>
    <span>Latest Announcement</span>
    <div class="more"><a href="${ctx }/portal/news/list/1.html?cateCode=notice_lastest">更多&gt;&gt;</a></div>
   </div>
   <div class="announcement">
    <div class="announcement_l">
     <div id="box">
     <div class="prev"></div>
     <div class="next"></div>
    <ul class="bigUl">
     <c:forEach items="${noticeList}" var="o" varStatus="sta">
      <c:if test="${sta.index<4}">
      <li <c:if test="${sta.index==0}">style="z-index:1"</c:if>><a href="${ctx}/portal/news/detail/${o.id}.html">
       <c:if test="${fn:contains(o.src, 'userfiles')==true}"><img src="${o.src}" width="300" height="200"/></c:if>
      <c:if test="${fn:contains(o.src, 'userfiles')==false}"><img src="${ctx}/theme/portal/default/images/2.jpg" width="300" height="200" /></c:if>
     </a></li>
      </c:if>
       </c:forEach>
    <%--
       <li style="z-index:1"><a href="#"><img src="${ctx}/theme/portal/default/images/4.jpg" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/2.jpg" width="300" height="200" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/3.jpg" width="300" height="200" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/1.jpg" width="300" height="200" /></a></li>
    --%></ul>
    <ul class="numberUl">
    <c:forEach items="${noticeList}" var="o" varStatus="sta">
      <c:if test="${sta.index<4}">
      <li <c:if test="${sta.index==0}">class="night"</c:if>><a href="javascript:;">${sta.index+1}</a></li>
      </c:if>
      </c:forEach>
     
    </ul>
    <div>
      <ul class="textUl">
       <c:forEach items="${noticeList}" var="o" varStatus="sta">
       <li <c:if test="${sta.index==0}">style="display:block;"</c:if>><a href="${ctx}/portal/news/detail/${o.id}.html">${fn:substring(o.title, 0, 20)}</a></li>
       </c:forEach>
      <%--
        <li style="display:block;"><a href="#">定位精品路线 原创试驾奇瑞艾瑞</a></li>
        <li><a href="#">锂电池是亮点 米儿低速电动车设计</a></li>
        <li><a href="#">舒适及操控更上一层楼 测试长安金</a></li>
        <li><a href="#">外观动感/配置丰富 天籁2.0L用车记</a></li>
      --%></ul>
    </div>
 </div>
    </div>
    <div class="announcement_r">
     <h1>
     <c:if test="${noticeList!=null&&fn:length(noticeList)>0}">
     <a href="${ctx }/portal/news/detail/${noticeList[0].id}.html">${fn:substring(noticeList[0].title, 0, 28)}</a>
     </c:if>
     </h1>
     <ul>
  
       <c:forEach items="${noticeList}" varStatus="index" var="o" >  
        <c:if test="${index.index>0}">
          <li><span><fmt:formatDate value="${o.realTime}" pattern="yyyy-MM-dd"/> </span><a href="${ctx }/portal/news/detail/${o.id}.html">${fn:substring(o.title, 0, 20)}</a></li>
       </c:if>
       </c:forEach>
      
      
     </ul>
    </div>
   </div>
  </div>
  <div class="ad_690">
  								 <c:choose>
									<c:when test="${not empty adList1&&fn:length(adList1)>0}">
										<a href="${adList1[0].linkUrl }" target="_blank"><img src="${ctx}${adList1[0].path}" width="690px" height="90px"/></a>
									</c:when>
									
								</c:choose>
  </div>
  <div class="left_box2">
   <div class="left_box2_l">
    <div class="l_b_l_t relative">
     <h1>交流培训</h1>
     <div class="more"><a href="${ctx }/portal/news/list/1.html?cateCode=train_notice">更多&gt;&gt;</a></div>
    </div>
    <div class="l_b_l_b">
     <ul>
      <c:forEach items="${trainList}" varStatus="index" var="o" >  
     							 <c:choose>
									<c:when test="${o.cateCode=='train_file'}">
										<li class="li">[&nbsp;${o.cateName}&nbsp;]&nbsp;&nbsp;<a  onclick="downloadFile('${o.id}')" style="cursor:pointer;">${fn:substring(o.title, 0, 17)}</a></li>
									</c:when>
									<c:otherwise>
										<li class="li">[&nbsp;${o.cateName}&nbsp;]&nbsp;&nbsp;<a
											href="${ctx}/portal/news/detail/${o.id}.html?cateCode=${cateCode}">${fn:substring(o.title, 0, 17)}</a></li>
									</c:otherwise>
								</c:choose>
      
    </c:forEach>
    
       </ul>
    </div>
   </div>
   <div class="left_box2_2">
    <div class="l_b_l_t relative">
     <h1>政府政策</h1>
     <div class="more"><a href="${ctx }/portal/news/list/1.html?cateCode=policy_regu">更多&gt;&gt;</a></div>
    </div>
    <div class="l_b_l_b">
     <ul>
    <c:forEach items="${policyList}" varStatus="index" var="o" >  
       <li class="li">[&nbsp;${o.cateName}&nbsp;]&nbsp;&nbsp;<a href="${ctx }/portal/news/detail/${o.id}.html">${fn:substring(o.title, 0, 17)}</a></li>
    </c:forEach>
     </ul>
    </div>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>友情连接</h1>
    <span>Links</span>
    <div class="more"><a href="#"></a></div>
   </div>
   <div class="links">
    <c:forEach items="${newsLinkList}" varStatus="index" var="o" >  
    <a href="${o.UrlLink }">${o.Name }</a>
    </c:forEach><%--
    <a href="#">海珠区科信局</a><a href="#">广州市科信局</a><a href="#">广州市发改局</a><a href="#">广州经贸网</a><a href="#">广东省科技厅</a><a href="#">广州市中小企业信息网</a>
   --%></div>
  </div>
 </div>
 <div class="right">
  <div class="left_box">
   <div class="left_box_title">
    <h2>企业登录</h2>
   </div>
   <div class="login">
    <ul>
     <li class="account"><em>用户名</em><input id="userNo" name="userNo" type="text" class="input" />
     </li>
     <li class="password"><em>密码</em><input id="password" name="password" type="password" class="input1"/>
     </li>
      <li class="btn"><input id="login_btn" type="button" class="btn_a1" value="登录"/>
     </li>
     <li class="input_txt"><a href="${ctx}/portal/memberBasic/forget.html">忘记密码?</a><a href="${ctx}/portal/memberBasic/toRegist.html">用户注册</a></li>
     <%--<li class="btn"><input id="login_btn" type="image" src="${ctx}/theme/portal/default/images/login_btn.png" />&nbsp;<input onclick="javascript:location.href='${ctx}/portal/memberBasic/toRegist.html'" type="image" src="${ctx}/theme/portal/default/images/reg_btn.png" />
     </li>
    --%></ul>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title">
    <h3>企业服务</h3>
   </div>
   <div class="service">
    <ul>
     <li class="service1">入园导向</li>
     <li class="service2"><span><a href="${ctx}/portal/news/list/1.html?cateCode=service_inpark_guide">入园指南</a></span><span><a href="${ctx}/portal/news/list/1.html?cateCode=service_inpark_process">入园流程</a></span></li>
     <li class="service3">出园导向</li>
     <li class="service4"><span><a href="${ctx}/portal/news/list/1.html?cateCode=service_outpark_guide">出园指南</a></span><span><a href="${ctx}/portal/news/list/1.html?cateCode=service_outpark_process">出园流程</a></span></li>
     <li class="service5"><a href="${ctx}/portal/news/list/1.html?cateCode=service_base">基础服务</a></li>
     <li class="service6"><a href="${ctx}/portal/news/list/1.html?cateCode=service_human">人力资源</a></li>
     <li class="service7"><a href="${ctx}/portal/news/list/1.html?cateCode=service_apply">项目申报</a></li>
     <li class="service8"><a href="${ctx}/portal/news/list/1.html?cateCode=service_business">招商信息</a></li>
    </ul>
   </div>
  </div>
  <div class="ad_265"><a href="http://znpp.hzkjcyy.com" target="_blank"><img src="${ctx}/theme/portal/default/images/ad_260.png" /></a></div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h4>入驻企业</h4>
    <div class="more"><a href="${ctx }/portal/memberBasic/list/1.html">更多&gt;&gt;</a></div>
   </div>
   <div class="business">
     <div id="scrollDiv">
      <ul>
       <c:forEach items="${memberList}" varStatus="index" var="o" >  
       <li class="li"><a href="${ctx }/portal/memberBasic/detail/${o.id}.html">${fn:substring(o.qymc, 0, 20)}</a></li>
    </c:forEach>
             
      </ul>
     </div>
   </div>
  </div>
 </div>
</div>
<!--bot-->
<%--<div class="bot">copyright ? 1998-2015 广州市海珠科技产业园 All Rights Reserved 粤ICP备1022679号</div>

--%></body>
</html>
