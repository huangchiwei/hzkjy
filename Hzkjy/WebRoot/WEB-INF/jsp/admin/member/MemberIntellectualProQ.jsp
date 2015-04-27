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
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#checkAll').click(function(){
		$('input[name="qyId"]').attr("checked",this.checked);
	});
	});
function find(){    
	$("#search_form").attr("action","${ctx}/admin/memberIntellectualPro/list/1.html?random=" + Math.random());
	document.getElementById("search_form").submit();
    }   
function out(){    
	$("#search_form").attr("action","${ctx}/admin/memberIntellectualPro/outExcel/1.html?random=" + Math.random());
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
	          location.href='${ctx}/admin/memberIntellectualPro/delete/' + id + '.html';
	      },
	      no : function(index){
	         layer.close(index);
	      }
	  }
	});
}

function pass(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要审核的科技项目。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/memberIntellectualPro/pass.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function rollBack(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要退回的科技项目。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/memberIntellectualPro/rollBack.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}

</script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
	<div class="admin_table">
<div class="content_box">
  <div class="btn_box">

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/memberIntellectualPro/add/new.html'"/>
     
  </div>
  <div class="list_info">
 
    <h2>科技项目列表</h2>
     <form id="search_form" action="${ctx}/admin/memberIntellectualPro/list/1.html" method="post">
       <div class="div_input">
       
       <em>年份：</em> <input id="year" name="year"   class="input_a1" size="15" onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${params.year}" maxlength="10"/>
     	<em>月份：</em><select name="month" id="month" class="input_a1">
     	<option value="" <c:if test="${params.month==''}">selected="selected"</c:if>></option>
     	<option value="0" <c:if test="${params.month==0}">selected="selected"</c:if>>1~6月</option>
     	<option value="1" <c:if test="${params.month==1}">selected="selected"</c:if>>7~12月</option>
     	</select>
       
         <input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
          <input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/>
      <c:if test="${cookie.admin_key.value=='admin'}"><input id="" type="button" value="批量审核" class="initial" onclick="pass();"/>
         <input id="" type="button" value="批量退回" class="initial" onclick="rollBack();"/>
          </c:if>
    </div>
      </form>
<br/>
    
 
      <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  	<th><input type="checkbox" id="checkAll"/>全选</th>
	  	<th>序号</th>
	  	 <th>企业名称</th> 
	        <th>项目级别</th>
	      
	        <th >项目名称</th>
	       <th>立项</th>
	      <th>审核状态</th>
	        <th width="8%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>

      <c:forEach items="${list}" var="o" varStatus="sta">
	      <tr >
	       <td><input type="checkbox" value="${o.Id}" name="qyId"/></td>   
	           	<td>${sta.index + 1}</td>
	           	<td>${o.Qymc}</td>
	       	<td><c:if test="${o.ProjectLevel==0}">国家级</c:if><c:if test="${o.ProjectLevel==1}">省级</c:if><c:if test="${o.ProjectLevel==2}">市级</c:if><c:if test="${o.ProjectLevel==3}">区级</c:if></td>
	       		
	       			<td>${o.ProjectName}</td>
	       				
	       				<td><c:if test="${o.IsSetUp==0}">未知</c:if><c:if test="${o.IsSetUp==1}">否</c:if><c:if test="${o.IsSetUp==2}">是</c:if></td>
	   	<td>
	   	<c:if test="${o.Status==1}">通过</c:if>
	   		<c:if test="${o.Status==0}">不通过</c:if>
	   	</td>
	   	
	        <td>
	          		<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberIntellectualPro/update/${o.Id}.html'"/>
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
  </div>
</body>
</html>
