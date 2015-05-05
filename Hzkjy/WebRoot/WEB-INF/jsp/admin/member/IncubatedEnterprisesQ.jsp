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

function pass(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要审核的 孵化企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/incubatedEnterprises/pass.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("审核成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pass2(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要审核的 孵化企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/incubatedEnterprises/spass.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("审核成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
	document.getElementById("search_form").submit();
}
function pass3(){
	var stuInput = $('input[name="qyId"]:checked');
	var ids = '';
	$.each(stuInput,function(i,item){
		ids += item.value + ",";
	});
	if(ids == ''){
		alert('请选择要审核的 孵化企业。');
		return;
	}
	$.ajax({
				url:'${ctx}/admin/incubatedEnterprises/sspass.html?ids='+ids+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("不通过成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
	document.getElementById("search_form").submit();
}
function find(){    
	$("#search_form").attr("action","${ctx}/admin/incubatedEnterprises/list/1.html");
	document.getElementById("search_form").submit();
    }   
    function clean(){    
	$("#fqymc").val("");
	$("#fssn").val("");
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
<div class="admin_table">
<div class="content_box">
  <div class="btn_box">

  		<input id="add_bt" type="button" value="添加" class="initial" onclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html'"/>
     
  </div>
  <div class="list_info">
  	<form id="search_form" action="${ctx}/admin/incubatedEnterprises/list/1.html" method="post">
    <h2>按条件查询</h2>
      <div class="div_input">
        <em>企业名称：</em><input type="text" id="fqymc" name="fqymc" value="${fqymc}" class="input_a1" size=20 />
        
        <em>年份：</em><input id="fssn" name="fssn" type="text" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'});" size=15  value="${fssn}"
								 class="input_a1" maxlength="20"/>
							<input id="add_bt" type="button" value="查询" class="initial" onclick="find();"/>
         <input id="add_bt" type="button" value="清空" class="initial" onclick="clean();"/>
           <input id="add_bt" type="button" value="导出Excel" class="initial" onclick="out();"/>
            <input id="" type="button" value="批量审核" class="initial" onclick="pass()"/>
            <input id="" type="button" value="批量二审" class="initial" onclick="pass2()"/>
            <input id="" type="button" value="二审不通过" class="initial" onclick="pass3()"/>
    </div>
    
    </form>
     <table width="98%" border="0" cellpadding="0" cellspacing="1">
	  <thead>
	  	<tr>
	  		<th  width="5%"><input type="checkbox" id="checkAll"/>全选</th>
	  	<th>序号</th>
	  	 <th>企业名称</th> 
	        <th>组织机构代码</th>
	        <th>企业成立时间</th>
	        <th>企业入驻时间</th>
	        <th>企业所属技术领域</th>
	        <th>法人代表</th>
	        <th>年份</th>
	        <th>审核状态</th>
	        <th>二审状态</th>
	        <th width="8%">操作</th>
	  	</tr>
	  </thead>
	  <tbody>
	  <!-- 变量 -->
	  <pm:hasPermission permValue="fhqytb_save">
	       	<c:set var="fhqytb_save" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="fhqytb_updt">
	       	<c:set var="fhqytb_updt" value="true"/>
	    </pm:hasPermission>
	    <pm:hasPermission permValue="fhqytb_del">
	       	<c:set var="fhqytb_del" value="true"/>
	    </pm:hasPermission>
      <c:forEach items="${list}" var="mb" varStatus="sta">
	      <tr ondblclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html?id=${mb.id}'">
	      <td><input type="checkbox" value="${mb.id}" name="qyId"/></td>  
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
	        <td>${mb.frdb}</td>
	        <td>${mb.ssn}</td>
	        <td>${mb.shzt}</td>
	         <td>${mb.sshzt}</td>
	        <td>
	       <c:if test="${userNo!= '4401' || mb.sshzt!='已审核'}">
	         <c:if test="${fhqytb_updt == true}">
		          	<div class="btn_icon">
		          	 <input type="image" src="${ctx}/theme/default/images/edit_icon.png" title="修改" onclick="javascript:location.href='${ctx}/admin/incubatedEnterprises/add/new.html?id=${mb.id}'"/>
		          	</div>
	          	</c:if>
	          	 </c:if>
	          	<c:if test="${fhqytb_del == true}">
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
      <td><c:if test="${not empty zj}">${zj }</c:if><c:if test="${empty zj}">0</c:if>家</td>
    
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
  </div>
</body>
</html>
