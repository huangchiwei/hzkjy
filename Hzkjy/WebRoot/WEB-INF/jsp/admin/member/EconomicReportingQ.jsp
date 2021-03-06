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
	document.forms[0].action="${ctx}/admin/chooseSelect/printHuiZhiList.html?ids=" + ids + "&random="+Math.random();
	  document.forms[0].submit();
}

function find(){    
	$("#search_form").attr("action","${ctx}/admin/economicReporting/list/1.html");
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
	$("#fqymc").autocomplete(data,{
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
		          location.href='${ctx}/admin/economicReporting/delete/' + id + '.html';
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


function pZShtg(){
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
				url:'${ctx}/admin/economicReporting/ZShtg.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pZShth(){
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
				url:'${ctx}/admin/economicReporting/ZShth.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pZShtt(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要提交的企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/economicReporting/ZShtt.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pltgtz(){
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
				url:'${ctx}/admin/economicReporting/Tgtz.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}
function plbtgtz(){
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
				url:'${ctx}/admin/economicReporting/Btgtz.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		
		  	});
	document.getElementById("search_form").submit();
}

	function plsc(){
	var stuInput = $("input[name=qyId]:checked");
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要删除的企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/economicReporting/Plsc.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("删除成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  	});
		  	document.getElementById("search_form").submit();
}
</script>
</head>

<body>
<div class="admin_table">
<div class="content_box">
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/economicReporting/list/1.html" method="post">
    <pm:hasPermission permValue="jjybtb_sh">
	       	<c:set var="jjybtb_sh" value="true"/>
	    </pm:hasPermission>
	<pm:hasPermission permValue="jjybtb_th">
	       	<c:set var="jjybtb_th" value="true"/>
	    </pm:hasPermission>    
	    <pm:hasPermission permValue="jjybtb_tg">
	       	<c:set var="jjybtb_tg" value="true"/>
	    </pm:hasPermission>    
	    <pm:hasPermission permValue="jjybtb_btg">
	       	<c:set var="jjybtb_btg" value="true"/>
	    </pm:hasPermission>  
	    
    
    <h2>按条件查询</h2>
      <div class="div_input">
         <em>经济指标年月：</em> <input id="fjjzbNy" name="fjjzbNy" size="15"  class="input_a1" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})" type="text" 
     	value="${fjjzbNy}" maxlength="20"/>
        <em>企业名称：</em><input name="fqymc" type="text"  class="input_a1" id="fqymc"  onfocus="loadCorpName();"  value="${fqymc}" size="30"  maxlength="100" />
         <input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
          <!-- <input id="" type="button" value="批量提交" class="initial" onclick="pZShtt();"/> -->
           <c:if test="${jjybtb_th == true}">
          <input id="" type="button" value="批量退回" class="initial" onclick="pZShth();"/>
          </c:if>
          <input id="" type="button" value="批量打印" class="initial" onclick="printHuiZhiList()"/>
          <c:if test="${jjybtb_tg == true}">
           <input id="add_bt" type="button" value="批量删除" class="initial" onclick="plsc()"/>
             <input id="" type="button" value="批量审核" class="initial" onclick="pZShtg();"/>
          <input id="" type="button" value="通过发送" class="initial" onclick="pltgtz()"/>
          </c:if>
          <c:if test="${jjybtb_btg == true}">
           <input id="" type="button" value="不通过发送" class="initial" onclick="plbtgtz()"/>
          </c:if>
 
    </div>
    </form>
       <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  	<th><input type="checkbox" id="checkAll"/>全选</th>
	  	 <th>会员分类</th> 
	  	 <th>序号</th> 
	        <th>入园企业</th>
	        <th>注册资金</th>
	        <th>技工贸总收入本月数</th>
	        <th>技工贸总收入累计数</th>
	        <th>利润总额本月数</th>
	        <th>利润总额累计数</th>
	        <th>经济指标年月</th>
	        <th>状态</th>
	        <th width="8%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="jjybtb_save">
	       	<c:set var="jjybtb_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="jjybtb_updt">
	       	<c:set var="jjybtb_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="jjybtb_del">
	       	<c:set var="jjybtb_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr ondblclick="javascript:location.href='${ctx}/admin/economicReporting/add/new.html?id=${mb.id}'">
	        <td>
	        <c:if test="${userNo!='4401' || mb.shzt=='已审核'}">
	        <input type="checkbox" value="${mb.id}" name="qyId"/>
	        </c:if>
	        </td>   
	        <td>
	        <c:if test="${mb.hyfl=='1'}">生物/医药技术业</c:if>
	        <c:if test="${mb.hyfl=='2'}">电子与信息业</c:if>
	        <c:if test="${mb.hyfl=='3'}">新材料技术/新材料业</c:if>
	        <c:if test="${mb.hyfl=='4'}">展览服务</c:if>
	        <c:if test="${mb.hyfl=='5'}">其他</c:if>
	        <c:if test="${mb.hyfl=='6'}">工业</c:if></td>
	        <td>${sta.index + 1}</td>
	        <td>${mb.rzqy}</td>
	        <td>${mb.zczj}</td>
	        <td>${mb.jgmzsrBys}</td> 
	        <td>${mb.jgmzsrLjs}</td>
	        <td>${mb.lrzeBys}</td>  
	        <td>${mb.lrzeLjs}</td>
	         <td>${mb.jjzbNy}</td>
	          <td>${mb.shzt}</td>
	          <td>
	          	<c:if test="${jjybtb_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="填报" onclick="javascript:location.href='${ctx}/admin/economicReporting/add/new.html?id=${mb.id}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${jjybtb_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${mb.id}')"/>
		         	</div>
	         	</c:if>
	         </td>
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
</div>
</body>
</html>
