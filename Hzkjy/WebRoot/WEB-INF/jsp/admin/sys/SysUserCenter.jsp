<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心</title>
<link href="${ctx}/theme/admin/default_2/style/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default_2/style/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>



</head>

<body>
	<form action="${ctx}/admin/sysUser/updateUserCenter.html" method="post"
			class="focusID" onsubmit="return checkForm()">
		
			<div class="modify">
				<table border="0" cellspacing="0" cellpadding="0" class="table" 
					width="50%">
					<tr>
						<th>姓名</th>
						<td>
							${user.userName}
						</td>
					    <th>
							创建人
						</th>
						<td >
							${user.creater.userName}
						</td> 
					</tr>
					<tr>
					   
					    
						
					</tr>
					<tr>
					   
					
							<th>
							创建时间
						</th>
						<td>
							<fmt:formatDate value="${user.createDate}"
										pattern="yyyy-MM-dd" />
						</td>
						<th>
							性别
						</th>
						<td >
							<input name="sex" type="radio" value="1" checked="checked" />
    	<label>男</label>
    	<input name="sex" type="radio" value="0" <c:if test="${user.sex == 0}">checked</c:if>/>
    	<label>女</label>
						</td> 
					</tr>
					
                  
                    <tr>
						<th>
							手机号码
						</th>
						<td>
							<input id="phone" name="phone" type="text" value="${user.phone}" maxlength="11"/>
						</td>
						<th>
							邮箱
						</th>
						<td>
							<input id="email" name="email" type="text" value="${user.email}"/>
						</td>
					</tr>
					<tr>
						<th>
							电话号码
						</th>
						<td>
					<input id="tel" name="tel" type="text" value="${user.tel}" />				
						</td>
						<th>
							QQ
						</th>
						<td>
							<input id="QQNum" name="QQNum" type="text" value="${user.QQNum}" />
						</td>
					</tr>
				
				</table>
				<div class="pay">
					<div class="pay_c">
						<input type="submit" class="input_c" value="保  存 " />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<font color="red" style="font-size: 18px; font-weight: bold;">${msg}</font>
					</div>
				</div>
			</div>
		</form>
</body>
</html>
