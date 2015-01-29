<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<%@taglib uri="permission-tags" prefix="pm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>roleList</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jsp/base/default_tr.js"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
function delConfirm(roleNo){
	$.layer({
	  shade : [0], //不显示遮罩
	  area : ['auto','auto'],
	  dialog : {
	      msg:'是否要删除：' + roleNo,
	      btns : 2, 
	      type : 4,
	      btn : ['是','否'],
	      yes : function(){
	          location.href='${ctx}/admin/sysRole/delete/' + roleNo + '.html';
	      },
	      no : function(index){
	         layer.close(index);
	      }
	  }
	});
}
</script>
</head>

<body>
<div class="content_box">
 <div class="list_info relative">
<div class="btn_box">
	<pm:hasPermission permValue="role_save">
     <input id="add_bt" type="button" value="添加" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/sysRole/add/new.html'"/>
  	</pm:hasPermission>
  </div>
  <div class="list_info">
  	<form action="${ctx}/admin/sysRole/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dt class="w100">角色名称：</dt>
        <dd>
          <input name="roleName" type="text" class="input_a1" value="${tempRole.roleName}"/>
        </dd>
        <dt class="w_bf_20">
            <input id="search_bt" name="input2" type="image" src="${ctx}/theme/admin/default/images/search.png" align="left" />
        </dt>
      </dl>
    </div>
    </form>
    <table width="98%" border="0" cellpadding="0" cellspacing="1">
     	<thead>
    		<tr>
		       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		        <th>角色编号</th>
		        <th>角色名称</th>
		        <th>备注</th>
		        <th>创建人</th>
		        <th>创建日期</th>
		        <th>修改人</th>
		        <th>修改日期</th>
		        <th width="9%">操作</th>
		     </tr>
    	</thead>
	  <tbody>
	  <!-- 变量 -->
	  	<pm:hasPermission permValue="role_saveperm">
	       	<c:set var="role_saveperm" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="role_updt">
	       	<c:set var="role_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="role_del">
	       	<c:set var="role_del" value="true"/>
	    </pm:hasPermission>
	      <c:forEach items="${roles}" var="role" varStatus="sta">
		      <tr>
		      	<td>${sta.index + 1}</td>
		        <td>${role.roleNo}</td>
		        <td>${role.roleName}</td>
		        <td>${role.remark}</td>
		        <td>${role.creater.userName}</td>
		        <td>
		         	<fmt:formatDate value="${role.createDate}"
									pattern="yyyy-MM-dd" /></td>
		        <td>${role.modifier.userName}</td>
		        <td>
		         	<fmt:formatDate value="${role.modifyDate}"
									pattern="yyyy-MM-dd" /></td>
		        <td>
		        	  <c:if test="${role_saveperm == true}">
				          <div class="btn_icon">
				          	<input type="image" src="${ctx}/theme/admin/default/images/allocation.png" title="分配权限" onclick="javascript:location.href='${ctx}/admin/sysRole/toRoleToPerm.html?roleNo=${role.roleNo}'"/>
				          </div>
			          </c:if>
			          <c:if test="${role_updt == true}">
				          <div class="btn_icon">
				          	<input type="image" src="${ctx}/theme/admin/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/sysRole/add/new.html?roleNo=${role.roleNo}'"/>
				          </div>
			          </c:if>
			          <c:if test="${role_del == true}">
				          <div class="btn_icon">
				          	<input type="image" src="${ctx}/theme/admin/default/images/del_icon.png" title="删除" onclick="delConfirm('${role.roleNo}')"/>
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
