<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/adminthemes/css/style.css" type="text/css"
			rel="stylesheet" />
		<link href="${ctx}/adminthemes/default/css/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/adminthemes/default/css/default.css"
			rel="stylesheet" type="text/css" />
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
	autoValidate();
		
});

</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/memberBasic/save.html</c:if><c:if test="${model != null}">${ctx}/admin/memberBasic/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>新增园区企业信息</h2>
    <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
    <tr>
     <th class="w100">企业名称:</th>
     <td>
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}" class="input_a1" maxlength="100" style="width:160px"  />
     </td>
     
     <th colspan="2">会员编号：</th>
     <td>
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" class="input_a1" maxlength="20" readonly="true" />
     </td>
    
     
    </tr>
	    <tr>
	     <th>网址：</th>
     <td>
    	<input id="address" name="address" type="text" value="${model.address}" class="input_a1" maxlength="100" style="width:160px"  />
     </td>
	     <th colspan="2">租用地址：</th>
	     <td>
	     <input id="zydy" name="zydy" type="text" value="${model.zydy}" class="input_a1" maxlength="100" style="width:160px"  />
	     </td>
	  
	    </tr>
	    <tr>
	       <th>面积：</th>
	     <td>
	     <input name="mj"  id="mj" type="text" class="input_a1" value="${model.mj}"/>平方
	     	</td>
	     	<th colspan="2">注册资本：</th>
     <td>
     	<input name="zczb"  id="zczb" type="text" class="input_a1" value="${model.zczb}"/>万
     </td>
    
 
	    </tr>
	    <tr>
	        <th>法人代表：</th>
	   	 <td>
	   	 	<input name="frdb"  id="frdb" type="text" class="input_a1" value="${model.frdb}"/>
	   	 </td>
     <th colspan="2">联系电话：</th>
     <td>
     	<input name="frlxdh"  id="frlxdh" type="text" class="input_a1" value="${model.frlxdh}"/>
     </td>
     
    </tr>
     <tr>
	        <th>联系人：</th>
	   	 <td>
	   	 	<input name="lxr"  id="lxr" type="text" class="input_a1" value="${model.lxr}"/>
	   	 </td>
     <th colspan="2">联系电话：</th>
     <td>
     	<input name="lxrdh"  id="lxrdh" type="text" class="input_a1" value="${model.lxrdh}"/>
     </td>
     
    </tr>
     <tr>
     <th>在园出园状态：</th>
     <td>
     	 <select name="zt"  id="zt" style="text-align:center">
          <option value="1">在园</option>
          <option value="0">出园</option>
        </select>
     </td>
     <th colspan="2">企业入驻时间：</th>
     <td>
     	<input id="qyrzsj" name="qyrzsj" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyrzsj}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
    
    </tr>
    <tr>
     <th>合同期限：</th>
     <td>
     	<input id="htqxf" name="htqxf" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxf}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
     <th colspan="2">至</th>
     <td>
     		<input id="htqxe" name="htqxe" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.htqxe}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
    </tr>
    <tr>
    <th>企业登记注册类型：</th>
     <td>
     <input name="qydjzclx"  id="qydjzclx" type="text" class="input_a1" value="${model.qydjzclx}"/>
     </td>
    <th colspan="2">是否需填经济月报：</th>
     <td>
     	 <select name="sfjjyb"  id="sfjjyb" style="text-align:center">
          <option value="1">需要</option>
          <option value="0">不需要</option>
        </select>
     </td>
        </tr>
      <tr>
	        <th>组织机构代码：</th>
	   	 <td>
	   	 	<input name="zzjgdm"  id="zzjgdm" type="text" class="input_a1" value="${model.zzjgdm}"/>
	   	 </td>
     <th colspan="2">企业成立时间：</th>
     <td>
     	<input id="qyclsj" name="qyclsj" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyclsj}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
     
    </tr>  
     <tr>
     <th rowspan="2">获天使或风险投资额（千元）：</th>
     <td rowspan="2">
		<input name="htstze"  id="htstze" type="text" class="input_a1" value="${model.htstze}"/>
     </td>
     <th rowspan="2">在孵企业从业人员：</th>
      <th>大专以上（人）：</th>
     <td>
     <input name="dzys"  id="dzys" type="text" class="input_a1" value="${model.dzys}"/>
     </td>
    </tr>
       <tr>
      <th>吸纳应届大学毕业生（人）：</th>
     <td>
     <input name="xnyjdxs"  id="xnyjdxs" type="text" class="input_a1" value="${model.xnyjdxs}"/>
     </td>
    </tr>
    
    <tr>
     <th>企业所属技术领域：</th>
      <td>
     	 <select name="qyssjsly"  id="qyssjsly" style="text-align:center">
          <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>
     </td>
     <th colspan="2">行业类别：</th>
     <td>
	     <input name="hylb"  id="hylb" type="text" class="input_a1" value="${model.hylb}"/>
	     	</td>
    </tr>
    
    
    
    <tr>
     <th>高新技术企业：</th>
      <td>
     	 <select name="gxjsqy"  id="gxjsqy" style="text-align:center">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
     </td>
     <th colspan="2">留学人员企业：</th>
     <td>
     	 <select name="lxryqy"  id="lxryqy" style="text-align:center">
          <option value="0">否</option>
          <option value="1">是</option>
         </select>
     </td>
    </tr>
     <tr>
     <th colspan="2">到上一年为止拥有有效知识产权数（件）：其中：</th>
     <th colspan="3"></th>
    </tr>
     <tr>
	     <th>发明专利（件）：</th>
	     <td>
	     <input id="fmzl" name="fmzl" type="text" value="${model.fmzl}" maxlength="100" style="width:160px"  />
	     </td>
	     <th colspan="2">外观设计（个）：</th>
	     <td>
	     <input name="wgsj"  id="wgsj" type="text" class="input_a1" value="${model.wgsj}"/>
	     	</td>
	    </tr>
	    
	     <tr>
	     <th>实用新型（件）：</th>
	     <td>
	     <input id="syxx" name="syxx" type="text" value="${model.syxx}" maxlength="100" style="width:160px"  />
	     </td>
	     <th colspan="2">软件著作权（个）：</th>
	     <td>
	     <input name="rjzzq"  id="rjzzq" type="text" class="input_a1" value="${model.rjzzq}"/>
	     	</td>
	    </tr>
   </table>
     
   
       <div class="div_submit">
					<input id="sumbit_bt" name="" type="submit" value="审核"
						class="photo_btn" />
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div>
  </form>
</div>

</body>
</html>