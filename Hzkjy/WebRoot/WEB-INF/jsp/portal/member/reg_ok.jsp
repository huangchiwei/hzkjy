<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广州市海珠科技产业园有限公司</title>
		<link href="${ctx}/theme/portal/default/style/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/theme/portal/default/style/default.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
		<script>
	$(function() {
		var lanren = $(".lanren a");
		lanren.click(function() {
			$(this).addClass("thisclass").siblings().removeClass("thisclass");
		});
	});
	function delayURL() {//定时
		var time = document.getElementById("time");
		if (time.innerHTML > 0) {
			time.innerHTML = time.innerHTML - 1;
		} else {
			location.href = '${ctx}/portal/index.html';
		}
		setTimeout(delayURL, 1000);
	}
</script>
	</head>

	<body>
		<jsp:include page="/WEB-INF/jsp/portal/common/head.jsp" />
		<div class="content">
			<div class="reg_location">
				<h1>
					会员注册成功
				</h1>
				<div class="location">
					当前所在位置：
					<a href="#">首页</a>&nbsp;&gt;&nbsp;会员注册
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
						您的登录账号：
						<font class="c_ff0000"><b>${userNo}</b>
						</font>
					</p>
					<p>
						您的登录密码：
						<font class="c_ff0000"><b>${password}</b>
						</font>
					</p>
					<p>
						<font class="c_2c6abf"><b>请保存好您的账号与密码！</b>
						</font>
					</p>
					<div class="btn_box">
					<input onclick="javascript:location.href='${ctx}/portal/index.html'" id="sumbit_bt" type="button" class="tj" value="马上登录" />
     				</div>
				</div>


			</div>
		</div>

		<!--bot-->
		<div class="bot">
			copyright ? 1998-2015 广州市海珠科技产业园 All Rights Reserved 粤ICP备1022679号
		</div>
	</body>
</html>
