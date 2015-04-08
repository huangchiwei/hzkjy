<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>重置密码</title>
	
		
	</head>

	<body>
	<form id="loginForm" action="${ctx}/portal/memberBasic/submitResetPwd.html" method="post">
	<input type="hidden" name="userNo" value="${userNo}"/>
	<input type="hidden" name="mailSeq" value="${mailSeq}"/>
	<div class="content">
<div class="reg_location">
 <h1>找回密码</h1>
 <div class="location">当前所在位置：<a href="#">首页</a>&nbsp;>&nbsp;找回密码</div>
</div>
<div class="forget">
  <div class="forget_b">
   <span><div class="a1">第一步：验证邮箱</div></span>
   <span><div class="a2">第二步：重置密码</div></span>
   <span><div class="a1">第三步：完成</div></span>
  </div>
    <ul class="ul">
     <li class="li"><span class="span">新 密 码：</span><input type="password" name="pwd" class="input" size="27" />
     <em>请输入您的新密码</em>
     </li>
     <li class="li"><span class="span">确认密码：</span><input type="password" name="repwd" class="input" size="27" />
     <em>请再次输入您的新密码</em>
     </li>
     <li class="li"><div class="btn_box"><input type="submit" class="btn_next" value="下一步" /></div></li>
     <c:if test="${not empty msg}"><li class="li"><font color="red">${msg }</font></li></c:if>
    </ul>
 </div>
</div>
</form>
	</body>
</html>
