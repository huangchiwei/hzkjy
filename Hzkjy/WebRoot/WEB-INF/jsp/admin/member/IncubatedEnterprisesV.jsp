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
				<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
	 $("#qyssjsly option[value='${model.qyssjsly}']").attr("selected", true); 
	 $("#gxjsqy option[value='${model.gxjsqy}']").attr("selected", true); 
	 $("#lxryqy option[value='${model.lxryqy}']").attr("selected", true); 
	formInitConfig("add_form",3000);
		
});


function loadSqsj(){

 hybh=$("#hybh").val();
 ssn=$("#ssn").val();
 if(hybh !="" && ssn!=""){
 $.ajax({
				url:'${ctx}/admin/incubatedEnterprises/getSqsj.html?hybh='+hybh+'&ssn='+ssn+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#zzjgdm").attr("value",data.zzjgdm);
		  		$("#frdb").attr("value",data.frdb);
		  		$("#zczb").attr("value",data.zczb);
		  		$("#qyclsj").attr("value",data.qyclsj);
		  		$("#lxr").attr("value",data.lxr);
		  		$("#qyrzsj").attr("value",data.qyrzsj);
		  		$("#lxrlxdh").attr("value",data.lxrlxdh);
		  		$("#qydjzclx").attr("value",data.qydjzclx);
		  		$("#frlxdh").attr("value",data.frlxdh);
		  		
		  		
		  		$("#htstze").attr("value",data.htstze);
		  		$("#dzys").attr("value",data.dzys);
		  		$("#xnyjdxs").attr("value",data.xnyjdxs);
		  		$("#qyssjsly").attr("value",data.qyssjsly);
		  		$("#hylb").attr("value",data.hylb);
		  		$("#gxjsqy").attr("value",data.gxjsqy);
		  		$("#lxryqy").attr("value",data.lxryqy);
		  		$("#fmzl").attr("value",data.fmzl);
		  		$("#wgsj").attr("value",data.wgsj);
		  		$("#syxx").attr("value",data.syxx);
		  		$("#rjzzq").attr("value",data.rjzzq);
		  		
		  	    
		  		
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
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
	$("#qymc").autocomplete(data,{
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

 var dwmc=""   
function loadQyxx(){

 dwmc=$("#qymc").val();
 if(dwmc !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+encodeURI(dwmc)+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  	    $("#hybh").attr("value",data.hybh);
		  		},
		  		error:function(){
		  		} 
		  		
		  	});
 }
} 
</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='<c:if test="${model == null}">${ctx}/admin/incubatedEnterprises/save.html</c:if><c:if test="${model != null}">${ctx}/admin/incubatedEnterprises/update/${model.id}.html</c:if>' method="post">

  <div class="add_info">

   <h2>企业基本情况</h2>
   <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
        <tr>
     <th>年份：</th>
       <td><input id="ssn" name="ssn" type="text" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'});" value="${model.ssn}"
							 class="input_a1" maxlength="20" onchange="loadSqsj();"/></td>
     <th colspan="3"></th>
    </tr>
    <tr>
     <th class="w100">企业名称:</th>
     <td>
     <input type="hidden" id="hybh" name="hybh" value="${model.hybh!=null && model.hybh!=''?model.hybh:mc.hybh}"/>
     	<input id="qymc" name="qymc" type="text" class="input_a1" value="${model.qymc!=null && model.qymc!=''?model.qymc:mc.qymc}" maxlength="100"  onfocus="loadCorpName();" onblur="loadQyxx();"/>
     </td>
     
     <th colspan="2">组织机构代码：</th>
     <td>
     	<input id="zzjgdm" name="zzjgdm" type="text" class="input_a1" value="${model.zzjgdm!=null && model.zzjgdm!=''?model.zzjgdm:mc.zzjgdm}" maxlength="20" />
     </td>
   </tr>
	    <tr>
	     <th>法人代表：</th>
	     <td>
	     <input id="frdb" name="frdb" type="text" class="input_a1" value="${model.frdb!=null && model.frdb!=''?model.frdb:mc.frdb}" maxlength="100"  />
	     </td>
	     <th colspan="2">注册资本：</th>
	     <td>
	     <input name="zczb"  id="zczb" type="text" class="input_a1" value="${model.zczb!=null && model.zczb!=''?model.zczb:mc.zczb}"/>
	     	</td>
	    </tr>
    <tr>
     <th>联系电话：</th>
     <td>
     	<input name="frlxdh"  id="frlxdh" type="text" class="input_a1" value="${model.frlxdh!=null && model.frlxdh!=''?model.frlxdh:mc.frlxdh}"/>
     </td>
     <th colspan="2">企业成立时间：</th>
     <td>
     <input id="qyclsj" name="qyclsj" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyclsj!=null && model.qyclsj!=''?model.qyclsj:mc.qyclsj}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
    </tr>
     <tr>
     <th>联系人：</th>
     <td>
		<input name="lxr"  id="lxr" type="text" class="input_a1" value="${model.lxr!=null && model.lxr!=''?model.lxr:mc.lxr}"/>
     </td>
     <th colspan="2">企业入驻时间：</th>
     <td>
     	<input id="qyrzsj" name="qyrzsj" type="text" onclick="WdatePicker();" value="<fmt:formatDate value="${model.qyrzsj!=null && model.qyrzsj!=''?model.qyrzsj:mc.qyrzsj}"
								pattern="yyyy-MM-dd" />" class="input_a1" maxlength="20"/>
     </td>
    </tr>
    
     <tr>
     <th>联系电话：</th>
     <td>
		<input name="lxrlxdh"  id="lxrlxdh" type="text" class="input_a1" value="${model.lxrlxdh!=null && model.lxrlxdh!=''?model.lxrlxdh:mc.lxrdh}"/>
     </td>
     <th colspan="2">企业登记注册类型：</th>
     <td>
     <input name="qydjzclx"  id="qydjzclx" type="text" class="input_a1" value="${model.qydjzclx!=null && model.qydjzclx!=''?model.qydjzclx:mc.qydjzclx}"/>
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
    <c:if test="${userNo!= '4401' && mb.shzt!='已审核'}">
					<input id="sumbit_bt" name="" type="submit" value="提  交"
						class="photo_btn" />
						</c:if>
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div>
  </form>
</div>

</body>
</html>