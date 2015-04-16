<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <title>500系统出错了！</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
<style>
.error_404{background-image: url(${ctx}/theme/portal/default/images/500.png);background-repeat: no-repeat;height: 317px;width: 500px;margin-right: auto;margin-left: auto;}
.relative{position: relative;}
.float{position: absolute;top: 180px;left: 270px;}
.error_404 .float a {font-size: 14px;text-decoration: none;color: #0066CC;}
    </style>
  </head>
  
  <body>
  <div class="error_404 relative">
   <div class="float"><a href="${ctx}/portal/index.html">返回首页</a></div>
  </div>
  </body>
</html>
