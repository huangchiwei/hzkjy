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
	          location.href='${ctx}/admin/memberPatent/delete/' + id + '.html';
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

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/memberPatent/add/new.html'"/>
     
  </div>
  <div class="list_info">
 
    <h2>专利列表</h2>
        <div class="div2">
      <dl class="relative h30">
        <dd > 
        &nbsp;&nbsp;&nbsp;&nbsp;申请时间： <input id="startTime" name="startTime"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" type="text" 
     	value="<fmt:formatDate value="${params.startTime}" pattern="yyyy-MM-dd"/>" maxlength="10"/>到<input id="endTime" name="endTime"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" type="text" 
     	value="<fmt:formatDate value="${params.endTime}" pattern="yyyy-MM-dd"/>" maxlength="10"/>
        	</dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
                 
           <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
      
    </dl>
    </div>
<br/>
    
 
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  	<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
	  	 <th>企业名称</th> 
	        <th width="60px;">专利类别</th>
	        <th width="250px;">专利名称</th>
	        <th width="200px;">专利编号</th>
	       <th width="60px;">状态</th>
	            <th width="80px;">申报时间</th>
	        <th width="6%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr >
	           	<td>${sta.index + 1}</td>
	           	<td>${o.Qymc}</td>
	       	<td>${o.Type }</td>
	       		<td>${o.Name}</td>
	       			<td>${o.PatentNo}</td>	
	       					<td><fmt:formatDate value="${o.ApplyTime}" pattern="yyyy-MM-dd"/></td>	
	        <td>
	          		<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberPatent/update/${o.Id}.html'"/>
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