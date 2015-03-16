<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="permission-tags" prefix="pm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/font.css" rel="stylesheet" type="text/css" />
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

<div class="content_box">
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/memberIntellectualPro/inteProCount.html" method="post">
    
    
    <h2>按年度查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dd > 
         &nbsp;&nbsp;&nbsp;&nbsp;年度： <input id="year" name="year" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'})" type="text" 
     	value="${year}" maxlength="20"/>
        	</dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
         <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
      
    </dl>
    </div>
    </form>
     <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	    <tr>
	    <td colspan="3" style="text-align:left"><b>企业知识产权情况</b></td>
	    </tr>
	    <tr><td>指标名称</td><td>计量单位</td><td>数量</td></tr>
	    <tr>
	    <td>知识产权授权数(1-6月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>其中:发明专利(1-6月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>实用新型(1-6月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>外观设计(1-6月)</td><td>个</td><td></td>
	    </tr>
	    <tr>
	    <td>软件著作权(1-6月)</td><td>个</td><td></td>
	    </tr>
	    
	    <tr>
	    <td>知识产权授权数(7-12月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>其中:发明专利(7-12月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>实用新型(7-12月)</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>外观设计(7-12月)</td><td>个</td><td></td>
	    </tr>
	    <tr>
	    <td>软件著作权(7-12月)</td><td>个</td><td></td>
	    </tr>
	    
	    <tr>
	    <td>到上一年为止拥有有效知识产权数</td><td>件</td><td></td>
	    </tr>	    
	    <tr>
	    <td>其中:发明专利</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>实用新型</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>外观设计</td><td>个</td><td></td>
	    </tr>
	    <tr>
	    <td>软件著作权</td><td>个</td><td></td>
	    </tr>
	    
	     <tr>
	    <td>现拥有有效知识产权数</td><td>件</td><td></td>
	    </tr>
	      <tr>
	    <td>其中:发明专利</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>实用新型</td><td>件</td><td></td>
	    </tr>
	    <tr>
	    <td>外观设计</td><td>个</td><td></td>
	    </tr>
	    <tr>
	    <td>软件著作权</td><td>个</td><td></td>
	    </tr>
	    
	    <tr>
	    <td>获得奖项总数(1-6月)</td><td>项</td><td></td>
	    </tr>
	    <tr>
	    <td>其中:国家级奖项(1-6月)</td><td>项</td><td></td>
	    </tr>	    
	    <tr>
	    <td>省级奖项(1-6月)</td><td>项</td><td></td>
	    </tr>
	    <tr>
	    <td>市级奖项(1-6月)</td><td>项</td><td></td>
	    </tr>
	    
	     <tr>
	    <td>获得奖项总数(7-12月)</td><td>项</td><td></td>
	    </tr>
	    <tr>
	    <td>其中:国家级奖项(7-12月)</td><td>项</td><td></td>
	    </tr>	    
	    <tr>
	    <td>省级奖项(7-12月)</td><td>项</td><td></td>
	    </tr>
	    <tr>
	    <td>市级奖项(7-12月)</td><td>项</td><td></td>
	    </tr>
	    
	    </thead></table>
   
  </div>
</div>
</body>
</html>
