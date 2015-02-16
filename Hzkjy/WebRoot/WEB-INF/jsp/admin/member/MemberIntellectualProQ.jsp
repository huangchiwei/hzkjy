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

<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
function delConfirm(id){
	$.layer({
	  shade : [0], //不显示遮罩
	  area : ['auto','auto'],
	  dialog : {
	      msg:'是否要删除：' + id,
	      btns : 2,
	      type : 4,
	      btn : ['是','否'],
	      yes : function(){
	          location.href='${ctx}/admin/memberIntellectualPro/delete/' + id + '.html';
	      },
	      no : function(index){
	         layer.close(index);
	      }
	  }
	});
}
</script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
  <div class="btn_box">

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/memberIntellectualPro/add/new.html'"/>
     
  </div>
  <div class="list_info">
 
    <h2>按条件查询</h2>

    
 
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  	<th>&nbsp;</th>
	  	 <th>企业名称</th> 
	        <th>项目级别</th>
	        <th>项目类别</th>
	        <th>项目名称</th>
	        <th>申报额度(万)</th>
	       <th>是否立项</th>
	        <th>立项资助金额(万)</th>
	            <th>申报时间</th>
	        <th width="6%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr >
	           	<td>${sta.index + 1}</td>
	           	<td>${o.Qymc}</td>
	       	<td><c:if test="${o.ProjectLevel==0}">国家级</c:if><c:if test="${o.ProjectLevel==1}">省级</c:if><c:if test="${o.ProjectLevel==2}">市级</c:if><c:if test="${o.ProjectLevel==3}">区级</c:if></td>
	       		<td>${o.ProjectType}</td>
	       			<td>${o.ProjectName}</td>
	       				<td>${o.ApplyAmount}</td>
	       					<td>${o.IsSetUp}</td>
	       						<td><c:if test="${o.SetUpAmount==0}">不立项</c:if><c:if test="${o.SetUpAmount==1}">立项</c:if></td>
	       					<td>${o.ApplyTime}</td>	
	        <td>
	          		<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberIntellectualPro/update.html?id=${o.Id}'"/>
		          	</div>
	           	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${o.Id}')"/>
		         	</div>
	         </td>
	      </tr>
      </c:forEach>
  
	</tbody>
	<tfoot>
	
	</tfoot>
    </table>
     	<form id="search_form" action="${ctx}/admin/memberIntellectualPro/list/1.html" method="post">
    	<div class="page">
					<p:pager/>
				</div>
				   </form>
  </div>
</div>
</body>
</html>
