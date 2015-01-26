<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />

<script src="${ctx}/js/formValidator/jquery-1.4.4.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/js/jsp/sys/ModifyPwd.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	formInitConfig("add_form",3000);
	autoValidate();
});

</script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
<form id="add_form" action='${ctx}/sys/sysUser/modifyPwd.html' method="post" >
  <div class="add_info">
   <h2>修改密码</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
       <tr>
       		<th>旧密码：</th>
		     <td>
		     	<input id="oldPwd" name="oldPwd" type="password" />
		     </td>
             <th>新密码：</th>
		     <td>
		     	<input id="newPwd" name="newPwd" type="password" />
		     </td>
		     <th>重复密码：</th>
		     <td>
		     	<input id="newRePwd" type="password" />
		     </td>
       </tr>
       </table>
   <p class="div_submit">
    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/><font color="red">${msg}</font>
   </p>
  </div>
  </form>
   
</div>

</body>
</html>