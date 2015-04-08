<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>找回密码</title>
	<script type="text/javascript">
 		$(function(){
			// 为验证码绑定事件
			$("#newPic").click(function(){
				$("#vimg").attr("src", "${ctx}/verify/getVerifyCode.html?random=" + Math.random());
			});
		});
 	</script>
		
	</head>

	<body>
	<form id="loginForm" action="${ctx}/portal/memberBasic/forgetemail.html" method="post">
	<div class="content">
<div class="reg_location">
 <h1>找回密码</h1>
 <div class="location">当前所在位置：<a href="#">首页</a>&nbsp;>&nbsp;找回密码</div>
</div>
<div class="forget">
  <div class="forget_a">
   <span><div class="a1">第一步：验证邮箱</div></span>
   <span><div class="a2">第二步：重置密码</div></span>
   <span><div class="a2">第三步：完成</div></span>
  </div>
    <ul class="ul">
     <li class="li"><span class="span">找回方式：</span><em>通过邮箱找回密码</em>
     </li>
     <li class="li"><span class="span">邮箱地址：</span><input type="text" name="email" class="input" size="30" />
     <em>请输入您在本网站填入的邮箱</em>
     </li>
     <li class="li"><span class="span">验证码：</span><input type="text" name="vcode" class="input" size="8" />
     <em><img src="${ctx}/verify/getVerifyCode.html" name="vimg" width="80" height="30" id="vimg"  style="cursor: pointer;" title="验证码"/></em><label>看不清？<span id="newPic" style="cursor: pointer;color:blue;" >换一张</span></label>
     </li>
     <li class="li"><div class="btn_box"><input type="submit" class="btn_next" value="下一步" />
     </div></li>
     <c:if test="${not empty msg}"><li class="li"><font color="red">${msg }</font></li></c:if>
    </ul>
 </div>
</div>
</form>
	</body>
</html>
