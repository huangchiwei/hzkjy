<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改成功</title>
	
		
	</head>

	<body>
<div class="content">
<div class="reg_location">
 <h1>找回密码</h1>
 <div class="location">当前所在位置：<a href="#">首页</a>&nbsp;>&nbsp;找回密码</div>
</div>
<div class="forget">
  <div class="forget_c">
   <span><div class="a1">第一步：验证邮箱</div></span>
   <span><div class="a1">第二步：重置密码</div></span>
   <span><div class="a2">第三步：完成</div></span>
  </div>
    <div class="forget_mail">
     <span class="c_ff0000">恭喜您！密码找回成功！</span>
     <div class="btn_box"><input type="button" class="member" value="进入会员中心" onclick="javascript:location.href='${ctx}/admin/index.html'"/>
     <input type="button" class="main" value="返回首页" onclick="javascript:location.href='${ctx}/'"/>
     </div></div>
 </div>
</div>

	</body>
</html>
