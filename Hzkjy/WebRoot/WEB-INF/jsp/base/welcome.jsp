<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="permission-tags" prefix="pm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/easyui/jquery-1.8.0.min.js"></script>
	
<script type="text/javascript" src="${ctx}/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/js/highcharts/modules/exporting.js"></script>
<script type="text/javascript" src="${ctx}/js/jsp/base/welcome.js"></script>
<script type="text/javascript">
	function loadCharts(id,title,datas){
		 
	        $('#' + id).highcharts({
	        	chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: title
		        },
		        credits:{ enabled: false},
		        tooltip: {
		        	    pointFormat: '{series.name}: <b>{point.y}</b>'
		        },
		        plotOptions: {
		        	 pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                center: ['50%', '50%'],
	                dataLabels: {
	                    enabled: false
	                	}
	                }
		        },
		        series: [{
		        	type: 'pie',
		            name: '警告次数',
		            data: datas
		        }]
		    });
	}
	$(function () {
		  loadCharts("container_term","终端统计",${dataTerms});
		  loadCharts("container_param","参数统计",${dataParams});
	});	
</script>
</head>

<body>
<div class="content_box">

  <h1>欢迎使用通信行业信息管理系统</h1>
<pm:hasPermission permValue="alarm_anls">
  <div class="div_new h250 relative">
  <!--最新公告 start-->
   <div class="announcement">
    <div class="title relative">
     <h2>今天终端警告信息</h2>
     <div class="release"><a href="#" onclick="javascript:parent.openTabs('统计分析','${ctx}/mnt/mntAlarmInfo/alarmInfoAnalyse/1.html?mntType=terminalNo')">更多 &gt;&gt;</a></div>
    </div>
     <div class="ann">
     <table id="tb_term" border="0" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <th class="th">名称</th>
    <th class="th">警告次数</th>  </tr>
      <c:forEach items="${terminalInfos}" var="ti">
	      <tr id="tr_term">
	        <td class="td">${ti.MntName}</td>
	        <td class="td">${ti.num}</td>
	      </tr>
      </c:forEach>
	</table><br/>
	<div id="container_term" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>
   </div>
  <!--最新公告 end-->
  <!--新闻信息 start-->
   <div class="news">
    <div class="title relative">
     <h2>今天参数警告信息</h2>
     <div class="release"><a href="#" onclick="javascript:parent.openTabs('统计分析','${ctx}/mnt/mntAlarmInfo/alarmInfoAnalyse/1.html?mntType=paramNo')">更多 &gt;&gt;</a></div>
    </div>
     <div class="ann">
      <table id="tb_param" border="0" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <th class="th">名称</th>
    <th class="th">警告次数</th>  </tr>
      <c:forEach items="${paramInfos}" var="pi">
	      <tr id="tr_param">
	        <td class="td">${pi.MntName}</td>
	        <td class="td">${pi.num}</td>
	      </tr>
      </c:forEach>
	</table><br/>
	<div id="container_param" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
     </div>
   </div>
   <!--新闻信息 end-->
  </div>
</pm:hasPermission> 
   </div>
</body>
</html>