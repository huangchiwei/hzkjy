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
$("#fssq option[value='${fssq}']").attr("selected", true); 
$("#ffzjgNo option[value='${ffzjgNo}']").attr("selected", true); 
});


function loadPageLayer(title,url){
	var mypop = $.layer({
	    type: 2,
	    title: title,
	    iframe: {src : url},
	    maxmin: true,
	    area: ['500px', '120px'],
	    offset: [($(window).height())/4+200+'px',''],  
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

function tjsh(id){

			$.ajax({
				url:'${ctx}/admin/rentalExamine/ZShtg.html?id='+id+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
          
	document.getElementById("search_form").submit();
		
}

function find(){    
	$("#search_form").attr("action","${ctx}/admin/memberRental/list/1.html");
	document.getElementById("search_form").submit();
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
  	<form id="search_form" action="${ctx}/admin/memberRental/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dd > 
        &nbsp;&nbsp;&nbsp;&nbsp;企业名称：<input type="text" id="fhymc" name="fhymc" value="${fhymc}" size=40 onfocus="loadCorpName();"/>
        	</dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
         <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
      
    </dl>
    </div>
    
    </form>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
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
	        <th width="16%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="hy_save">
	       	<c:set var="hy_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="hy_updt">
	       	<c:set var="hy_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="hy_del">
	       	<c:set var="hy_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr ondblclick="javascript:location.href='${ctx}/admin/memberRental/add/new.html?id=${mb.id}'">
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
	        <a href="javascript:tjsh('${mb.id}')">审核并发送</a>
	       <a href="javascript:loadPageLayer('退回并备注退审信息','${ctx}/admin/memberRental/Sh.html?id='+${mb.id});">退回</a>
	          	<c:if test="${hy_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberRental/add/new.html?id=${mb.id}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${hy_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${mb.id}')"/>
		         	</div>
	         	</c:if>
	         </td>
	      </tr>
      </c:forEach>
      <tr>
        <td colspan="9"></td>
      <td>总计</td>
      <td>${zj!=''?zj:'0'}家</td>
    
      </tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="11">
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
