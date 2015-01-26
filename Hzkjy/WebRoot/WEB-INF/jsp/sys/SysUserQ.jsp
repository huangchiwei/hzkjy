<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="permission-tags" prefix="pm" %>
<%@taglib uri="htmlControl-tags" prefix="hc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jsp/base/default_tr.js"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
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
		          location.href='${ctx}/sys/sysUser/delete/' + userNo + '.html';
		      },
		      no : function(index){
		         layer.close(index);
		      }
		  }
		});
	}
	function changeStatus(userNo,status){
		location.href='${ctx}/sys/sysUser/changeStatus.html?userNo=' + userNo + '&status=' + status;
	}

</script>
</head>

<body>
<div class="content_box">
  <div class="btn_box">
  	
  		<input <hc:attribute attrName="disabled" permValue="us_save"/> id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/sys/sysUser/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/sys/sysUser/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dt class="w100">用户名：</dt>
        <dd>
          <input name="userName" type="text" class="input_a1" value="${tempUser.userName}"/>
        </dd>
        <dt>手机：</dt>
        <dd class="w_bf_20">
          <input name="phone" type="text" class="input_a1" value="${tempUser.phone}"/>
          <div class="search">
            <input id="search_bt" name="input2" type="image" src="${ctx}/theme/default/images/search.png" align="left" />
          </div>
        </dd>
      </dl>
    </div>
    </form>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
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
	  <pm:hasPermission permValue="us_saveterm">
	       	<c:set var="us_saveterm" value="true"/>
	    </pm:hasPermission>
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
	      	<td>${sta.index + 1}</td>
	        <td>${user.userNo}</td>
	        <td>${user.userName}</td>
	        <td>${user.sex == 1 ? '男' : '女'}</td>
	        <td>${user.email}</td>
	        <td>${user.phone}</td>
	        <td>
	          		<c:if test="${user.status == 1}">
	          			<input type="image" src="${ctx}/theme/default/images/prompt.png" title="激活" <c:if test="${us_chasta == true}">onclick="changeStatus('${user.userNo}',2)"</c:if>/>
	          		</c:if>
	          		<c:if test="${user.status == 2}">
	          			<input type="image" src="${ctx}/theme/default/images/freeze_icon.png" title="冻结" <c:if test="${us_chasta == true}">onclick="changeStatus('${user.userNo}',1)"</c:if>/>
	          		</c:if>
	        </td>
	        <td>
	         	<fmt:formatDate value="${user.createDate}"
								pattern="yyyy-MM-dd" /></td>
	        <td>
	        	
		        	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/file_icon.png" title="详情" onclick="javascript:location.href='${ctx}/sys/sysUser/detail/${user.userNo}.html?'"/>
		          	</div>
	          	<c:if test="${us_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/sys/sysUser/add/new.html?userNo=${user.userNo}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${us_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${user.userNo}')"/>
		         	</div>
	         	</c:if>
	         </td>
	      </tr>
      </c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="12">
				<div class="page">
					<p:pager/>
				</div>
			</td>
		</tr>
	</tfoot>
    </table>
  </div>
</div>
</body>
</html>
