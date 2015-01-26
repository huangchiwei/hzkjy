<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市机动车维修行业协会会员管理系统</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/icon.css"/>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
 <script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
   <script type="text/javascript" src="${ctx}/theme/default/js/motorcar/layer.js"></script>
 <script language="javascript" src="${ctx}/js/jsp/base/center.js" type="text/javascript"></script>
<script language=Javascript>
  function time(){
    //获得显示时间的div
    t_div = document.getElementById('showtime');
   var now=new Date()
    //替换div内容 
   t_div.innerHTML = "系统时间："+now.getFullYear()
    +"年"+(now.getMonth()+1)+"月"+now.getDate()
    +"日"+now.getHours()+"时"+now.getMinutes()
    +"分"+now.getSeconds()+"秒";
    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
   setTimeout(time,1000);
  }
  	//弹出窗口(统计信息详情)
	function showAnalyseDetail(mntNo,mntType,beginTime,endTime){
		$('#showAnalyse').window({
				title:'警告详情',
			    width:window.screen.width - 20,
			    height:700,
			    closed:false,
			    modal:true
		});
		$("#i_Analyse").attr("src",'${ctx}/mnt/mntAlarmInfo/list/1.html?' + mntType + '=' + mntNo + '&beginTime=' + beginTime + '&endTime=' + endTime);	
	}
</script>
<script type="text/javascript">
function switchSysBar(){
	var ssrc = $("#img1").attr("src");
	if (ssrc == "${ctx}/theme/default/images/main_18.gif")
	{
		document.all("img1").src = "${ctx}/theme/default/images/main_18_1.gif";
		document.all("frmTitle").style.display = "none";
	} 
	else
	{
		document.all("img1").src = "${ctx}/theme/default/images/main_18.gif";
		document.all("frmTitle").style.display = "";
	}
}
</script>
</head>

<body bgcolor="#f5f5f5" style="margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;overflow:hidden;"  onload="time()">
<div id="showAnalyse" class="easyui-window" data-options="closed:true" style="left: 10px; top: 10px">
	<iframe id="i_Analyse" width="100%" height="100%" style="border: 0"></iframe>
</div>
<div id="box">
<div class="main_top relative">
 <div class="top_logo"></div>
 <div class="top_toolbar">
  <div class="top_t_time"  id="showtime"></div>
  <div class="div">
   <div class="user">${userNo}</div>
   <div class="home"><a href="javascript:self.frames['I2'].openTabs('welcome','${ctx}/centerPage/welcome.html')">首页</a></div>
   <div class="set"><a href="javascript:self.frames['I2'].openNew('修改密码','${ctx}/sys/sysUser/toModifyPwd.html')">修改密码</a></div>
   <div class="quit"><a href="${ctx}/loginOut.html">退出</a></div>
  </div>
 </div>
 
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;height: 92%">
  <tr>
    <td width="238" id="frmTitle" nowrap="nowrap" align="center" valign="top">
	<iframe name="I1" height="100%" width="238" src="${ctx}/centerPage/left.html" style="border:0" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td width="7" valign="middle" onclick=switchSysBar()><span class="navPoint"><img src="${ctx}/theme/default/images/main_18.gif" name="img1" width="7" height="81" id="img1"/></span></td>
    <td align="center" valign="top"><iframe name="I2" height="94%" width="100%" style="border:0" frameborder="0" src="${ctx}/centerPage/content.html" scrolling="yes"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
  </tr>
</table>
</div><div class="bot">&copy; 2014 jr81.com Co., Ltd. All Rights Reserved.</div>
</body>
</html>