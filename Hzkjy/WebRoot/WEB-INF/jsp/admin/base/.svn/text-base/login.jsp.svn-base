<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <title>登录</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
 	<script type="text/javascript">
 		$(function(){
			// 为验证码绑定事件
			$("#vimg").click(function(){
				$("#vimg").attr("src", "${ctx}/verify/getVerifyCode.html?random=" + Math.random());
			});
		});
 	</script>
  </head>

<body>
<form id="loginForm" action="${ctx}/admin/userLogin.html" method="post">
<div class="login_bj">
  <div class="login">
   <div class="login_box">
    <ul>
     <li class="li"><input id="userNo" name="userNo" type="text" value="${userNo}" style="width:190px;" class="input"/></li>
     <li class="li2"><input id="password" name="password" type="password" style="width:190px;" class="input"/></li>
     <li class="li3 relative">
       <input id="vcode" name="vcode" maxlength="4" style="width:60px;" class="input"/>
       <div class="div_img"><img src="${ctx}/verify/getVerifyCode.html" width="71"  style="margin-top:10px;cursor: pointer;" height="28" title="验证码" id="vimg"/></div>
     </li>
     <li style="margin-top:25px;">
     	<input id="login_bt" type="image" src="${ctx}/theme/admin/default/images/login_button.png" onmousemove="this.src='${ctx}/theme/admin/default/images/login_button_move.png'" onmouseout="this.src='${ctx}/theme/admin/default/images/login_button.png'" />
     </li>
     <li style="margin-top:9px;">
     	<font id="msg" color="red">${msg}</font>     </li>
    </ul>
   </div>
  </div>
</div>
</form>
</body>
</html>
