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
	$("#search_form").attr("action","${ctx}/admin/eccIndicator/list/1.html");
	document.getElementById("search_form").submit();
    }   
   function out(){    
	$("#search_form").attr("action","${ctx}/admin/eccIndicator/outPtqfqk/1.html");
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
	    <td colspan="16" align="left"> <font color="red">广州市海珠区科技产业基地入驻企业经济指标月报表</font></td><td align="left">  <font color="red">资料保密</font></td>
	   </tr>
	    <tr>
	    <td colspan="16" align="left">单位名称（公章）：广州市海珠科技产业园有限公司</td><td align="left">  单位：万元</td>
	   </tr>
	  	<tr >
	  	<td rowspan="3">行业分类</td>
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
	        <td rowspan="${Hyfl1count}">生物/医药技术业</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
	     
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl1List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl2count!='0'}">
      <c:forEach items="${Hyfl2List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl2count}">电子与信息业</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
      <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl2List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl3count!='0'}">
      <c:forEach items="${Hyfl3List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl3count}">新材料技术/新材料业</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
      <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl3List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl4count!='0'}">
      <c:forEach items="${Hyfl4List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl4count}">展览服务</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl4List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl5count!='0'}">
      <c:forEach items="${Hyfl5List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl5count}">其他</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
   <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl5List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
       <c:if test="${Hyfl6count!='0'}">
      <c:forEach items="${Hyfl6List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl6count}">工业</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl6List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
      <c:if test="${Hyfl7count!='0'}">
      <c:forEach items="${Hyfl7List}" var="mb" varStatus="sta">
	      <tr>
	           
	       <c:if test="${sta.index=='0'}">
	        <td rowspan="${Hyfl7count}">出园企业</td>
	        </c:if>
	        <td>${mb.Rzqy}</td>
	        <td>${mb.Zczj}</td>
	        <td>${mb.JgmzsrBys}</td> 
	        <td>${mb.JgmzsrLjs}</td>
	        <td>${mb.LrzeBys}</td>  
	        <td>${mb.LrzeLjs}</td>
	        <td>${mb.NsBys}</td>    
	        <td>${mb.NsLjs}</td>
	        <td>${mb.LszeBys}</td>    
	        <td>${mb.LszeLjs}</td>     
	         <td>${mb.Ch}</td>
	         <td>${mb.Zgs}</td>
	         <td>${mb.Yfjf}</td>
	         <td>${mb.Gxjscpsr}</td>
	         <td>${mb.Gyzcz}</td>
	         <td>${mb.Gyzjz}</td>
	      </tr>
      </c:forEach>
       <tr>
	      <td colspan="2">小计</td>
	      
	      <c:forEach items="${countHyfl7List}" var="mb" varStatus="sta">
	          <td>${mb.sumZczj }</td>
	        <td>${mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh}</td>
	         <td>${mb.sumZgs}</td>
	         <td>${mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz}</td>
      </c:forEach>
	      </tr>
      </c:if>
      <tr>
	      <td colspan="2">琶洲园区合计：</td>
	      
	      <c:forEach items="${countHyfl8List}" var="mb" varStatus="sta">
	      <c:forEach items="${countHyfl7List}" var="mc" varStatus="stb">
	      
	          <td>${mb.sumZczj+mc.sumZczj}</td>
	        <td>${mb.sumJgmzsrBys+mb.sumJgmzsrBys}</td> 
	        <td>${mb.sumJgmzsrLjs+mb.sumJgmzsrLjs}</td>
	        <td>${mb.sumLrzeBys+mb.sumLrzeBys}</td>  
	        <td>${mb.sumLrzeLjs+mb.sumLrzeLjs}</td>
	        <td>${mb.sumNsBys+mb.sumNsBys}</td>    
	        <td>${mb.sumNsLjs+mb.sumNsLjs}</td>
	        <td>${mb.sumLszeBys+mb.sumLszeBys}</td>    
	        <td>${mb.sumLszeLjs+mb.sumLszeLjs}</td>     
	         <td>${mb.sumCh+mb.sumCh}</td>
	         <td>${mb.sumZgs+mb.sumZgs}</td>
	         <td>${mb.sumYfjf+mb.sumYfjf}</td>
	         <td>${mb.sumGxjscpsr+mb.sumGxjscpsr}</td>
	         <td>${mb.sumGyzcz+mb.sumGyzcz}</td>
	         <td>${mb.sumGyzjz+mb.sumGyzjz}</td>
      </c:forEach>
       </c:forEach>
	      </tr>
	</tbody>
    </table>
  </div>
</div>
</div>
</body>
</html>
