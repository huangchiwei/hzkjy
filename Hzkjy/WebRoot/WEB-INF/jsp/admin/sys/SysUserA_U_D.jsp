<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/js/jsp/sys/SysUserA_U_D.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	formInitConfig("add_form",3000);
	autoValidate();
});

</script>
<c:if test="${user == null}">
	<script type="text/javascript">
	$(function(){
		/** 异步判断登录名是否重复 */
		var isFlag = true;
		$("#userNo").change(function(){
			if (/^\w+$/.test($.trim(this.value))){
				// 发送异步请求
				$.ajax({
					url : "${ctx}/admin/sysUser/validUserNo.html?random=" + Math.random(),
					type : "post",
					data : "userNo=" + $.trim(this.value),
					dataType : "json",
					async : false,
					success : function(data){
						isFlag = data.isFlag;
						if (!data.isFlag){
							parent.parent.alert('用户编号已存在!', 8);
						}
					},
					error : function(){
						parent.parent.alert("检测用户编号失败！");
					}
				});
			}
		});
		$("#sumbit_bt").click(function(){
			if(!isFlag){
				parent.parent.alert('用户编号已存在!', 8);
				$("#sumbit_bt").focus();
				return false;
			}
		});
	});
	
	</script>
</c:if>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/sysUser/list/1.html'"/>
   </div>
<form id="add_form" action='<c:if test="${user == null}">${ctx}/admin/sysUser/save.html</c:if><c:if test="${user != null and update != null}">${ctx}/admin/sysUser/update/${user.userNo}.html</c:if>' method="post">

  <div class="add_info">

   <h2>${user == null ? '添加用户' : (update != null ? '修改用户' : '用户详情')}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">用户编号：</th>
     <td>
     	<input id="userNo" name="userNo" type="text" value="${user.userNo}" maxlength="20" ${update != null ? "disabled='disabled'" : ""} />
     </td>
     
     <th>姓名：</th>
     <td>
     	<input id="userName" name="userName" type="text" value="${user.userName}" maxlength="20"/>
     </td>
     <th>性别：</th>
     <td>
    	<input name="sex" type="radio" value="1" checked="checked" />
    	<label>男</label>
    	<input name="sex" type="radio" value="0" <c:if test="${user.sex == 0}">checked</c:if>/>
    	<label>女</label>
     </td>
     
    </tr>
	    <c:if test="${user != null and update == null}">
	    <tr>
	     <th>创建人：</th>
	     <td>
	     	<input type="text" value="${user.creater.userName}" />
	     </td>
	     <th>创建时间：</th>
	     <td>
	     	<input type="text" value="<fmt:formatDate value="${user.createDate}"
										pattern="yyyy-MM-dd" />"/>
	     	
	     </td>
	     <th>状态：</th>
	   	 <td>
	   	 	<input type="text" value="${user.status == 1 ? '激活' : '冻结'}"/>
	   	 </td>
	    </tr>
    </c:if>
    <tr>
     <th>手机号码：</th>
     <td>
     	<input id="phone" name="phone" type="text" value="${user.phone}" maxlength="11"/>
     </td>
     <th>邮箱：</th>
     <td>
     	<input id="email" name="email" type="text" value="${user.email}"/>
     </td>
     <th>电话号码：</th>
     <td>
     	<input id="tel" name="tel" type="text" value="${user.tel}" />
     </td>
    </tr>
    <tr>
     <c:if test="${user == null}">
	     <th>密码：</th>
	     <td>
	     	<input id="pwd" name="pwd" type="password" />
	     </td>
	     <th>重复密码：</th>
	     <td>
	     	<input id="repwd" name="repwd" type="password" />
	     </td>
	  </c:if>
	  <th>QQ：</th>
      <td>
     	<input id="QQNum" name="QQNum" type="text" value="${user.QQNum}" />
      </td>
	  <c:if test="${user != null}">
	     <th></th>
	     <td>
	     	
	     </td>
	     <th></th>
	     <td>
	     	
	     </td>
	  </c:if>
    </tr>
   </table>
     角色：<br />
     <c:set var="num" value="2"/>
    <table>
    	<c:set var="lens" value="${fn:length(allRoles)}"/>
    	<c:forEach items="${allRoles}" var="role" varStatus="sta">
    		<c:choose>
    			<c:when test="${(sta.index + 1) mod num == 1}">
    				<tr>
    					<td width="100px">
    						<input id="ck_${role.roleNo}" name="ck_roleNo" ${role.checked} type="checkbox" value="${role.roleNo}"/><label> ${role.roleName}</label>
    					</td>
    			</c:when>
    			<c:when test="${(sta.index + 1) mod num == 0}">
    					<td width="100px">
			     			<input id="ck_${role.roleNo}" name="ck_roleNo" ${role.checked} type="checkbox" value="${role.roleNo}"/><label> ${role.roleName}</label>
			     		</td>
    				</tr>
    			</c:when>
    			<c:otherwise>
    				<td width="100px">
		     			<input id="ck_${role.roleNo}" name="ck_roleNo" ${role.checked} type="checkbox" value="${role.roleNo}"/><label> ${role.roleName}</label>
		     		</td>
    			</c:otherwise>
    		</c:choose>
    		<c:if test="${(sta.index + 1) == lens and lens mod num != 0}">
    				<c:forEach begin="1" step="1" end="${num - (lens mod num)}">
    					<td width="100px"></td>
    				</c:forEach>
    				</tr>
    		</c:if>
    	</c:forEach>
    	
    	
    </table>
    <c:choose>
    	<c:when test="${user == null}">
    		<pm:hasPermission permValue="us_save">
    			<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
				</p>
    		</pm:hasPermission>
    	</c:when>
    	<c:when test="${update != null}">
    		<pm:hasPermission permValue="us_updt">
    			<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
				</p>
    		</pm:hasPermission>
    	</c:when>
    </c:choose>
  </div>
  </form>
</div>

</body>
</html>