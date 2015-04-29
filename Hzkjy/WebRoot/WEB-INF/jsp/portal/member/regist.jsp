<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jsp/member/regist.js"></script>
<script>
$(function(){
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
					isFlag = data.valid;
					if (!data.valid){
						$('#email_img').css('display','none');
						layer.tips('该邮箱已注册', document.getElementById('email') , {guide: 0, time: 3});
					}else{
						$('#email_img').css('display','');
					}
				}
			});
		}else{
			isFlag = false;
			$('#email_img').css('display','none');
		}
	});
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
      <span class="span1">
      <input name="qymc" id="qymc" type="text" class="input" size="25" maxlength="100"/>
      <img id="qymc_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span">企业网址：</span>
      <span class="span1"><input id="address" name="address" type="text" class="input" size="25" maxlength="100" onclick="layer.tips('该网址将链接到科技园前台网站，以便于企业间互相了解，创造更多的合作机会！', this , {guide: 0, time: 3});"/>
      <img id="address_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;电子邮箱：</span>
      <span class="span1">
      <input name="email" id="email" type="text" size="25" class="input" maxlength="100"/>
      <img id="email_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;租用地址：</span>
      <span class="span1"><input id="zydy" name="zydy" type="text" class="input" size="25" maxlength="100"/>
      <img id="zydy_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;租用面积：</span>
      <span class="span1"><input name="mj" id="mj" type="text" class="input" size="18" maxlength="20"/>
      <img id="mj_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      <em>平方米</em>
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;注册资本：</span>
      <span class="span1"><input name="zczb" id="zczb" type="text" class="input" size="10" maxlength="20"/><em>万元</em>
      <img id="zczb_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人代表：</span>
      <span class="span1"><input name="frdb" id="frdb" type="text" class="input" size="18" maxlength="20"/>
      <img id="frdb_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;法人联系电话：</span>
      <span class="span1"><input name="frlxdh" id="frlxdh" type="text" class="input" size="25" maxlength="20" onclick="layer.tips('区号+电话或手机号码,如：020-88888888', this , {guide: 0, time: 3})"/>
      <img id="frlxdh_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系人：</span>
      <span class="span1"><input name="lxr" id="lxr" type="text" class="input" size="18" maxlength="20"/>
      <img id="lxr_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;联系电话：</span>
      <span class="span1"><input name="lxrdh" id="lxrdh" type="text" class="input" size="25" maxlength="20" onclick="layer.tips('区号+电话或手机号码,如：020-88888888', this , {guide: 0, time: 3})"/>
      <img id="lxrdh_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业登记注册类型：</span>
      <span class="span1">
      <select name="qydjzclx" id="qydjzclx" class="input">
      	<option value="0" disabled="disabled" >-- 请选择 --</option>
      </select>
      <img id="qydjzclx_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;组织机构代码：</span>
      <span class="span1"><input name="zzjgdm" id="zzjgdm" type="text" class="input" size="25" maxlength="30" onclick="layer.tips('组织机构代码由9个字符长度由字母或数字组成', this , {guide: 0, time: 3});"/>
      <img id="zzjgdm_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;企业成立时间：</span>
      <span class="span1">
      	<input name="qyclsj" id="qyclsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="input" size="18" />
      <img id="qyclsj_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;获天使或风险投资额：</span>
      <span class="span1"><input name="htstze" id="htstze" type="text" class="input" size="18" maxlength="20"/>
      <em>万元</em>
      <img id="htstze_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" /></span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;在孵企业大专以上人员：</span>
      <span class="span1">
      	<input name="dzys" id="dzys" type="text" class="input" size="18" maxlength="20"/>
      	<em>人</em>
      	<img id="dzys_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" /></span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;在孵企业大学应届生：</span>
      <span class="span1"><input name="xnyjdxs" id="xnyjdxs" type="text" class="input" size="18" maxlength="20"/>
      <em>人</em>
      <img id="xnyjdxs_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
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
		<img id="fmzl_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;外观设计：</span>
      <span class="span1">
      	<input name="wgsj" id="wgsj" type="text" class="input" size="18" maxlength="20"/>
      	<em>个</em>
      	<img id="wgsj_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
     </div>
     <div class="li">
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;实用新型：</span>
      <span class="span1">
		<input id="syxx" name="syxx" type="text" class="input" size="18" maxlength="20"/>
		<em>件</em>
		<img id="syxx_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
      </span>
      <span class="span"><font class=" c_ff0000">*</font>&nbsp;&nbsp;软件著作权：</span>
      <span class="span1">
      	<input name="rjzzq" id="rjzzq" type="text" class="input" size="18" maxlength="20"/>
      	<em>个</em>
      	<img id="rjzzq_img" style="display: none" src="${ctx}/theme/default/images/zhengque.jpg" />
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
