<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/icon.css"/>
<script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script>
var registTypeJson = [{id:'0',value:'内资'},{id:'110',value:'国有'},{id:'120',value:'集体'},{id:'130',value:'股份合作'},{id:'141',value:'国有联营'},{id:'142',value:'集体联营'},{id:'143',value:'国有与集体联营'},{id:'149',value:'其他联营 '},{id:'151',value:'国有独资联营'},{id:'159',value:'其他有限责任公司'},{id:'160',value:'股份有好公司'},{id:'171',value:'私营独资'},{id:'172',value:'私营合伙'},{id:'173',value:'私营有限责任公司'},{id:'174',value:'私营股份有限公司'},{id:'190',value:'其他'},{id:'0',value:'港澳台商投资'},{id:'210',value:'与港澳台商合资经营'},{id:'220',value:'与港澳台商合作经营'},{id:'230',value:'港澳台商独资'},{id:'240',value:'港澳台商投资股份有限公司'},{id:'290',value:'其他港澳台商投资'},{id:'0',value:'外商投资'},{id:'310',value:'中外合资经营'},{id:'320',value:'中外合作经营'},{id:'330',value:'外资企业'},{id:'340',value:'外商投资股份有限公司'},{id:'390',value:'其他外商投资'}];
$(function(){
	
	$.each(registTypeJson,function(i,item){
		if(item.id == '0'){
			$('#qydjzclx').append('<option style="background-color: #ffa426" disabled="disabled" value="' + item.id + '">' + item.value + '</option>');
		}else{
			$('#qydjzclx').append('<option value="' + item.id + '">&nbsp;&nbsp;&nbsp;&nbsp;' + item.value + '</option>');
		}
	});
	var isFlag = true;
	$("#email").change(function(){
		if (/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(this.value)){
			// 发送异步请求
			$.ajax({
				url : "${ctx}/portal/memberBasic/validEmail.json?random=" + Math.random(),
				type : "post",
				data : "email=" + this.value,
				dataType : "json",
				async : false,
				success : function(data){
					isFlag = data.isFlag;
					if (!data.isFlag){
						alert('该邮箱已注册');
					}
				}
			});
		}
	});
	var telReg = /^0\d{2,3}-?\d{7,8}$/;
	var phoneReg = /^1[3|4|5|8]\d{9}$/;
	var strRegex = '^((https|http|ftp|rtsp|mms)?://)' 
	+ '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@ 
	+ '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184 
	+ '|' // 允许IP和DOMAIN（域名） 
	+ '([0-9a-z_!~*\'()-]+.)*' // 域名- www. 
	+ '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名 
	+ '[a-z]{2,6})' // first level domain- .com or .museum 
	+ '(:[0-9]{1,4})?' // 端口- :80 
	+ '((/?)|' // a slash isn't required if there is no file name 
	+ '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$'; 
	var re = new RegExp(strRegex);
	var obj;
	var token = true;
	$("#sumbit_bt").click(function(){
		if(token){
			token = false;
		}else{
			return false;
		}
		var msg = '';
		if(!isFlag){
			msg = '该邮箱已注册';
			obj = $("#email");
		}else if($.trim($("#qymc").val()) == ''){
			msg = '请填写企业名称';
			obj = $("#qymc");
		}else if($.trim($("#email").val()) == ''){
			msg = '请填写邮箱';
			obj = $("#email");
		}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test($("#email").val()))){
			msg = '请填写正确的邮箱';
			obj = $("#email");
		}else if($("#address").val() != '' && (!re.test($("#address").val()))){
			msg = '请填写正确的网址';
			obj = $("#address");
		}else if($("#zydy").val() == ''){
			msg = '请填写租用地址';
			obj = $("#zydy");
		}else if($("#mj").val() == ''){
			msg = '请填写租用面积';
			obj = $("#mj");
		}else if(!/^\d+$/.test($("#mj").val())){
			msg = '租用面积请填写数字';
			obj = $("#mj");
		}else if($("#zczb").val() == ''){
			msg = '请填写注册资金';
			obj = $("#zczb");
		}else if(!/^\d+$/.test($("#zczb").val())){
			msg = '注册资金请填写数字';
			obj = $("#zczb");
		}else if($("#frdb").val() == ''){
			msg = '请填写法人代表';
			obj = $("#frdb");
		}else if($.trim($("#frlxdh").val()) == ''){
			obj = $("#frlxdh");
			msg = '请填写法人电话';
		}else if ((!telReg.test($("#frlxdh").val())) && (!phoneReg.test($("#frlxdh").val()))){
			msg = "法人电话格式不正确：区号+电话或手机号码";
			obj = $("#frlxdh");
		}else if($("#lxr").val() == ''){
			msg = '请填写联系人';
			obj = $("#lxr");
		}else if($("#lxrdh").val() == ''){
			msg = '请填写联系电话';
			obj = $("#lxrdh");
		}else if((!telReg.test($("#lxrdh").val())) && (!phoneReg.test($("#lxrdh").val()))){
			msg = "联系电话格式不正确：区号+电话或手机号码";
			obj = $("#lxrdh");
		}else if($("#qydjzclx").val() == '0'){
			msg = '请选择企业登记注册类型';
			obj = $("#qydjzclx");
		}else if($.trim($("#zzjgdm").val()) == ''){
			msg = '请填写组织机构代码';
			obj = $("#zzjgdm");
		}else if (!/^[a-zA-Z0-9]{9}$/.test($("#zzjgdm").val())){
			msg = "组织机构代码由9个字符长度由字母或数字组成";
			obj = $("#zzjgdm");
		}else if($("#qyclsj").val() == ''){
			msg = '请填写企业成立时间';
			obj = $("#qyclsj");
		}else if($("#htstze").val() == ''){
			msg = '请填写风险投资额';
			obj = $("#htstze");
		}else if(!/^\d+$/.test($("#htstze").val())){
			msg = '风险投资额请填写数字';
			obj = $("#htstze");
		}else if($("#dzys").val() == ''){
			msg = '请填写在孵企业大专人数';
			obj = $("#dzys");
		}else if(!/^\d+$/.test($("#dzys").val())){
			msg = '在孵企业大专人员请填写数字';
			obj = $("#dzys");
		}else if($("#xnyjdxs").val() == ''){
			msg = '请填写在孵企业大学应届生人数';
			obj = $("#xnyjdxs");
		}else if(!/^\d+$/.test($("#xnyjdxs").val())){
			msg = '在孵企业大学应届生请填写数字';
			obj = $("#xnyjdxs");
		}else if($("#fmzl").val() == ''){
			msg = '请填写发明专利';
			obj = $("#fmzl");
		}else if(!/^\d+$/.test($("#fmzl").val())){
			msg = '发明专利请填写数字';
			obj = $("#fmzl");
		}else if($("#wgsj").val() == ''){
			msg = '请填写外观设计';
			obj = $("#wgsj");
		}else if(!/^\d+$/.test($("#wgsj").val())){
			msg = '外观设计请填写数字';
			obj = $("#wgsj");
		}else if($("#syxx").val() == ''){
			msg = '请填写实用新型';
			obj = $("#syxx");
		}else if(!/^\d+$/.test($("#syxx").val())){
			msg = '实用新型请填写数字';
			obj = $("#syxx");
		}else if($("#rjzzq").val() == ''){
			msg = '请填写软件著作权';
			obj = $("#rjzzq");
		}else if(!/^\d+$/.test($("#rjzzq").val())){
			msg = '软件著作权请填写数字';
			obj = $("#rjzzq");
		}
		if(msg == ''){
			return true;
		}
		token = true;
		alert(msg);
		obj.focus();
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
      <span class="span1"><input name="qymc" id="qymc" type="text" class="input" size="25" maxlength="100"/>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;电子邮箱：</span>
      <span class="span1"><input name="email" id="email" type="text" size="25" class="input" maxlength="100"/>
      <a class="easyui-linkbutton easyui-tooltip" title="如：abc@163.com" data-options="iconCls:'icon-help'"></a>
      </span>
     </div>
     <div class="li">
      <span class="span">企业网址：</span>
      <span class="span1"><input id="address" name="address" type="text" class="input" size="18" maxlength="100"/>
      <a class="easyui-linkbutton easyui-tooltip" title="该网址将链接到科技园前台网站，以便于企业间互相了解，创造更多的合作机会！" data-options="iconCls:'icon-help'"></a>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;租用地址：</span>
      <span class="span1"><input id="zydy" name="zydy" type="text" class="input" size="25" maxlength="100"/>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;租用面积：</span>
      <span class="span1"><input name="mj" id="mj" type="text" class="input" size="18" maxlength="20"/>
      <em>平方米</em>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;注册资本：</span>
      <span class="span1"><input name="zczb" id="zczb" type="text" class="input" size="10" maxlength="20"/><em>万元</em>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人代表：</span>
      <span class="span1"><input name="frdb" id="frdb" type="text" class="input" size="18" maxlength="20"/>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人联系电话：</span>
      <span class="span1"><input name="frlxdh" id="frlxdh" type="text" class="input" size="10" maxlength="20"/>
      <em>如：020-12345678</em>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系人：</span>
      <span class="span1"><input name="lxr" id="lxr" type="text" class="input" size="18" maxlength="20"/>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系电话：</span>
      <span class="span1"><input name="lxrdh" id="lxrdh" type="text" class="input" size="10" maxlength="20"/><em>如：020-12345678</em>
      </span>
     </div>
     
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业登记注册类型：</span>
      <span class="span1">
      <select name="qydjzclx" id="qydjzclx" class="input">
      	<option value="0" disabled="disabled" >-- 请选择 --</option>
      </select>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;组织机构代码：</span>
      <span class="span1"><input name="zzjgdm" id="zzjgdm" type="text" class="input" size="25" maxlength="30"/>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业成立时间：</span>
      <span class="span1">
      	<input name="qyclsj" id="qyclsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="18" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;获天使或风险投资额：</span>
      <span class="span1"><input name="htstze" id="htstze" type="text" class="input" size="18" maxlength="20"/>
      <em>万元</em></span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;在孵企业大专以上人员：</span>
      <span class="span1">
      	<input name="dzys" id="dzys" type="text" class="input" size="18" maxlength="20"/>
      	<em>人</em></span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;在孵企业大学应届生：</span>
      <span class="span1"><input name="xnyjdxs" id="xnyjdxs" type="text" class="input" size="18" maxlength="20"/>
      <em>人</em>
      </span>
     </div>
     <div class="li">
      <span class="span">企业所属技术领域：</span>
      <span class="span1">
      	<select name="qyssjsly" id="qyssjsly" class="input">
      	<option value="">-- 请选择 --</option>
          <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>
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
     <div class="li2">
		到上一年为止拥有有效知识产权数：其中：
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;发明专利：</span>
      <span class="span1">
		<input id="fmzl" name="fmzl" type="text" class="input" size="18" maxlength="20"/>
		<em>件</em>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;外观设计：</span>
      <span class="span1">
      	<input name="wgsj" id="wgsj" type="text" class="input" size="18" maxlength="20"/>
      	<em>个</em>
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;实用新型：</span>
      <span class="span1">
		<input id="syxx" name="syxx" type="text" class="input" size="18" maxlength="20"/>
		<em>件</em>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;软件著作权：</span>
      <span class="span1">
      	<input name="rjzzq" id="rjzzq" type="text" class="input" size="18" maxlength="20"/>
      	<em>个</em>
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
