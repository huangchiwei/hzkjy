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
function find(){    
	$("#search_form").attr("action","${ctx}/admin/eccIndicator/list/1.html");
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
		          location.href='${ctx}/admin/bsNews/delete/' + id + '.html';
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
  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/eccIndicator/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/eccIndicator/list/1.html" method="post">
    
    
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dd > 
         &nbsp;&nbsp;&nbsp;&nbsp;经济指标年月： <input id="fjjzbNy" name="fjjzbNy" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})" type="text" 
     	value="${fjjzbNy}" maxlength="20"/>
        	</dd>
         <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
      
    </dl>
    </div>
    </form>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	    <tr>
	    <td colspan="18" align="left">单位名称（公章）：广州市海珠科技产业园有限公司</td>
	   </tr>
	  	<tr >
	  	<td rowspan="3">行业分类</td>
	  	 <td rowspan="3">编号</td> 
	  	 <td rowspan="3">入驻企业</td> 
	  	 <td colspan="15">${fjjzbNy} 底累计</td>
	  	</tr>
	  	<tr>
	  	<td rowspan="2">注册资金(万元)</td>
	  	<td colspan="2">技工贸总收入</td>
	  	<td colspan="2">利润总额</td>
	  	<td colspan="2">纳税</td>
	  	<td colspan="2">利税总额</td>
	  	<td rowspan="2">创汇</td>
	  	<td rowspan="2">职工数</td>
	  	<td rowspan="2">研发经费</td>
	  	<td rowspan="2">高新技术产品收入</td>
	  	<td rowspan="2">工业总产值</td>
	  	<td rowspan="2">工业增加值</td>
	  	</tr>
	  	<tr>
	  	<td>本月数</td>
	  	<td>累计数</td>
	  	<td>本月数</td>
	  	<td>累计数</td>
	    <td>本月数</td>
	  	<td>累计数</td>
	  	<td>本月数</td>
	  	<td>累计数</td>
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
	      <tr ondblclick="javascript:location.href='${ctx}/admin/eccIndicator/add/new.html?id=${mb.id}'">
	           
	        <td>${mb.hyfl}</td>
	        <td>${sta.index + 1}</td>
	        <td>${mb.rzqy}</td>
	        <td>${mb.zczj}</td>
	        <td>${mb.jgmzsrBys}</td> 
	        <td>${mb.jgmzsrLjs}</td>
	        <td>${mb.lrzeBys}</td>  
	        <td>${mb.lrzeLjs}</td>
	        <td>${mb.nsBys}</td>    
	        <td>${mb.nsLjs}</td>
	        <td>${mb.lszeBys}</td>    
	        <td>${mb.lszeLjs}</td>     
	         <td>${mb.ch}</td>
	         <td>${mb.zgs}</td>
	         <td>${mb.yfjf}</td>
	         <td>${mb.gxjscpsr}</td>
	         <td>${mb.gyzcz}</td>
	         <td>${mb.gyzjz}</td>
	      </tr>
      </c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="18">
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
