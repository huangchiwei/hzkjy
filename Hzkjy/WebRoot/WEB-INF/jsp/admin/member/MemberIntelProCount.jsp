<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="permission-tags" prefix="pm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
function find(){    
	$("#search_form").attr("action","${ctx}/admin/memberIntellectualPro/inteProCount.html");
	document.getElementById("search_form").submit();
    }  
function out(){    
	$("#search_form").attr("action","${ctx}/admin/memberIntellectualPro/outInteProCount/1.html");
	document.getElementById("search_form").submit();
    } 

</script>
</head>

<body>
<div class="admin_table">
<div class="content_box">
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/memberIntellectualPro/inteProCount.html" method="post">
    
    
    <h2>按年度查询</h2>
     <div class="div_input">
       <em>年度：</em> <input id="year" name="year"  class="input_a1" size="15" onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${params.year}" maxlength="20"/>
         <input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
         <input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/>
    </div>
    </form>
  <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	    <tr>
	    <td colspan="3" style="text-align:left"><b>企业知识产权情况</b></td>
	    </tr>
	    <tr><td>指标名称</td><td>计量单位</td><td>数量</td></tr>
	    <tr>
	    <td>知识产权授权数(1-6月)</td><td>件</td><td>${currentYear.type_0_Count}</td>
	    </tr>
	    <tr>
	    <td>其中:发明专利(1-6月)</td><td>件</td><td>${currentYear.type_0_Invention}</td>
	    </tr>
	    <tr>
	    <td>实用新型(1-6月)</td><td>件</td><td>${currentYear.type_0_Practical}</td>
	    </tr>
	    <tr>
	    <td>外观设计(1-6月)</td><td>个</td><td>${currentYear.type_0_Appearance}</td>
	    </tr>
	    <tr>
	    <td>软件著作权(1-6月)</td><td>个</td><td>${currentYear.type_0_Work}</td>
	    </tr>
	    
	    <tr>
	    <td>知识产权授权数(7-12月)</td><td>件</td><td>${currentYear.type_1_Count}</td>
	    </tr>
	    <tr>
	    <td>其中:发明专利(7-12月)</td><td>件</td><td>${currentYear.type_1_Invention}</td>
	    </tr>
	    <tr>
	    <td>实用新型(7-12月)</td><td>件</td><td>${currentYear.type_1_Practical}</td>
	    </tr>
	    <tr>
	    <td>外观设计(7-12月)</td><td>个</td><td>${currentYear.type_1_Appearance}</td>
	    </tr>
	    <tr>
	    <td>软件著作权(7-12月)</td><td>个</td><td>${currentYear.type_1_Work}</td>
	    </tr>
	    
	    <tr>
	    <td>到上一年为止拥有有效知识产权数</td><td>件</td><td><c:if test="${not empty toLastYear}">${toLastYear.type_last_Count}</c:if>
	  <c:if test="${ empty toLastYear}">0</c:if></td>
	    </tr>	    
	    <tr>
	    <td>其中:发明专利</td><td>件</td><td><c:if test="${not empty toLastYear}">${toLastYear.type_last_Invention}</c:if>
	  <c:if test="${ empty toLastYear}">0</c:if></td>
	    </tr>
	    <tr>
	    <td>实用新型</td><td>件</td><td><c:if test="${not empty toLastYear}">${toLastYear.type_last_Practical}</c:if>
	  <c:if test="${ empty toLastYear}">0</c:if></td>
	    </tr>
	    <tr>
	    <td>外观设计</td><td>个</td><td><c:if test="${not empty toLastYear}">${toLastYear.type_last_Appearance}</c:if>
	  <c:if test="${ empty toLastYear}">0</c:if></td>
	    </tr>
	    <tr>
	    <td>软件著作权</td><td>个</td><td><c:if test="${not empty toLastYear}">${toLastYear.type_last_Work}</c:if>
	  <c:if test="${ empty toLastYear}">0</c:if></td>
	    </tr>
	    
	     <tr>
	    <td>现拥有有效知识产权数</td><td>件</td><td>${allYear.type_all_Count }</td>
	    </tr>
	      <tr>
	    <td>其中:发明专利</td><td>件</td><td>${allYear.type_all_Invention }</td>
	    </tr>
	    <tr>
	    <td>实用新型</td><td>件</td><td>${allYear.type_all_Practical }</td>
	    </tr>
	    <tr>
	    <td>外观设计</td><td>个</td><td>${allYear.type_all_Appearance}</td>
	    </tr>
	    <tr>
	    <td>软件著作权</td><td>个</td><td>${allYear.type_all_Work }</td>
	    </tr>
	    
	    <tr>
	    <td>获得奖项总数(1-6月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_0_count }</td>
	    </tr>
	    <tr>
	    <td>其中:国家级奖项(1-6月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_0_country }</td>
	    </tr>	    
	    <tr>
	    <td>省级奖项(1-6月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_0_province}</td>
	    </tr>
	    <tr>
	    <td>市级奖项(1-6月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_0_city}</td>
	    </tr>
	    
	     <tr>
	    <td>获得奖项总数(7-12月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_1_count }</td>
	    </tr>
	    <tr>
	    <td>其中:国家级奖项(7-12月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_1_country }</td>
	    </tr>	    
	    <tr>
	    <td>省级奖项(7-12月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_1_province}</td>
	    </tr>
	    <tr>
	    <td>市级奖项(7-12月)</td><td>项</td><td>${inteCurrentYear.ProjectLevel_1_city}</td>
	    </tr>
	    
	    </thead></table>
   
  </div>
    </div>
</div>
</body>
</html>
