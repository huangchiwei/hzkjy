<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/font.css" rel="stylesheet" type="text/css" />
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
	formInitConfig("add_form",3000);
	autoValidate();
		
});

</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:history.back(-1);"/>
   </div>
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/memberBasic/save.html</c:if><c:if test="${model != null}">${ctx}/admin/memberBasic/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>新增园区企业信息</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">企业名称:</th>
     <td>
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}" maxlength="100" style="width:160px"  />
     </td>
     
     <th>会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" maxlength="20" readonly="true" />
     </td>
     <th>地址：</th>
     <td>
    	<input id="address" name="address" type="text" value="${model.address}" maxlength="100" style="width:160px"  />
     </td>
     
    </tr>
	    <tr>
	     <th>租用单元：</th>
	     <td>
	     <input id="zydy" name="zydy" type="text" value="${model.zydy}" maxlength="100" style="width:160px"  />
	     </td>
	     <th>面积：</th>
	     <td>
	     <input name="mj"  id="mj" type="text" class="input_a1" value="${model.mj}"/>平方
	     	</td>
	     <th>负责人：</th>
	   	 <td>
	   	 	<input name="fzr"  id="fzr" type="text" class="input_a1" value="${model.fzr}"/>
	   	 </td>
	    </tr>
    <tr>
     <th>注册资金：</th>
     <td>
     	<input name="zczj"  id="zczj" type="text" class="input_a1" value="${model.zczj}"/>万
     </td>
     <th>联系人：</th>
     <td>
     	<input name="lxr"  id="lxr" type="text" class="input_a1" value="${model.lxr}"/>
     </td>
     <th>在园出园状态：</th>
     <td>
     	 <select name="zt"  id="zt" style="text-align:center">
          <option value="1">在园</option>
          <option value="0">出园</option>
        </select>
     </td>
    </tr>
     <tr>
     <th>入园时间：</th>
     <td>
     	<input id="rysj" name="rysj" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.rysj}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
     <th>合同期限：</th>
     <td>
     	<input id="htqxf" name="htqxf" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxf}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
     <th>至</th>
     <td>
     		<input id="htqxe" name="htqxe" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxe}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
    </tr>
   </table>
     
   
    
    	<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
  
  </div>
  </form>
</div>

</body>
</html>