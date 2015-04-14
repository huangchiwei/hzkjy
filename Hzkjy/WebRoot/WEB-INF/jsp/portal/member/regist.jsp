<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<%--<link href="${ctx}/theme/portal/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/portal/default/style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
--%><script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script>

$(function(){
	var telReg = /^0\d{2,3}-?\d{7,8}$/;
	var phoneReg = /^1[3|4|5|8]\d{9}$/;
	$("#sumbit_bt").click(function(){
		var msg = '';
		if($.trim($("#qymc").val()) == ''){
			msg = '请填写企业名称';
			$("#qymc").focus();
		}else if($.trim($("#email").val()) == ''){
			msg = '请填写邮箱';
			$("#email").focus();
		}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test($("#email").val()))){
			msg = '请填写正确的邮箱';
			$("#email").focus();
		}else if($("#address").val() != '' && (!/^http[s]?:\/\/([\w-]+\.)+[\w-]+([\w-./?%&=]*)?$/.test($("#address").val()))){
			msg = '请填写以Http://开头的正确网址';
			$("#address").focus();
		}else if($("#mj").val() != '' && (!/^\d+$/.test($("#mj").val()))){
			msg = '面积请填写数字';
			$("#mj").focus();
		}else if($("#zczb").val() != '' && (!/^\d+$/.test($("#zczb").val()))){
			msg = '注册资金请填写数字';
			$("#zczb").focus();
		}else if($("#frdb").val() == ''){
			msg = '请填写法人代表';
			$("#frdb").focus();
		}else if($.trim($("#frlxdh").val()) == ''){
			$("#frlxdh").focus();
			msg = '请填写法人电话';
		}else if ((!telReg.test($("#frlxdh").val())) && (!phoneReg.test($("#frlxdh").val()))){
			msg = "法人电话格式不正确：区号+电话或手机号码";
			$("#frlxdh").focus();
		}else if($('#lxrdh').val() != '' && (!telReg.test($("#lxrdh").val())) && (!phoneReg.test($("#lxrdh").val()))){
			msg = "企业联系电话格式不正确：区号+电话或手机号码";
			$("#lxrdh").focus();
		}else if($.trim($("#zzjgdm").val()) == ''){
			msg = '请填写组织机构代码';
			$("#zzjgdm").focus();
		}else if (!/^[a-zA-Z0-9]{9}$/.test($("#zzjgdm").val())){
			msg = "组织机构代码由9个字符长度由字母或数字组成";
			$("#zzjgdm").focus();
		}else if($("#htstze").val() != '' && (!/^\d+$/.test($("#htstze").val()))){
			msg = '风险投资额请填写数字';
			$("#htstze").focus();
		}else if($("#dzys").val() != '' && (!/^\d+$/.test($("#dzys").val()))){
			msg = '大专以上人员请填写数字';
			$("#dzys").focus();
		}else if($("#xnyjdxs").val() != '' && (!/^\d+$/.test($("#xnyjdxs").val()))){
			msg = '应届毕业生请填写数字';
			$("#xnyjdxs").focus();
		}else if($("#fmzl").val() != '' && (!/^\d+$/.test($("#fmzl").val()))){
			msg = '发明专利请填写数字';
			$("#fmzl").focus();
		}else if($("#wgsj").val() != '' && (!/^\d+$/.test($("#wgsj").val()))){
			msg = '外观设计请填写数字';
			$("#wgsj").focus();
		}else if($("#syxx").val() != '' && (!/^\d+$/.test($("#syxx").val()))){
			msg = '实用新型请填写数字';
			$("#syxx").focus();
		}else if($("#rjzzq").val() != '' && (!/^\d+$/.test($("#rjzzq").val()))){
			msg = '软件著作权请填写数字';
			$("#rjzzq").focus();
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
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业名称：</span>
      <span class="span1"><input name="qymc" id="qymc" type="text" class="input" size="20" maxlength="100"/>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;电子邮箱：</span>
      <span class="span1"><input name="email" id="email" type="text" size="20" class="input" maxlength="100"/>
      </span>
     </div>
     <div class="li">
      <span class="span">网址：</span>
      <span class="span1"><input id="address" name="address" type="text" class="input" size="20" maxlength="100"/>
      </span>
      <span class="span">租用地址：</span>
      <span class="span1"><input id="zydy" name="zydy" type="text" class="input" size="20" maxlength="100"/>
      </span>
     </div>
     <div class="li">
      <span class="span">面积：</span>
      <span class="span1"><input name="mj" id="mj" type="text" class="input" size="20" maxlength="20"/>
      </span>
      <span class="span">注册资本：</span>
      <span class="span1"><input name="zczb" id="zczb" type="text" class="input" size="20" maxlength="20"/>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人代表：</span>
      <span class="span1"><input name="frdb" id="frdb" type="text" class="input" size="20" maxlength="20"/>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人联系电话：</span>
      <span class="span1"><input name="frlxdh" id="frlxdh" type="text" class="input" size="20" maxlength="20"/>
      </span>
     </div>
     <div class="li">
      <span class="span">联系人：</span>
      <span class="span1"><input name="lxr" id="lxr" type="text" class="input" size="20" maxlength="20"/>
      </span>
      <span class="span">联系电话：</span>
      <span class="span1"><input name="lxrdh" id="lxrdh" type="text" class="input" size="20" maxlength="20"/>
      </span>
     </div>
     <div class="li">
      <span class="span">在园出园状态：</span>
      <span class="span1">
      	<select name="zt" id="zt" class="input">
      		<option value="1">在园</option>
          	<option value="0">出园</option>
      	</select>
      </span>
      <span class="span">企业入驻时间：</span>
      <span class="span1"><input id="qyrzsj" name="qyrzsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="20"/>
      </span>
     </div>
     <div class="li">
      <span class="span">合同期限：</span>
      <span class="span1">
      	<input id="htqxf" name="htqxf" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="18"/>
      </span>
      <span class="span">
      	 至 </span>
      <span class="span1">
      	<input id="htqxe" name="htqxe" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="18"/>
      </span>
     </div>
     <div class="li">
      <span class="span">企业登记注册类型：</span>
      <span class="span1"><input name="qydjzclx" id="qydjzclx" type="text" class="input" size="20" maxlength="20"/>
      </span>
      <span class="span">是否需填经济月报：</span>
      <span class="span1">
      	<select name="sfjjyb"  id="sfjjyb" class="input">
          <option value="1">需要</option>
          <option value="0">不需要</option>
        </select>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;组织机构代码：</span>
      <span class="span1"><input name="zzjgdm" id="zzjgdm" type="text" class="input" size="20" maxlength="30"/>
      </span>
      <span class="span">企业成立时间：</span>
      <span class="span1">
      	<input name="qyclsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="20" />
      </span>
     </div>
     <div class="li">
      <span class="span">获天使或风险投资额：</span>
      <span class="span1"><input name="htstze" id="htstze" type="text" class="input" size="20" maxlength="20"/>千元
      </span>
      <span class="span">在孵企业大专以上人员：</span>
      <span class="span1">
      	<input name="dzys" id="dzys" type="text" class="input" size="20" maxlength="20"/>人
      </span>
     </div>
     <div class="li">
      <span class="span">在孵企业大学应届生：</span>
      <span class="span1"><input name="xnyjdxs" id="xnyjdxs" type="text" class="input" size="20" maxlength="20"/>人
      </span>
      <span class="span">企业所属技术领域：</span>
      <span class="span1">
      	<select name="qyssjsly" id="qyssjsly" class="input">
          <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>
      </span>
     </div>
     <div class="li">
      <span class="span">行业类别：</span>
      <span class="span1"><input name="hylb" id="hylb" type="text" class="input" size="20" maxlength="30"/>
      </span>
      <span class="span">高新技术企业：</span>
      <span class="span1">
      	<select name="gxjsqy" id="gxjsqy" class="input">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
      </span>
     </div>
     <div class="li">
      <span class="span">留学人员企业：</span>
      <span class="span1">
		<select name="lxryqy" id="lxryqy" class="input">
          <option value="0">否</option>
          <option value="1">是</option>
         </select>
      </span>
      <span class="span"></span>
      <span class="span1">
      </span>
     </div>
     <div class="li">
      <span class="span2">
		到上一年为止拥有有效知识产权数：其中：
      </span>
      <em>&nbsp;</em>
     </div>
     <div class="li">
      <span class="span">发明专利：</span>
      <span class="span1">
		<input id="fmzl" name="fmzl" type="text" class="input" size="20" maxlength="20"/>件
      </span>
      <span class="span">外观设计：</span>
      <span class="span1">
      	<input name="wgsj" id="wgsj" type="text" class="input" size="20" maxlength="20"/>个
      </span>
     </div>
     <div class="li">
      <span class="span">实用新型：</span>
      <span class="span1">
		<input id="syxx" name="syxx" type="text" class="input" size="20" maxlength="20"/>件
      </span>
      <span class="span">软件著作权：</span>
      <span class="span1">
      	<input name="rjzzq" id="rjzzq" type="text" class="input" size="20" maxlength="20"/>个
      </span>
     </div>
      
     <div class="li"><div class="btn_box"><input id="sumbit_bt" type="submit" class="tj" value="提交加入" />
     </div>
    </div>
 </div>
</div>
</div>
</form>

</body>
</html>
