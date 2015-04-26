<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script language="javascript" src="${ctx}/js/jsp/sys/SysRoleA_U.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	formInitConfig("add_form",3000);
	autoValidate();
});

</script>
<c:if test="${role == null}">
	<script type="text/javascript">
	$(function(){
		/** 异步判断登录名是否重复 */
		var isFlag = true;
		$("#roleNo").change(function(){
			if (/^\w{6,20}$/.test($.trim(this.value))){
				// 发送同步请求
				$.ajax({
					url : "${ctx}/admin/sysRole/validRoleNo.html?random=" + Math.random(),
					type : "post",
					data : "roleNo=" + $.trim(this.value),
					dataType : "json",
					async : false,
					success : function(data){
						isFlag = data.isFlag;
						if (!data.isFlag){
							parent.parent.alert('角色编号已存在!', 8);
						}
					},
					error : function(){
						parent.parent.alert("检测角色编号失败！");
					}
				});
			}else{
				isFlag = true;
			}
		});
		$("#sumbit_bt").click(function(){
			if(!isFlag){
				parent.parent.alert('角色编号已存在!', 8);
				$("#sumbit_bt").focus();
				return false;
			}
		});
	});
	</script>
</c:if>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
  <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/sysRole/list/1.html'"/>
   </div>
<form id="add_form" action='<c:if test="${role == null}">${ctx}/admin/sysRole/save.html</c:if><c:if test="${role != null}">${ctx}/admin/sysRole/update/${role.roleNo}.html</c:if>' method="post" >
  <div class="add_info">
   <h2>${role != null ? '修改角色' : '添加角色'}</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <th class="w100">角色编号：</th>
         <td><input id="roleNo" name="roleNo" type="text" class="input_a1" value="${role.roleNo}" maxlength="20" ${role != null ? 'disabled="disabled"' : ''}/>
         </td>
         <th>角色名称：</th>
         <td><input id="roleName" name="roleName" type="text" value="${role.roleName}" class="input_a1" maxlength="20"/>
         </td>
         <th>备注：</th>
         <td>
         	<textarea rows="1" cols="30" name="remark" class="h20">${role.remark}</textarea>
         </td>
       </tr>
       </table>
   <c:choose>
    	<c:when test="${role == null}">
    		<pm:hasPermission permValue="role_save">
    			<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/admin/default/images/submit.png"/>
				</p>
    		</pm:hasPermission>
    	</c:when>
    	<c:when test="${role != null}">
    		<pm:hasPermission permValue="role_updt">
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