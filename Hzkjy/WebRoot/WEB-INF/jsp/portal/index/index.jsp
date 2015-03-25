<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<%--<link href="${ctx}/theme/portal/default/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/portal/default/style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
--%><script type="text/javascript" src="${ctx}/theme/portal/default/js/common.js"></script>
<script>
$(function(){
	/*var lanren = $(".lanren a");
	lanren.click(function(){
		$(this).addClass("thisclass").siblings().removeClass("thisclass");
	});*/
	$('#login_btn').click(function(){
		var msg = '';
		if($.trim($("#userNo").val()) == ''){
			msg = '请输入登录账号';
			$("#userNo").focus();
		}else if($("#password").val() == ''){
			msg = '请输入登录密码';
			$("#password").focus();
		}
		if(msg != ''){
			alert(msg);
			return;
		}
		$.ajax({
				url:'${ctx}/portal/userLogin.html',
		  		type:'post',
		  		dataType:'json',
		  		data:'userNo=' + $("#userNo").val() + "&password=" + $("#password").val(),
		  		async:true,
		  		success:function(data){
		  			if(data.flag == "1"){
		  				location.href = "${ctx}/admin/index.html";
		  			}else{
		  				alert(data.msg);
		  			}
		  			
		  		}
		  	});
	});
});
</script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/lrtk.js"></script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/lrtk_bht.js"></script>
<script type="text/javascript" src="${ctx}/theme/portal/default/js/scroll.js"></script>
</head>

<body>
<%--<jsp:include page="/WEB-INF/jsp/portal/common/head.jsp" />
--%><!--变化图样式-->
<div class="banner_index">
  <a href="javascript:void(0);" class="btn btnPre" id="banner_index_pre"></a>
  <a href="javascript:void(0);" class="btn btnNext" id="banner_index_next"></a>
    <ul class="banner_wrap" id="banner_index">
      <li><a href="#" target="_blank"><img src="${ctx}/theme/portal/default/images/banner_index_1.jpg"/></a></li>
      <li><a href="#" target="_blank"><img src="${ctx}/theme/portal/default/images/banner_index_2.jpg"/></a></li>
      <li><a href="#" target="_blank"><img src="${ctx}/theme/portal/default/images/banner_index_3.jpg"/></a></li>
      <li><a href="#" target="_blank"><img src="${ctx}/theme/portal/default/images/banner_index_4.jpg"/></a></li>
    </ul>
</div>
<div class="indexBanner_num" id="index_numIco"></div>
<script type="text/javascript">
var ShowPre1 = new ShowPre({box:"banner_index",Pre:"banner_index_pre",Next:"banner_index_next",numIco:"index_numIco",loop:1,auto:1});
</script>
<!-- 代码 结束 -->
<div class="content">
 <div class="left">
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>园区概况</h1>
    <span>Park Overview</span>
    <div class="more"><a href="#">更多&gt;&gt;</a></div>
   </div>
   <div class="introduction">
    <h1>广州市海珠科技产业园有限公司</h1>
    <p>广州市海珠科技产业园有限公司（以下简称科技园公司）成立于1998年，是广州市海珠区科技产业基地琶洲园区的经营管理单位。琶洲园区成立于1998年，地处琶洲岛东部黄埔村北侧，距会展中心2.3公里，以国家科技兴海——广东海珠海洋生物技术产业开发示范基地和广东省火炬计划海洋生物技术特色产业基地作为依托发展。园区总体规划用地面积10万平方米.....</p>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>最新公告</h1>
    <span>Latest Announcement</span>
    <div class="more"><a href="#">更多&gt;&gt;</a></div>
   </div>
   <div class="announcement">
    <div class="announcement_l">
     <div id="box">
     <div class="prev"></div>
     <div class="next"></div>
    <ul class="bigUl">
       <li style="z-index:1"><a href="#"><img src="${ctx}/theme/portal/default/images/4.jpg" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/2.jpg" width="300" height="200" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/3.jpg" width="300" height="200" /></a></li>
       <li><a href="#"><img src="${ctx}/theme/portal/default/images/1.jpg" width="300" height="200" /></a></li>
    </ul>
    <ul class="numberUl">
      <li class="night"><a href="javascript:;">1</a></li>
      <li><a href="javascript:;">2</a></li>
      <li><a href="javascript:;">3</a></li>
      <li><a href="javascript:;">4</a></li>
    </ul>
    <div>
      <ul class="textUl">
        <li style="display:block;"><a href="#">定位精品路线 原创试驾奇瑞艾瑞</a></li>
        <li><a href="#">锂电池是亮点 米儿低速电动车设计</a></li>
        <li><a href="#">舒适及操控更上一层楼 测试长安金</a></li>
        <li><a href="#">外观动感/配置丰富 天籁2.0L用车记</a></li>
      </ul>
    </div>
 </div>
    </div>
    <div class="announcement_r">
     <h1><a href="#">中小企业扶持政策将出台破解融</a></h1>
     <ul>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
      <li><span>2014-11-21</span><a href="#">中小企业扶持政策将出台 破解融...</a></li>
     </ul>
    </div>
   </div>
  </div>
  <div class="ad_690"><img src="${ctx}/theme/portal/default/images/ad_690x90.png" /></div>
  <div class="left_box2">
   <div class="left_box2_l">
    <div class="l_b_l_t relative">
     <h1>交流培训</h1>
     <div class="more"><a href="#">更多&gt;&gt;</a></div>
    </div>
    <div class="l_b_l_b">
     <ul>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
     </ul>
    </div>
   </div>
   <div class="left_box2_2">
    <div class="l_b_l_t relative">
     <h1>交流培训</h1>
     <div class="more"><a href="#">更多&gt;&gt;</a></div>
    </div>
    <div class="l_b_l_b">
     <ul>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
      <li class="li"><a href="#">强化安全工作、共建和谐园区</a></li>
     </ul>
    </div>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h1>友情连接</h1>
    <span>Links</span>
    <div class="more"><a href="#">更多&gt;&gt;</a></div>
   </div>
   <div class="links">
    <a href="#">海珠区科信局</a><a href="#">广州市科信局</a><a href="#">广州市发改局</a><a href="#">广州经贸网</a><a href="#">广东省科技厅</a><a href="#">广州市中小企业信息网</a>
   </div>
  </div>
 </div>
 <div class="right">
  <div class="left_box">
   <div class="left_box_title">
    <h2>企业登录</h2>
   </div>
   <div class="login">
    <ul>
     <li class="account"><input id="userNo" name="userNo" type="text" class="input"/>
     </li>
     <li class="password"><input id="password" name="password" type="password" class="input"/>
     </li>
     <li class="btn"><input id="login_btn" type="image" src="${ctx}/theme/portal/default/images/login_btn.png" />&nbsp;<input onclick="javascript:location.href='${ctx}/portal/memberBasic/toRegist.html'" type="image" src="${ctx}/theme/portal/default/images/reg_btn.png" />
     </li>
    </ul>
   </div>
  </div>
  <div class="left_box">
   <div class="left_box_title">
    <h3>企业服务</h3>
   </div>
   <div class="service">
    <ul>
     <li class="service1"><a href="#">入园导向</a></li>
     <li class="service2"><span><a href="#">入园指南</a></span><span><a href="#">入园流程</a></span></li>
     <li class="service3"><a href="#">出园导向</a></li>
     <li class="service4"><span><a href="#">出园指南</a></span><span><a href="#">出园流程</a></span></li>
     <li class="service5"><a href="#">基础服务</a></li>
     <li class="service6"><a href="#">人力资源</a></li>
     <li class="service7"><a href="#">项目申报</a></li>
     <li class="service8"><a href="#">招商信息</a></li>
    </ul>
   </div>
  </div>
  <div class="ad_265"><img src="${ctx}/theme/portal/default/images/ad_260.png" /></div>
  <div class="left_box">
   <div class="left_box_title relative">
    <h4>入驻企业</h4>
    <div class="more"><a href="#">更多&gt;&gt;</a></div>
   </div>
   <div class="business">
     <div id="scrollDiv">
      <ul>
        <li><a href="#">广州司美会展服务有限公司</a></li>
        <li><a href="#">广州市祥洲装饰工程有限公司</a></li>
        <li><a href="#">广州聚天环保科技有限公司</a></li>
        <li><a href="#">广州千岁兰居环保科技有限公司</a></li>
        <li><a href="#">广州市金域检测技术有限公司</a></li>
        <li><a href="#">广州聚天化工科技有限公司</a></li>
        <li><a href="#">广州市荣都电子科技有限公司</a></li>
        <li><a href="#">广州市恒道电子科技有限公司</a></li>
        <li><a href="#">广州市金域检测技术有限公司</a></li>
        <li><a href="#">广州聚天化工科技有限公司</a></li>
        <li><a href="#">广州市荣都电子科技有限公司</a></li>
        <li><a href="#">广州市恒道电子科技有限公司</a></li>
      </ul>
     </div>
   </div>
  </div>
 </div>
</div>
<!--bot-->
<%--<div class="bot">copyright ? 1998-2015 广州市海珠科技产业园 All Rights Reserved 粤ICP备1022679号</div>

--%></body>
</html>
