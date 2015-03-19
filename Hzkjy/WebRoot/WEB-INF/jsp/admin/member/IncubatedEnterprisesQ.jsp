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
	$("#search_form").attr("action","${ctx}/admin/incubatedEnterprises/list/1.html");
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
	$("#search_form").attr("action","${ctx}/admin/incubatedEnterprises/outPtqfqk/1.html");
	document.getElementById("search_form").submit();
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
		          location.href='${ctx}/admin/incubatedEnterprises/delete/' + id + '.html';
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

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/incubatedEnterprises/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div2">
      <dl class="relative h30">
        <dd > 
        &nbsp;&nbsp;&nbsp;&nbsp;企业名称：<input type="text" id="fqymc" name="fqymc" value="${fqymc}" size=40 style="width:160px"/>
        	</dd>
        		 <dd > 
        &nbsp;&nbsp;&nbsp;&nbsp;年份：<input id="fssn" name="fssn" type="text" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'});" value="${fssn}"
								 class="input_a1" maxlength="20"/>
								</dd>
								 <dt><input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/></dt>
         <dt><input id="add_bt" type="button" value="清空" class="initial" onclick="clean();"/></dt>
           <dt><input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/></dt>
    </dl>
    </div>
    
    </form>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
	  <thead>
	  	<tr>
	  	<th>序号</th>
	  	 <th>企业名称</th> 
	        <th>组织机构代码</th>
	        <th>企业成立时间</th>
	        <th>企业入驻时间</th>
	        <th>企业所属技术领域</th>
	        <th>法人代表</th>
	        <th>年份</th>
	        <th width="6%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="mb_save">
	       	<c:set var="mb_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="mb_updt">
	       	<c:set var="mb_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="mb_del">
	       	<c:set var="mb_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr ondblclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html?id=${mb.id}'">
	           	<td>${sta.index + 1}</td>
	           	<td>${mb.qymc}</td>
	        <td>${mb.zzjgdm}</td>
	        <td><fmt:formatDate value="${mb.qyclsj}"
								pattern="yyyy-MM-dd" /></td>
	        <td><fmt:formatDate value="${mb.qyrzsj}"
								pattern="yyyy-MM-dd" /></td>
	        <td> 
	        <c:if test="${mb.qyssjsly==1}">生物/医药技术业 </c:if> 
	        <c:if test="${mb.qyssjsly==2}">电子与信息业 </c:if> 
	        <c:if test="${mb.qyssjsly==3}">新材料技术/新材料业 </c:if> 
	        <c:if test="${mb.qyssjsly==4}">展览服务 </c:if> 
	        <c:if test="${mb.qyssjsly==5}">其他 </c:if> 
	        <c:if test="${mb.qyssjsly==6}">工业</c:if> 
	         </td>
	        <td>${mb.ztName}</td>
	        <td>
	          	<c:if test="${mb_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html?id=${mb.id}'"/>
		          	</div>
	          	</c:if>
	          	<c:if test="${mb_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${mb.id}')"/>
		         	</div>
	         	</c:if>
	         </td>
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
</body>
</html>