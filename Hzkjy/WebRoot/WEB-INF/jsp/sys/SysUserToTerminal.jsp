<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>


<script type="text/javascript">
	function selectTerm(obj){
		var value = $(obj).val();
		//alert(value);
		var inputs = $("input[id='ck_" + value + "']");
		for(var i = 0; i < inputs.length; i++){
			inputs[i].checked = (inputs[i].checked == true ? false : true); 
		}
	}
</script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  		<input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/sys/sysUser/list/1.html'"/>
   </div>
  
<form id="add_form" action='${ctx}/sys/sysUser/saveUserTerminal.html' method="post">
  <div class="add_info">
  
   <h2>用户：${user.userName}</h2>
   <input name="userNo" type="hidden" value="${user.userNo}"/>
   <div class="div3">
   <c:set var="num" value="3"/>
    请选择终端：<br /><br />
     <c:forEach items="${terminals}" var="terminal" varStatus="sta">
     	${terminal.groupName}: &nbsp;&nbsp;<input type="checkbox" value="${terminal.groupNo}" onchange="selectTerm(this)"/> 反选<br/>
     	<c:set var="lens" value="${fn:length(terminal.datas)}"/>
     <table>
    	<c:forEach items="${terminal.datas}" var="term" varStatus="statu">
    		<c:choose>
    			<c:when test="${(statu.index + 1) mod num == 1}">
    				<tr>
    					<td>
   						  <input id="ck_${terminal.groupNo}" name="ck_termNo" ${term.checked} type="checkbox" value="${term.termNo}"/> <label> ${term.termName}</label>
    					</td>
    			</c:when>
    			<c:when test="${(statu.index + 1) mod num == 0}">
    					<td>
		     			  <input id="ck_${terminal.groupNo}" name="ck_termNo" ${term.checked} type="checkbox" value="${term.termNo}"/> <label> ${term.termName}</label>
			     		</td>
    				</tr>
    			</c:when>
    			<c:otherwise>
    				<td>
	     			  <input id="ck_${terminal.groupNo}" name="ck_termNo" ${term.checked} type="checkbox" value="${term.termNo}"/> <label> ${term.termName}</label>
		     		</td>
    			</c:otherwise>
    		</c:choose>
    		<c:if test="${(statu.index + 1) == lens and lens mod num != 0}">
   				<c:forEach begin="1" step="1" end="${num - (lens mod num)}">
   					<td></td>
   				</c:forEach>
   				</tr>
    		</c:if>
    	</c:forEach>
    </table><br/>
     </c:forEach>
    <pm:hasPermission permValue="us_saveterm">
	   <p class="div_submit">
	    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
	   </p>
	 </pm:hasPermission>
  </div>
  </div>
  </form>
 
</div>

</body>
</html>