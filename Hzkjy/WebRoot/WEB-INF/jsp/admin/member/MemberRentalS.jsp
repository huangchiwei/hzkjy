<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="permission-tags" prefix="pm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">

$(document).ready(function(){
		var exl="${exl}";
		if(exl =="ok"){
		parent.location.href="${ctx}/admin/rentalExamine/list/1.html"
	    parent.layer.close();
		}
       
		});
		
function Shtg(){
     var bz = document.getElementById("bz").value;  
        if(bz == null || bz == ''){  
        alert("请输入备注");  
        return;  
    } 
    $("#search1_form").attr("action","${ctx}/admin/memberRental/Shsj.html");
	document.getElementById("search1_form").submit();
		}
		function Tsxg(){
    $("#search1_form").attr("action","${ctx}/member/memberDuesDetail/Tsxg.html");
	document.getElementById("search1_form").submit();
		}
		</script>
</head>

<body>
<div class="content_box">
  <div class="btn_box">
  	
     
  </div>
  <div class="list_info">
  	<form id="search1_form" action="${ctx}/admin/memberRental/Shtg.html" method="post">
    <div class="div2">
    <dl class="relative h30">
      <dd >
       <input name="id" id="id" type="hidden" value="${id}"/>
	     	 <textarea name="bz" rows="2" cols="20" id="bz" style="height:78px;width:676px;">
</textarea>
	 
        </dd>
          <dt> &nbsp;&nbsp; <input id="add_bt" type="button" value="提交" class="initial" onclick="Shtg();"/></dt>
    </dl>
    </div>
    
    </form>
   
  </div>
</div>
</body>
</html>
