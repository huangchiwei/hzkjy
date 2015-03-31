<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><decorator:title default="广州市海珠科技产业园有限公司!" /></title>
     <link href="${ctx}/theme/portal/default/style/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/theme/portal/default/style/default.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
	<script>
	 function searchFun(){
			var searchTxt= $("#searchTxt").val();
			if(searchTxt=="请输入关键词"){
				$("#searchTxt").attr("value","");
				}
			 }
	function addFavorite(sURL, sTitle)
	{
	    try
	    {
	        window.external.addFavorite(sURL, sTitle);
	    }
	    catch (e)
	    {
	        try
	        {
	            window.sidebar.addPanel(sTitle, sURL, "");
	        }
	        catch (e)
	        {
	            alert("加入收藏失败，请使用Ctrl+D进行添加");
	        }
	    }
	}
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
</script>

        <decorator:head />
    </head>

    <body>


<div class="top">
 <div class="top_970">
  <div class="top_right">
   <div class="i_s_d"><span><a href="#">设为首页</a></span><span><a onclick="addFavorite(window.location,document.title)" style="cursor:pointer">加入收藏</a></span><span><a href="${ctx}/admin/index.html" target="_blank">网站后台</a></span></div>
   <div class="search">
    <div class="search_box">
     <form action='${ctx}/portal/news/search/1.html' method="post">
      <input name="searchTxt" class="keywords" onfocus="searchFun()"  id="searchTxt" value="${(empty searchText)?'请输入关键词' :searchText}"/>
      <input type="submit"   value="搜索" class="rssclick" />
      </form>
    </div>
   </div>
  </div>
 </div>
</div>
<!--导航样式-->
<div class="nav_box">
<div class="lanren">
    <a href='${ctx }/portal/index.html'  <c:if test="${cateCode=='index'}">class="thisclass relative"</c:if>>首&nbsp;&nbsp;页<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=park_intro' <c:if test="${cateCode=='park_intro'||cateCode=='park_frame'||cateCode=='park_site'||cateCode=='park_envir'}">class="thisclass relative"</c:if>>园区概况<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=policy_regu' <c:if test="${cateCode=='policy_regu'||cateCode=='policy_province'||cateCode=='policy_park'}">class="thisclass relative"</c:if>>政策法规<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=notice_lastest' <c:if test="${cateCode=='notice_lastest'}">class="thisclass relative"</c:if>>最新公告<div class="img_float"></div></a>
    <%--<a href='javascript:' class="relative">园区大事记<div class="img_float"></div></a>
    --%><a href='${ctx }/portal/news/list/1.html?cateCode=service_human' <c:if test="${cateCode=='service_human'}">class="thisclass relative"</c:if>>人力资源<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=service_apply' <c:if test="${cateCode=='service_apply'}">class="thisclass relative"</c:if>>项目申报<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=service_business'  <c:if test="${cateCode=='service_business'}">class="thisclass relative"</c:if>>招商信息<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=train_notice' <c:if test="${cateCode=='train_notice'||cateCode=='train_file'}">class="thisclass relative"</c:if>>交流培训<div class="img_float"></div></a>
   
</div>
</div>

        <decorator:body />
    
	<!--bot-->
		<div class="bot">
			copyright ? 1998-2015 广州市海珠科技产业园 All Rights Reserved 粤ICP备1022679号
		</div>
 <!--bot_end-->
    </body>
</html>