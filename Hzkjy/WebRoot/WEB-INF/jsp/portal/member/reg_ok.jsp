<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广州市海珠科技产业园有限公司</title>
	</head>

	<body>
	<div class="content">
			<div class="reg_location">
				<h1>
					会员注册成功
				</h1>
				<div class="location">
					当前所在位置：
					<a href="${ctx}/portal/index.html">首页</a>&nbsp;&gt;&nbsp;会员注册
				</div>
			</div>
			<div class="reg_ok">
				<h1>
					成功提示
				</h1>
				<div class="reg_b_ts_b">
					<h2>
						恭喜您，已经注册成功！
					</h2>
					<p>
						
						<font class="c_ff0000"><b>您的账号正在审核中</b>
						</font>
					</p>
					<p>
						<font class="c_2c6abf"><b>请保存好您的账号与密码！</b>
						</font>
					</p>
					<div class="btn_box">
					<input onclick="javascript:location.href='${ctx}/portal/index.html'" id="sumbit_bt" type="button" class="btn_login" value="返回首页" />
     				</div>
				</div>


			</div>
		</div>

	</body>
</html>
