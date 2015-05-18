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
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
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
	$("#search_form").attr("action","${ctx}/admin/rentStatistics/list/1.html");
	document.getElementById("search_form").submit();
    }   
   function out(){    
	$("#search_form").attr("action","${ctx}/admin/rentStatistics/outPtqfqk/1.html");
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
<div class="admin_table">
<div class="content_box">
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/eccIndicator/list/1.html" method="post">
    
    
    <h2>按条件查询</h2>
      <div class="div_input">
         <em>经济指标年月：</em> <input id="fjjzbNy" name="fjjzbNy" class="input_a1" size=15 onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})" type="text" 
     	value="${fjjzbNy}" maxlength="20"/>
         <input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
         <input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/>

    </div>
    </form>
   <table width="98%" border="0" cellpadding="0" cellspacing="1">
	    <tr>
	    <td colspan="10" align="left">${fjjzbNy}的费用明细</td>
	   </tr>
	  	<tr >
	  	<td colspan="9"></td>
	  	<td align="left"> 单位：元</td>
	  	</tr>
	  	<tr>
	  	<td colspan="2">位置</td>
	  	<td>租金</td>
	  	<td>管理服务费/管理费/物业管理费</td>
	  	<td>水费/水电公摊费</td>
	  	<td>电费</td>
	  	<td>租赁保证金</td>
	  	<td>装修押金</td>
	  	 <td>缴费确认</td> 
	     <td>欠费金额</td>
	  	</tr>
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
	 <c:if test="${Hyfl1count!='0'}">
      <c:forEach items="${Hyfl1List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl1count}">科技大楼</td>
	        </c:if>
	          <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	         <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
	     
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl1List}" var="mb" varStatus="sta">
	          <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	         <td></td>  
	         <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl2count!='0'}">
      <c:forEach items="${Hyfl2List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl2count}">A栋</td>
	        </c:if>
	          <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	         <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
      </c:forEach>
      <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl2List}" var="mb" varStatus="sta">
	          <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl3count!='0'}">
      <c:forEach items="${Hyfl3List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl3count}">B栋</td>
	        </c:if>
	          <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	       <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
      </c:forEach>
      <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl3List}" var="mb" varStatus="sta">
	          <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl4count!='0'}">
      <c:forEach items="${Hyfl4List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl4count}">C栋</td>
	        </c:if>
	        <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	         <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl4List}" var="mb" varStatus="sta">
	           <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl5count!='0'}">
      <c:forEach items="${Hyfl5List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl5count}">D栋</td>
	        </c:if>
	         <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	         <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
      </c:forEach>
   <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl5List}" var="mb" varStatus="sta">
	            <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl6count!='0'}">
      <c:forEach items="${Hyfl6List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl6count}">琶洲科技创意中心</td>
	        </c:if>
	        <td>${mb.Qymc}</td>
	         <td>${mb.Qyzj}</td>
	        <td>${mb.Glfwf}</td>
	        <td>${mb.Qysf}</td>
	        <td>${mb.Qydf}</td> 
	        <td>${mb.Zlbzj}</td>
	        <td>${mb.Zxyj}</td>  
	        <td>${mb.Sfqf=='1'?'已缴费':'未缴费'}</td>
	         <td><font color="red">${mb.Qfje}</font></td>
	      </tr>
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl6List}" var="mb" varStatus="sta">
	          <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
      </c:if>
     <tr>
	      <td colspan="2">合计：</td>
	      
	      <c:forEach items="${countHyfl8List}" var="mb" varStatus="sta">
	            <td>${mb.sumQyzj}</td>
	        <td>${mb.sumGlfwf}</td> 
	        <td>${mb.sumQysf}</td>
	        <td>${mb.sumQydf}</td>  
	        <td>${mb.sumZlbzj}</td>
	        <td>${mb.sumZxyj}</td>
	        <td></td>  
	        <td></td>  
      </c:forEach>
	      </tr>
	</tbody>
    </table>
  </div>
</div>
</div>
</body>
</html>
