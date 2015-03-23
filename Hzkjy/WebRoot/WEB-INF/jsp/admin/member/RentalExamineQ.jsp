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
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jsp/base/default_tr.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">
$(document).ready(function(){

$('#checkAll').click(function(){
	$('input[name="qyId"]').attr("checked",this.checked);
});
});


var myWindow;
function printHuiZhiList(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要打印的企业。');
		return;
	}
	ids = ids.substring(0,ids.length - 1);
	myWindow = $.layer({
	    type: 2,
	    maxmin: true,
	    shadeClose: true,
	    title: "批量打印",
	    shade: [0.1,'#fff'],
	    offset: ['10px',''],
	    area: ['500px', '400px'],
	    iframe: {src: "${ctx}/admin/rentalExamine/printHuiZhiList.html?ids=" + ids + "&random="+Math.random()}
	});
}
function pltjsh(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要审核的企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/rentalExamine/ZShtg.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pltzjf(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要通知的企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/rentalExamine/Pltz.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}

function pltssh(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要退回的企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/rentalExamine/Thtg.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}


function find(){    
	$("#search_form").attr("action","${ctx}/admin/rentalExamine/list/1.html");
	document.getElementById("search_form").submit();
    }   
   function out(){    
	$("#search_form").attr("action","${ctx}/admin/rentalExamine/outPtqfqk/1.html");
	document.getElementById("search_form").submit();
    }   

var corpNameJson="";


function loadCorpName(){
	if(corpNameJson!=""){
		corpAutocomplete(corpNameJson);
		}else{
			$.ajax({
				url:'${ctx}/admin/memberBasic/getSelectedCorpNameList.html?random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  			corpAutocomplete(data);
		  			corpNameJson=data;
		  		},
		  		error:function(){
		  			alert('失败');
		  		} 
		  		
		  	});
			}
}
function corpAutocomplete(data){
	$("#fhymc").autocomplete(data,{
			 minChars:0,
			matchContains: true,
			//autoFill:true,
			//mustMatch:true,
			dataType:"json",
			formatItem: function(row, i, max) {
	                 return row.qymc;
	            },
	            formatMatch: function(row, i, max) {
	                 return row.qymc + row.qymcpy;
	            },
	            formatResult: function(row) {
	                 return row.qymc;
	            }
		}).result(function(event, data, formatted) {
			 
	});
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
		          location.href='${ctx}/admin/memberRental/delete/' + id + '.html';
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

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/memberRental/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/rentalExamine/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dd > 
        &nbsp;&nbsp;&nbsp;&nbsp;企业名称：<input type="text" id="fhymc" name="fhymc" value="${fhymc}" size=40 onfocus="loadCorpName();"/>
        	</dd>
        <dd >  	
        &nbsp;&nbsp;&nbsp;&nbsp;费用所属年月：<input id="fjfyd" name="fjfyd" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM'});" value="${fjfyd}"
								 class="input_a1" maxlength="20"/>
								</dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
         <dt><input id="" type="button" value="批量打印" class="initial" onclick="printHuiZhiList()"/></dt>
         <dt><input id="" type="button" value="批量审核" class="initial" onclick="pltjsh()"/></dt>
         <dt><input id="" type="button" value="批量退回" class="initial" onclick="pltssh()"/></dt>
         <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
      
    </dl>
    </div>
    
    </form>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  	<th><input type="checkbox" id="checkAll"/>全选</th>
	  	<th>序号</th>
	  	 <th>企业编号</th> 
	  	 <th>企业名称</th> 
	        <th>租用单元</th>
	        <th>租金</th>
	        <th>水费</th>
	        <th>电费</th>
	        <th>管理服务费</th>
	        <th>缴费年月</th>
	        <th>审核状态</th>
	        <th width="6%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="shzj_save">
	       	<c:set var="shzj_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="shzj_updt">
	       	<c:set var="shzj_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="shzj_del">
	       	<c:set var="shzj_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr ondblclick="javascript:location.href='${ctx}/admin/memberRental/add/new.html?id=${mb.id}'">
	      <td><input type="checkbox" value="${mb.id}" name="qyId"/></td>
	           	<td>${sta.index + 1}</td>
	           	<td>${mb.hybh}</td>
	        <td>${mb.qymc}</td>
	        <td>${mb.zydy}元</td>
	        <td>${mb.qyzj}元</td>
	        <td>${mb.qysf}元</td>
	        <td>${mb.qydf}元</td>
	        <td>${mb.glfwf}元</td>
	        <td>${mb.jfyd}</td>
	        <td>${mb.shzt}</td>
	        <td>
	          	<c:if test="${shzj_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberRental/add/new.html?id=${mb.id}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${shzj_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${mb.id}')"/>
		         	</div>
	         	</c:if>
	         </td>
	      </tr>
      </c:forEach>
      <tr>
        <td colspan="10"></td>
      <td>总计</td>
      <td>${zj!=''?zj:'0'}家</td>
    
      </tr>
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
