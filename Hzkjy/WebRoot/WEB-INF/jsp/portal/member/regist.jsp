<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<link href="${ctx}/theme/portal/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/portal/default/style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});
});
$(function(){
	$("#sumbit_bt").click(function(){
		var msg = '';
		if($.trim($("#qymc").val()) == ''){
			msg = '请填写企业名称';
			$("#qymc").focus();
		}else if($("#zczb").val() != '' && (!/^\d+$/.test($("#zczb").val()))){
			msg = '请填写正确的注册资金';
			$("#zczb").focus();
		}else if($.trim($("#zzjgdm").val()) == ''){
			msg = '请填写组织机构代码';
			$("#zzjgdm").focus();
		}else if (!/^[a-zA-Z0-9]{9}$/.test($("#zzjgdm").val())){
			msg = "组织机构代码由9个字符长度由字母或数字组成";
			$("#zzjgdm").focus();
		}else if($("#frdb").val() == ''){
			msg = '请填写法人姓名';
			$("#frdb").focus();
		}else if($.trim($("#frlxdh").val()) == ''){
			$("#frlxdh").focus();
			msg = '请填写法人电话';
		}else if ((!/^0\d{2,3}-?\d{7,8}$/.test($("#frlxdh").val())) && (!/^1[3|4|5|8]\d{9}$/.test($("#frlxdh").val()))){
			msg = "法人电话格式不正确!";
			$("#frlxdh").focus();
		}else if($('#lxrdh').val() != '' && (!/^0\d{2,3}-?\d{7,8}$/.test($("#lxrdh").val())) && (!/^1[3|4|5|8]\d{9}$/.test($("#lxrdh").val()))){
			msg = "企业联系电话格式不正确!";
			$("#lxrdh").focus();
		}
		if(msg == ''){
			return true;
		}
		alert(msg);
		return false;
	});
	$("#qymc").focus();
});
</script>
</head>

<body>
<form action="${ctx}/portal/memberBasic/regist.html" method="post">
<input name="token" value="${token}" type="hidden"/>
<jsp:include page="/WEB-INF/jsp/portal/common/head.jsp" />

<div class="content">
<div class="reg_location">
 <h1>会员注册</h1>
 <div class="location">当前所在位置：<a href="#">首页</a>&nbsp;&gt;&nbsp;会员注册</div>
</div>
<div class="reg_box">
 <div class="reg_b_ts">
  <h1>注册提示</h1>
  <div class="reg_b_ts_b">
   <h2> 注册前请确认：</h2>
   <p>1、贵公司的注册的企业名称必须是真实有效；</p>
   <p>2、贵公司是从事IT产业及其它高科技产业研发、生产、服务的企业。</p>
  </div>
 </div>
 <div class="zl_title"><b>用户填写资料</b>&nbsp;&nbsp;带<font class="c_ff0000"><b>*</b></font>为必填项</div>
 <div class="zl_box">
     <div class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业名称：</span>
       <input name="qymc" id="qymc" type="text" class="input" size="30" />
       <em class="c_f07700">(注册后将不能修改)</em>
     </div>
     <div class="li"><span class="span">成立时间：</span><input name="qyclsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="25"  class="input"/>
     <em>&nbsp;</em>
     </div>
     <div class="li"><span class="span">注册资金：</span><input name="zczb" id="zczb" type="text" class="input" size="25" />
     <em>万</em>
     </div>
     <div class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;组织机构代码：</span><input name="zzjgdm" id="zzjgdm" type="text" class="input" size="25" /><em class="c_f07700">（注册后将不能修改,共9个字符长度由字母或数字组成）</em>
     </div>
     <div class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人姓名：</span><input name="frdb" id="frdb" type="text" class="input" size="25" />
     <em>（固定电话和手机,样式:076912121212或1352323121）</em>
     </div>
     <div class="li"><span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人电话：</span><input name="frlxdh" id="frlxdh" type="text" class="input" size="25" /><em>方便确认企业联系法人</em>
       
     </div>
     <div class="li"><span class="span">行业类别：</span><select name="hylb" class="input">
	<option value="5">其他</option>
	<option value="4">展览服务</option>
	<option value="3">新技术新材料</option>
	<option value="2">电子与信息</option>
	<option value="1">生物医药与技术</option>

</select><em>&nbsp;</em>
     </div>
     <div class="li"><span class="span">企业地址：</span><input name="address" type="text" size="30" value="" class="input"/><em>&nbsp;</em></div>
     <div class="li"><span class="span">企业联系电话：</span><input name="lxrdh" id="lxrdh" type="text"  size="25" value="" class="input"/>
     <em>&nbsp;</em></div>
     <div class="li"><div class="btn_box"><input id="sumbit_bt" type="submit" class="tj" value="提交加入" />
     </div>
    </div>
 </div>
</div>
</div>
</form>
<!--bot-->
<div class="bot">copyright ? 1998-2015 广州市海珠科技产业园 All Rights Reserved 粤ICP备1022679号</div>
</body>
</html>
