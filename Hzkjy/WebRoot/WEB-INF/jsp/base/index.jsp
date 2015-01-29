<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州教育馆后台管理系统</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/tab.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
 <script type="text/javascript" src="${ctx}/js/tab/content.js"></script>
<script language=Javascript>
$(function(){
	openNew('welcome','${ctx}/admin/welcome.html');
});
  function time(){
    //获得显示时间的div
    t_div = document.getElementById('showtime');
   var now=new Date()
    //替换div内容 
   t_div.innerHTML = "系统时间："+now.getFullYear()
    +"年"+(now.getMonth()+1)+"月"+now.getDate()
    +"日"+now.getHours()+"时"+now.getMinutes()
    +"分"+now.getSeconds()+"秒";
    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
   setTimeout(time,1000);
  }
</script>
<script>
function switchSysBar(){

	if (document.all("img1").src.indexOf("theme/admin/default/images/main_18.gif")>=0)
	{
	document.all("img1").src="${ctx}/theme/admin/default/images/main_18_1.gif";
	document.all("frmTitle").style.display="none";
	} 
	else
	{
	document.all("img1").src="${ctx}/theme/admin/default/images/main_18.gif";
	document.all("frmTitle").style.display="";
	} 
	}
</script>
</head>

<body bgcolor="#f5f5f5"  onload="time()" >

<div id="box">
<div class="main_top relative">
 <div class="top_logo"></div>
 <div class="top_toolbar">
  <div class="top_t_time"  id="showtime"></div>
  <div class="div">
   <div class="user">${userNo}</div>
      <div class="home"><a href="javascript:openNew('welcome','${ctx}/centerPage/welcome.html')">首页</a></div>
   <div class="set"><a href="javascript:openNew('修改密码','${ctx}/admin/sysUser/toModifyPwd.html')">修改密码</a></div>
   <div class="quit"><a href="${ctx}/admin/loginOut.html">退出</a></div>
  </div>
 </div>
 
</div>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
  <tr>
    <td width="238" id=frmTitle noWrap name="fmTitle" align="center" valign="top">
	<iframe name="I1" height="100%" width="238" src="${ctx}/admin/left.html" border="0" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td width="7" valign="middle" onclick=switchSysBar()><span class="navPoint"><img src="${ctx}/theme/admin/default/images/main_18.gif" name="img1" width=7 height=81 id=img1></span></td>
    <td align="center" valign="top"  width="100%">
   <div id="wrapper" >
     <div class="div_tabla relative" >
     <ul id="tabs" style="height: 26px;">
       <!-- Tabs go here -->
     </ul>
     <div class="div_icon">
     <a href="#" onClick="refresh();"><img src="${ctx}/theme/admin/default/images/refresh.png"  alt="刷新当前页面" border="0"/></a>
     <a href="#" onClick="closeAllTab();openNew('welcome','${ctx}/admin/welcome.html');"><img src="${ctx}/theme/admin/default/images/close_all.png" alt="关闭所有页面" border="0"/></a>
     </div>
     </div>
       
    </div>
  <div id="content">
           <!-- Tab content goes here -->
        </div>
      <script language=Javascript>
      var srollHeight=$(window).height()-100;
      var explorer = window.navigator.userAgent ;
      if (explorer.indexOf("MSIE") >= 0) {  //IE
    	  srollHeight= document.body.scrollHeight;
          }
      
      $("#content").css("height",srollHeight+"px");
      </script>
    <%--<iframe id="contentIframe" name="I2" height="100%" width="100%" border="0" frameborder="0" src="${ctx}/admin/content.html" scrolling="auto"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>--%>
    </td>
   
  </tr>
  <%--<tr>
    <td colspan="3"></td>
  </tr>
  --%><%--<tr>
    <td id=frmTitle4 noWrap name="fmTitle" align="center" valign="top">&nbsp;</td>
    <td valign="middle" onclick=switchSysBar()>&nbsp;</td>
    <td align="center" valign="top" height="100%">&nbsp;</td>
  </tr>
--%>

</table>
<div class="bot">&copy; 2014 jr81.com Co., Ltd. All Rights Reserved.</div>
</div>

</body>
</html>