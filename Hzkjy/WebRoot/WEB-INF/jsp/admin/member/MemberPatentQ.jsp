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
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
function find(){    
	$("#search_form").attr("action","${ctx}/admin/memberPatent/list/1.html?random=" + Math.random());
	document.getElementById("search_form").submit();
    }  
function out(){    
	$("#search_form").attr("action","${ctx}/admin/memberPatent/outExcel/1.html?random=" + Math.random());
	document.getElementById("search_form").submit();
    } 
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
        <dd > <form id="search_form" action="${ctx}/admin/memberPatent/list/1.html" method="post">
        &nbsp;&nbsp;&nbsp;&nbsp;年份： <input id="year" name="year"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${params.year}" maxlength="10"/>
     	月份：<select name="month" id="month">
     	<option value="0" <c:if test="${params.month==0}">selected="selected"</c:if>>1~6月</option>
     	<option value="1" <c:if test="${params.month==1}">selected="selected"</c:if>>7~12月</option>
     	</select>
        	</form></dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
                 
           <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
      
    </dl>
    </div>
<br/>
    
 
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  	<th>序号</th>
	  	 <th>企业名称</th> 
	        <th width="60px;">专利类别</th>
	        <th >专利名称</th>
	        <th width="100px;">专利编号</th>
	       
	           
	        <th width="60">操作</th>
	  	</tr>
	  </thead>
	  <tbody>

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr >
	           	<td>${sta.index + 1}</td>
	           	<td>${o.Qymc}</td>
	       	<td>
	       	<c:if test="${o.Type==0 }">发明专利</c:if>
	       	<c:if test="${o.Type==1 }">实用新型</c:if>
	       	<c:if test="${o.Type==2 }">外观设计</c:if>
	       	<c:if test="${o.Type==3 }">软件著作权</c:if>
	       	</td>
	       		<td>${o.Name}</td>
	       			<td>${o.PatentNo}</td>	
	       				
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
     	
    	<div class="page">
					<p:pager/>
				</div>
				   
  </div>
</div>

</body>
</html>
