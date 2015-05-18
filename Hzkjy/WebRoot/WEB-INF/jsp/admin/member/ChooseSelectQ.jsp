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
$("#fssq option[value='${fssq}']").attr("selected", true); 
$("#ffzjgNo option[value='${ffzjgNo}']").attr("selected", true); 


$('#checkAll').click(function(){
	$('input[name="qyId"]').attr("checked",this.checked);
});
});
function find(){    
	$("#search_form").attr("action","${ctx}/admin/memberBasic/list/1.html");
	document.getElementById("search_form").submit();
    }   
    function clean(){    
	$("#fhymc").val("");
	$("#frysjf").val("");
	$("#frysje").val("");
	$("#fhtqxf").val("");
	$("#fhtqxe").val("");
    } 
   function out(){    
	$("#search_form").attr("action","${ctx}/admin/memberBasic/outPtqfqk/1.html");
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

function loadPageLayer(title,url){
	var mypop = $.layer({
	    type: 2,
	    title: title,
	    iframe: {src : url},
	    maxmin: true,
	    area: ['680px', '140px'],
	    offset: [($(window).height())/4-70+'px',''],  
	    end: function(){
	        mypop = null
	    }
	});
	$(window).on('resize', function(){
	    if(mypop){
	        layer.area(mypop, {
	            top: ($(window).height())/4-70
	        });
	    }
	});


}


function loadPageLayer2(title,url){
	var mypop = $.layer({
	    type: 2,
	    title: title,
	    iframe: {src : url},
	    maxmin: true,
	    area: ['680px', '220px'],
	    offset: [($(window).height())/4+10+'px',''],  
	    end: function(){
	        mypop = null
	    }
	});
	$(window).on('resize', function(){
	    if(mypop){
	        layer.area(mypop, {
	            top: ($(window).height())/4+10
	        });
	    }
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
		          location.href='${ctx}/admin/memberBasic/delete/' + id + '.html';
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
   
   
    function pltjsh(){
	var settime = $("#fjjzbNy").val();
	if(settime == ''){
		alert('请设置经济月报年月');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/chooseSelect/Ishas.html?settime='+settime+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  			$.ajax({
				url:'${ctx}/admin/chooseSelect/ZShtg.html?settime='+settime+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("设置成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  	});
		  		}else{
		  			alert("该月份已设置无需再设置");
		  		}
		  		},
		  		error:function(){
		  		} 
		  	});

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
				url:'${ctx}/admin/chooseSelect/Pltz.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false
		  		
		  	});
	document.getElementById("search_form").submit();
}
</script>
</head>

<body>
<div class="admin_table">
<div class="content_box">
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/chooseSelect/list/1.html" method="post">
    <h2>经济月报设置</h2>
    <div class="div_input">
        <em>设置经济月报年月：</em><input id="fjjzbNy" size=15 name="fjjzbNy" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM'});" value="${fjjzbNy}"
								 class="input_a1" maxlength="20"/>
								 <input id="" type="button" value="批量设置" class="initial" onclick="pltjsh()"/>
								  <input id="" type="button" value="通知发送" class="initial" onclick="pltzjf()"/>
    </div>
    
    </form>
 <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		  	<th><input type="checkbox" id="checkAll"/>全选</th>
	  	<th>序号</th>
	  	 <th>企业编号</th> 
	  	 <th>企业名称</th> 
	        <th>地址</th>
	        <th>租用单元</th>
	        <th>入园时间</th>
	       <th>合同期限</th>
	        <th>联系人</th>
	            <th>状态</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="jjybsz_save">
	       	<c:set var="jjybsz_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="jjybsz_updt">
	       	<c:set var="jjybsz_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="jjybsz_del">
	       	<c:set var="jjybsz_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr>
	        <td><input type="checkbox" value="${mb.id}" name="qyId"/></td>
	           	<td>${sta.index + 1}</td>
	           	<td>${mb.hybh}</td>
	        <td>${mb.qymc}</td>
	        <td>${mb.address}</td>
	        <td>${mb.zydy}</td>
	        <td><fmt:formatDate value="${mb.qyrzsj}"
								pattern="yyyy-MM-dd" /></td>
	        <td><fmt:formatDate value="${mb.htqxf}"
								pattern="yyyy-MM-dd" />至<fmt:formatDate value="${mb.htqxe}"
								pattern="yyyy-MM-dd" /></td>
	        <td>${mb.lxr}</td>
	        <td>${mb.ztName}</td>
	      </tr>
      </c:forEach>
      <tr>
        <td colspan="8"></td>
      <td>总计</td>
      <td>${zj!=''?zj:'0'}家</td>
    
      </tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10">
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
