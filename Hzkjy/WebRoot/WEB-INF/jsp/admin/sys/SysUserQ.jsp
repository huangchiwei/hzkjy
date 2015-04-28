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
<link href="${ctx}/theme/admin/default/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
$(document).ready(function(){
$('#checkAll').click(function(){
	$('input[name="qyId"]').attr("checked",this.checked);
});
});

function pltjsh(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要重置的用户。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/sysUser/ZShtg.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function delConfirm(userNo){
	$.layer({
	  shade : [0], //不显示遮罩
	  area : ['auto','auto'],
	  dialog : {
	      msg:'是否要删除：' + userNo,
	      btns : 2,
	      type : 4,
	      btn : ['是','否'],
	      yes : function(){
	          location.href='${ctx}/admin/sysUser/delete/' + userNo + '.html';
	      },
	      no : function(index){
	         layer.close(index);
	      }
	  }
	});
}
function changeStatus(userNo,status,toDo){
	$.ajax({
				url:'${ctx}/admin/sysUser/changeStatus.html?userNo=' + userNo + '&status=' + status + '&toDo=' + toDo,
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  			if(data.flag == 1)
		  				$('#search_form').submit();
		  		}
		  	});
}

function find(){    
	$("#search_form").attr("action","${ctx}/admin/sysUser/list/1.html");
	document.getElementById("search_form").submit();
    }   
</script>
</head>

<body>
<div class="admin_table">
<div class="content_box">
  <div class="btn_box">
  	<pm:hasPermission permValue="us_save">
  		<input id="add_bt" type="button" value="添加" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/sysUser/add/new.html'"/>
  	</pm:hasPermission>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/sysUser/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dt class="w100">用户名：</dt>
        <dd>
          <input name="userName" type="text" class="input_a1" value="${tempUser.userName}"/>
        </dd>
        <dt>手机：</dt>
        <dd>
          <input name="phone" type="text" class="input_a1" value="${tempUser.phone}"/> 
        </dd>
        <dt>状态：</dt>
        <dd class="w_bf_20">
        	<select name="status">
        		<option value="-1">--状态--</option>
        		<option value="3" ${tempUser.status == 3 ? 'selected="selected"' : ''}>待激活</option>
        		<option value="1" ${tempUser.status == 1 ? 'selected="selected"' : ''}>激活</option>
        		<option value="2" ${tempUser.status == 2 ? 'selected="selected"' : ''}>冻结</option>
        	</select>
        	<input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
           <input id="" type="button" value="重置密码" class="initial" onclick="pltjsh()"/>
        </dd>
      </dl>
    </div>
    </form>
   <table width="98%" width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		<th><input type="checkbox" id="checkAll"/>全选</th>
	        <th>用户编号</th>
	        <th>用户名</th>
	        <th>性别</th>
	        <th>邮箱</th>
	        <th>手机</th>
	        <th>状态</th>
	        <th>创建日期</th>
	        <th width="11%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	    <pm:hasPermission permValue="us_updt">
	       	<c:set var="us_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="us_del">
	       	<c:set var="us_del" value="true"/>
	    </pm:hasPermission>
	   <pm:hasPermission permValue="us_chasta">
	   		<c:set var="us_chasta" value="true"/>
	   </pm:hasPermission>
      <c:forEach items="${users}" var="user" varStatus="sta">
	      <tr>
	      	 <td><input type="checkbox" value="${user.id}" name="qyId"/></td>
	        <td>${user.userNo}</td>
	        <td>${user.userName}</td>
	        <td>${user.sex == 1 ? '男' : '女'}</td>
	        <td>${user.email}</td>
	        <td>${user.phone}</td>
	        <td>
	        	<c:choose>
	        		<c:when test="${user.status == 1}">
	        			<a title="点击冻结" href="#" <c:if test="${us_chasta == true}">onclick="changeStatus('${user.userNo}',2,'')"</c:if>>激活</a>
	        		</c:when>
	        		<c:when test="${user.status == 2}">
	        			<a title="点击激活" href="#" <c:if test="${us_chasta == true}">onclick="changeStatus('${user.userNo}',1,'')"</c:if>>冻结</a>
	        		</c:when>
	        		<c:when test="${user.status == 3}">
	        			<a title="点击激活" href="#" <c:if test="${us_chasta == true}">onclick="changeStatus('${user.userNo}',1,'jihuo')"</c:if>>待激活</a>
	        		</c:when>
	        	</c:choose>
	        </td>
	        <td>
	         	<fmt:formatDate value="${user.createDate}"
								pattern="yyyy-MM-dd" /></td>
	        <td>
	          	<c:if test="${us_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/admin/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/sysUser/add/new.html?userNo=${user.userNo}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${us_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/admin/default/images/del_icon.png" title="删除" onclick="delConfirm('${user.userNo}')"/>
		         	</div>
	         	</c:if>
	         </td>
	      </tr>
      </c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<div class="page">
					<p:pager/>
				</div>
			</td>
		</tr>
	</tfoot>
    </table>
  </div>
  </div>
</div>
</body>
</html>
