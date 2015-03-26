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
   <div class="i_s_d"><span><a href="#">设为首页</a></span><span><a href="#">加入收藏</a></span><span><a href="#">网站后台</a></span></div>
   <div class="search">
    <div class="search_box">
      <input name="search_term" class="keywords" id="search_term" value="请输入关键字"/>
      <input type="button" onclick="form_search();" value="搜索" class="rssclick" />
    </div>
   </div>
  </div>
 </div>
</div>
<!--导航样式-->
<div class="nav_box">
<div class="lanren">
    <a href='javascript:' class="thisclass relative">首&nbsp;&nbsp;页<div class="img_float"></div></a>
    <a href='javascript:' class="relative">园区概况<div class="img_float"></div></a>
    <a href='javascript:' class="relative">政府政策<div class="img_float"></div></a>
    <a href='javascript:' class="relative">新闻动态<div class="img_float"></div></a>
    <a href='javascript:' class="relative">园区大事记<div class="img_float"></div></a>
    <a href='javascript:' class="relative">人力资源<div class="img_float"></div></a>
    <a href='javascript:' class="relative">项目申报<div class="img_float"></div></a>
    <a href='javascript:' class="relative">招商信息<div class="img_float"></div></a>
    <a href='javascript:' class="relative">交流培训<div class="img_float"></div></a>
    <a href='javascript:'>联系我们</a>
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