<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>广州市海珠科技产业园--<decorator:title default="" /></title>
     <link href="${ctx}/theme/portal/default/style/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/theme/portal/default/style/default.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
	<script>
	//设为首页
	
	function SetHome(obj){
	
	    try{
	        obj.style.behavior='url(#default#homepage)';
	        obj.setHomePage('http://122.13.2.93:8080/Hzkjy');
	    }catch(e){
	        if(window.netscape){
	            try{
	                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
	            }catch(e){
	                alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
	            };
	        }else{
	            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将'http://122.13.2.93:8080/Hzkjy'设置为首页。");
	        };
	    };
	};
		
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
   <div class="i_s_d"><span><a  href="javascript:void(0);" onclick="SetHome(this,'http://122.13.2.93:8080/Hzkjy');">设为首页</a></span><span><a onclick="addFavorite(window.location,document.title)" style="cursor:pointer">加入收藏</a></span><span><a href="${ctx}/admin/index.html" target="_blank">网站后台</a></span><span><a href="http://znpp.hzkjcyy.com/system/login" target="_blank">智能匹配系统后台</a></span></div>
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
    <a href='${ctx }/portal/index.html' class="relative <c:if test="${cateCode=='index'}">thisclass</c:if>" >首&nbsp;&nbsp;页<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=park_intro' class="relative <c:if test="${cateCode=='park_intro'||cateCode=='park_frame'||cateCode=='park_site'||cateCode=='park_envir'}">thisclass</c:if>" >园区概况<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=policy_regu' class="relative <c:if test="${cateCode=='policy_regu'||cateCode=='policy_province'||cateCode=='policy_park'}">thisclass</c:if>" >政策法规<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=notice_lastest' class="relative <c:if test="${cateCode=='notice_lastest'}">thisclass</c:if>" >最新公告<div class="img_float"></div></a>
    <%--<a href='javascript:' class="relative">园区大事记<div class="img_float"></div></a>
    --%><a href='${ctx }/portal/news/list/1.html?cateCode=service_human' class="relative <c:if test="${cateCode=='service_human'}">thisclass</c:if>" >人力资源<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=service_apply' class="relative <c:if test="${cateCode=='service_apply'}">thisclass</c:if>" >项目申报<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=service_business' class="relative <c:if test="${cateCode=='service_business'}">thisclass</c:if>" >招商信息<div class="img_float"></div></a>
    <a href='${ctx }/portal/news/list/1.html?cateCode=train_notice' class="relative <c:if test="${cateCode=='train_notice'||cateCode=='train_file'}">thisclass</c:if>" >交流培训<div class="img_float"></div></a>
   <a href="${ctx }/portal/news/list/1.html?cateCode=contact_us" class="relative <c:if test="${cateCode=='contactUs'}">thisclass</c:if>" >联系我们</a>
</div>
</div>

        <decorator:body />
    
	<!--bot-->
		<div class="bot">版权所属：广州市海珠科技产业园有限公司&nbsp;&nbsp;&nbsp;ICP备案号：<a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备15012072号</a><br />
		联系方式：广州市新港东路2429号琶洲科技园&nbsp;&nbsp;&nbsp;电话：020-89232382、020-89232477<br /><script language=JavaScript>
<!-- 
var caution = false
function setCookie(name, value, expires, path, domain, secure) {
var curCookie = name + "=" + escape(value) +
((expires) ? "; expires=" + expires.toGMTString() : "") +
((path) ? "; path=" + path : "") +
((domain) ? "; domain=" + domain : "") +
((secure) ? "; secure" : "")
if (!caution || (name + "=" + escape(value)).length <= 4000)
document.cookie = curCookie
else
if (confirm("Cookie exceeds 4KB and will be cut!"))
document.cookie = curCookie
}
function getCookie(name) {
var prefix = name + "="
var cookieStartIndex = document.cookie.indexOf(prefix)
if (cookieStartIndex == -1)
return null
var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length)
if (cookieEndIndex == -1)
cookieEndIndex = document.cookie.length
return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex))
}
function deleteCookie(name, path, domain) {
if (getCookie(name)) {
document.cookie = name + "=" + 
((path) ? "; path=" + path : "") +
((domain) ? "; domain=" + domain : "") +
"; expires=Thu, 01-Jan-70 00:00:01 GMT"
}
}
function fixDate(date) {
var base = new Date(0)
var skew = base.getTime()
if (skew > 0)
date.setTime(date.getTime() - skew)
}
var now = new Date()
fixDate(now)
now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000)
var visits = getCookie("counter")
if (!visits)
visits = 1
else
visits = parseInt(visits) + 1
setCookie("counter", visits, now)
document.write("您是第&nbsp;" + visits + "&nbsp;位访问本网站的！")
// -->
</script>

</div>
 <!--bot_end-->
    </body>
</html>