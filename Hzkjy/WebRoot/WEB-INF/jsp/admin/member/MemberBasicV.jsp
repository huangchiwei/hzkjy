<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/adminthemes/css/style.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="../../theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="../../theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.select.js" charset="GBK"></script>
<script src="${ctx}/js/formValidator/jquery-1.4.4.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/js/formValidator/style/validatorTidyMode.css" />
<script src="${ctx}/js/formValidator/formValidator-4.0.1.js" type="text/javascript"></script>
<script src="${ctx}/js/formValidator/formValidatorRegex.js" type="text/javascript"></script> 
<script language="javascript" src="${ctx}/js/jsp/member/MemberBasicV.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="${ctx }/ckfinder/ckfinder.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	 $("#zt option[value='${model.zt}']").attr("selected", true); 
	 $("#qyssjsly option[value='${model.qyssjsly}']").attr("selected", true); 
	 $("#sfjjyb option[value='${model.sfjjyb}']").attr("selected", true); 
	 $("#gxjsqy option[value='${model.gxjsqy}']").attr("selected", true); 
	 $("#lxryqy option[value='${model.lxryqy}']").attr("selected", true); 
	formInitConfig("add_form",3000);
	loadNd();
});


function loadNd(){

 hybh=$("#hybh").val();
 nd=$("#nd").val();
 if(nd !="" && hybh !=""){
 $.ajax({
				url:'${ctx}/admin/memberBasic/getNd.html?hybh='+hybh+'&nd='+nd+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#fmzl").attr("value",data.fmzl);
		  		$("#syxx").attr("value",data.syxx);
		  		$("#wgsj").attr("value",data.wgsj);
		  		$("#rjzzq").attr("value",data.rjzzq);
		  		$("#htstze").attr("value",data.htstze);
		  		$("#dzys").attr("value",data.dzys);
		  		$("#xnyjdxs").attr("value",data.xnyjdxs);
		  		$("#qymc").attr("value",data.qymc);
		  		$("#zczb").attr("value",data.zczb);
		  		$("#frdb").attr("value",data.frdb);
		  		$("#frlxdh").attr("value",data.frlxdh);
		  		$("#lxr").attr("value",data.lxr);
		  		$("#lxrdh").attr("value",data.lxrdh);
		  		$("#qyrzsj").attr("value",data.qyrzsj);
		  			
		  },
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 

function shbtg(){
	var id = '${model.id}';
	$.ajax({
				url:'${ctx}/admin/memberBasic/Shbtg.html?id='+id+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		if(data.exl=="ok"){
		  		alert("邮件发送成功");
		  		}
		  		},
		  		error:function(){
		  		} 
		  	});
}
</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/memberBasic/save.html</c:if><c:if test="${model != null}">${ctx}/admin/memberBasic/update/${model.id}.html</c:if>' method="post">
<div class="content_box">
  <div class="add_info">
   <h2>新增园区企业信息&nbsp;<input name="nd" type="text"  id="nd" onchange="loadNd();"  onclick="WdatePicker({dateFmt:'yyyy'});" <c:if test="${not empty nd}">value="${nd}"</c:if> <c:if test="${empty nd}">value="${year}"</c:if> size="5" class="input"/>
     &nbsp;<em>年</em></h2> 
    <table width="100%" border="0" cellpadding="0" cellspacing="1"
					class="ListTable" id="questTable">
    <tr>
     <th width="20%">企业名称：</th>
     <td>
     	<input name="qymc" type="text" class="input_a1" id="qymc" value="${model.qymc}" size="15" maxlength="100"  />     </td>
     
     <th colspan="2">会员编号：</th>
     <td>
     	<input name="hybh" type="text" class="input_a1" id="hybh" value="${model.hybh}" size="15" maxlength="20" readonly="true" />     </td>
    </tr>
	    <tr>
	     <th>网址：</th>
     <td>
    	<input name="address" type="text" class="input_a1" id="address" value="${model.address}" size="15" maxlength="100"  />     </td>
	     <th colspan="2">租用地址：</th>
	     <td>
	     <input name="zydy" type="text" class="input_a1" id="zydy" value="${model.zydy}" size="15" maxlength="100"  />	     </td>
	    </tr>
	    <tr>
	       <th>面积：</th>
	     <td>
	     <input name="mj" type="text" class="input_a1"  id="mj" value="${model.mj}" size="15"/>&nbsp;<em>平方</em></td>
	     <th colspan="2">注册资本：</th>
     <td>
     	<input name="zczb" type="text" class="input_a1"  id="zczb" value="${model.zczb}" size="15"/>&nbsp;<em>万</em></td> 
	    </tr>
	    <tr> 
	        <th>法人代表：</th>
	   	 <td>
	   	 	<input name="frdb" type="text" class="input_a1"  id="frdb" value="${model.frdb}" size="15"/>	   	 </td>
     <th colspan="2">联系电话：</th>
     <td>
     	<input name="frlxdh" type="text" class="input_a1"  id="frlxdh" value="${model.frlxdh}" size="15"/>     </td>
    </tr>
     <tr>
	        <th>联系人：</th>
	   	 <td>
	   	 	<input name="lxr" type="text" class="input_a1"  id="lxr" value="${model.lxr}" size="15"/>	   	 </td>
     <th colspan="2">联系电话：</th>
     <td>
     	<input name="lxrdh" type="text" class="input_a1"  id="lxrdh" value="${model.lxrdh}" size="15"/>     </td>
    </tr>
     <tr>
     <th>在园出园状态：</th>
     <td>
     	 <select name="zt"  id="zt" class="input">
          <option value="1">在园</option>
          <option value="0">出园</option>
        </select>     </td>
     <th colspan="2">企业入驻时间：</th>
     <td>
     	<input name="qyrzsj" type="text" id="qyrzsj" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyrzsj}" 
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>     </td>
    </tr>
    <tr>
     <th>合同期限：</th>
     <td>
     	<input name="htqxf" type="text" id="htqxf" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxf}" 
								pattern="yyyy-MM-dd" />
" class="input_a1" maxlength="20"/> </td>
     <th colspan="2">至</th>
     <td>
     		<input name="htqxe" type="text" id="htqxe" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxe}" 
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>     </td>
    </tr>
    <tr>
    <th>企业登记注册类型：</th>
     <td>
     <input name="qydjzclx" type="text" class="input_a1"  id="qydjzclx" value="${model.qydjzclx}" size="18"/>     </td>
    <th colspan="2">是否需填经济月报：</th>
     <td>
     	 <select name="sfjjyb"  id="sfjjyb" class="input">
          <option value="1">需要</option>
          <option value="0">不需要</option>
        </select>     </td>
        </tr>
      <tr>
	        <th>组织机构代码：</th>
	   	 <td>
	   	 	<input name="zzjgdm" type="text" class="input_a1"  id="zzjgdm" value="${model.zzjgdm}" size="15"/>	   	 </td>
     <th colspan="2">企业成立时间：</th>
     <td>
     	<input name="qyclsj" type="text" id="qyclsj" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyclsj}" 
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>     </td>
    </tr>  
     <tr>
     <th rowspan="2">获天使或风险投资额（千元）：</th>
     <td rowspan="2">
		<input name="htstze" type="text" class="input_a1"  id="htstze" value="${model.htstze}" size="15"/>     </td>
     <th width="15%" rowspan="2">在孵企业从业人员：</th>
      <th>大专以上（人）：</th> 
     <td>
     <input name="dzys" type="text" class="input_a1"  id="dzys" value="${model.dzys}" size="15"/>     </td>
    </tr>
       <tr>
      <th width="18%">吸纳应届大学毕业生（人）：</th>
     <td>
     <input name="xnyjdxs" type="text" class="input_a1"  id="xnyjdxs" value="${model.xnyjdxs}" size="15"/>     </td>
    </tr>
    
    <tr>
     <th>企业所属技术领域：</th>
      <td>
     	 <select name="qyssjsly"  id="qyssjsly" class="input">
          <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>     </td>
     <th colspan="2">行业类别：</th>
     <td>
	     <input name="hylb" type="text" class="input_a1"  id="hylb" value="${model.hylb}" size="15"/>	     	</td>
    </tr>
    
    
    
    <tr>
     <th>高新技术企业：</th>
      <td>
     	 <select name="gxjsqy"  id="gxjsqy" class="input">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>     </td>
     <th colspan="2">留学人员企业：</th>
     <td>
     	 <select name="lxryqy"  id="lxryqy" class="input">
          <option value="0">否</option>
          <option value="1">是</option>
         </select>     </td>
    </tr>
     <tr>
     <th colspan="5"><div align="center">到上一年为止拥有有效知识产权数（件）：其中：</div></th>
     </tr>
     <tr>
	     <th>发明专利（件）：</th>
	     <td>
	     <input name="fmzl" type="text" id="fmzl" value="${model.fmzl}" size="15" maxlength="100"  />	     </td>
	     <th colspan="2">外观设计（个）：</th>
	     <td>
	     <input name="wgsj" type="text" class="input_a1"  id="wgsj" value="${model.wgsj}" size="15"/></td>
	    </tr>
	     
	     <tr>
	     <th>实用新型（件）：</th>
	     <td>
	     <input name="syxx" type="text" id="syxx" value="${model.syxx}" size="15" maxlength="100"  /></td>
	     <th colspan="2">软件著作权（个）：</th>
	     <td>
	     <input name="rjzzq" type="text" class="input_a1"  id="rjzzq" value="${model.rjzzq}" size="15"/></td>
	    </tr>
   </table>
     
   
<div class="div_submit">
					<input id="sumbit_bt" name="" type="submit" value="审核"
						class="photo_btn" />
						<input type="reset" value="审核不通过" onclick="shbtg();"
						class="photo_btn" />
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div></div>
  </form>
</div>

</body>
</html>