<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
	function delConfirm(id){
		$.layer({
		  shade : [0], //不显示遮罩
		  area : ['auto','auto'],
		  dialog : {
		      msg:'你是否确定要删除?' ,
		      btns : 2,
		      type : 4,
		      btn : ['是','否'],
		      yes : function(){
		          location.href='${ctx}/admin/news/delete/' + id + '.html?cateCode=${category.cateCode }';
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
<div class="admin_table">
<div class="content_box">
  <div class="btn_box">
  	
  		<input  id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/news/add/new.html?cateCode=${cateCode}'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/manager/news/list/1.html" method="post">
  	<input type="hidden" name="cateCode" value="${category.cateCode }"/>
  	  </form>
    <h2>${category.remark }&gt;&gt;${category.cateName}</h2>
 
  <br/>
      <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	        <th>标题</th>
	        <th>文档原始时间</th>
	        
	     
	        <th>创建用户</th>
	     
	        <th width="11%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	 

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr>
	<td>${sta.index+1}</td>
	        <td>${o.title}</td>
	        <td><fmt:formatDate value="${o.realTime}"
								pattern="yyyy-MM-dd" /></td>
	       
	        
	        <td>${o.createUser}</td>
	   
	       
	        <td>
	     
	       <div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/news/update/${o.id}.html?cateCode=${cateCode}'"/>
		          	</div>
	          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${o.id}')"/>
		         	</div>
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
 </div>
</body>
</html>
