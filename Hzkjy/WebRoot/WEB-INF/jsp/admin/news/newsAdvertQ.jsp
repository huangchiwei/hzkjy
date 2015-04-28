<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userList</title>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/style.css" rel="stylesheet" type="text/css" />
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
		          location.href='${ctx}/admin/newsAdvert/delete/' + id + '.html';
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
  	
  		<input  id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/newsAdvert/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/manager/newsAdvert/list/1.html" method="post">
  	
  	  </form>
    <h2>广告管理&gt;&gt;首页广告</h2>
 
  <br/>
      <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	  		 <th>位置</th>
	        <th>标题</th>
	          <th>链接地址</th>
	        <th>备注</th>
	        <th>文档修改时间</th>
	        <th>图片下载</th>    
	        <th width="11%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	 

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr>
	<td>${sta.index+1}</td>
	<td><c:if test="${o.adType==0}">首页轮播图</c:if>
	<c:if test="${o.adType==1}">首页中间位置图</c:if>
	<c:if test="${o.adType==2}">首页右下角位置图</c:if>
	<c:if test="${o.adType==3}">首页底部位置图</c:if></td>
	        <td>${o.title}</td>
	        <td>${o.linkUrl}</td>
	         <td>${o.remark}</td>
	        <td><fmt:formatDate value="${o.updateTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
	       
	        
	        <td><a href="${ctx}/admin/newsAdvert/downLoad/${o.id}.html">下载</a></td>
	   
	       
	        <td>
	       <div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/newsAdvert/update/${o.id}.html'"/>
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
