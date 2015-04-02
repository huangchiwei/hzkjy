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
$("#fsfjjyb option[value='${fsfjjyb}']").attr("selected", true); 
$("#fzt option[value='${fzt}']").attr("selected", true); 
});
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

	function changeStatus(userNo,status){
		location.href='${ctx}/sys/sysUser/changeStatus.html?userNo=' + userNo + '&status=' + status;
	}

</script>
</head>

<body>
<div class="admin_table">
<div class="content_box">
  <div class="btn_box">

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/memberBasic/add/new.html'"/>
     
  </div>
  	
  <div class="list_info">
  <form id="search_form" action="${ctx}/admin/memberBasic/list/1.html" method="post">
    <h2>按条件查询</h2>
    <div class="div_input">
        <em>企业名称：</em><input type="text" id="fhymc" name="fhymc" value="${fhymc}"  class="input_a1" size="20" onfocus="loadCorpName();"/>
         <em>状态：</em>
   <select name="fzt"  id="fzt" style="text-align:center" class="input_a1">
         <option value="">所有</option>
          <option value="1">在园</option>
          <option value="0">出园</option>
        </select>
        							<em>经济月报：</em>
   <select name="fsfjjyb"  id="fsfjjyb" style="text-align:center" class="input_a1">
         <option value="">所有</option>
          <option value="1">需要</option>
          <option value="0">不需要</option>
        </select>
        <em>入驻时间：</em><input id="frysjf" name="frysjf" type="text" onclick="WdatePicker();" value="${frysjf}"
							 size="15"	 class="input_a1" maxlength="20"/><em>至</em>
								<input id="frysje" name="frysje" type="text" onclick="WdatePicker();" value="${frysje}"
								 size="15" class="input_a1" maxlength="20"/>
						</div>
     <div class="div_input">
        <em>合同期限：</em><input id="fhtqxf" name="fhtqxf" type="text" onclick="WdatePicker();" value="${fhtqxf}"
							 size="15" class="input_a1" maxlength="20"/> <em>至</em>
								<input id="fhtqxe" name="fhtqxe" type="text" onclick="WdatePicker();" value="${fhtqxe}"
								 size="15" class="input_a1" maxlength="20"/>
         <input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
         <input id="add_bt" type="button" value="清空" class="initial" onclick="clean();"/>
         <input id="add_bt" type="button" value="导入Excel" class="initial" style="cursor:hand" onclick="loadPageLayer('导入会员资料','${ctx}/admin/memberBasic/Find.html');"/>
         <input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/>
 
    </div>
    
    </form>
    
     <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  	     <th>序号</th>
	  		 <th>企业编号</th> 
	  		 <th>企业名称</th> 
	  	     <th>租用地址</th>
	         <th>入驻时间</th>
	  	     <th>合同期限</th>
	         <th>状态</th>
	         <th>联系人</th>
	         <th>联系电话</th> 
	         <th>经济月报</th> 
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
	      <tr ondblclick="javascript:location.href='${ctx}/admin/memberBasic/add/new.html?id=${mb.id}'">
	        <td>${sta.index + 1}</td>
	      	<td>${mb.hybh}</td>
	      	<td>${mb.qymc}</td>
	        <td>${mb.zydy}</td>  	
	        <td><fmt:formatDate value="${mb.qyrzsj}"
								pattern="yyyy-MM-dd" /></td>
	        <td><fmt:formatDate value="${mb.htqxf}"
								pattern="yyyy-MM-dd" />至<fmt:formatDate value="${mb.htqxe}"
								pattern="yyyy-MM-dd" /></td>
			<td>${mb.ztName}</td>					
	        <td>${mb.lxr}</td>
	        <td>${mb.lxrdh}</td>
	        <td>${mb.sfjjybName}</td>
	        <td>
	         	<c:if test="${mb_updt == true}">
		<div class="btn_icon">
<input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/memberBasic/add/new.html?id=${mb.id}'"/>
		 	</div>
	          	</c:if>
	          	<c:if test="${mb_del == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/del_icon.png" title="删除" onclick="delConfirm('${mb.id}');"/>
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
</div>
</body>
</html>
