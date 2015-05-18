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
$("#sslqname option[value='${model.sslq}']").attr("selected", true); 
var userNo="${userNo}";
if(userNo=="4401"){
$("#texta").attr("disabled",true);
}
if(userNo=="cwry"){

}else{
 $("#addinfo1").hide();
}
	formInitConfig("add_form",3000);
	autoValidate();
	
		
});

    
  var dwmc=""   
function loadQyxx(){

 dwmc=$("#qymc").val();
 if(dwmc !=""){
 $.ajax({
				url:'${ctx}/admin/memberRental/getQyxx.html?qymc='+dwmc+'&random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  		$("#qymj").attr("value",data.mj);
		  	    $("#hybh").attr("value",data.hybh);
		  	    $("#zydy").attr("value",data.zydy);
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
function zcsave(){
var id = '${model.id}';
    document.forms[0].action = '${ctx}/admin/enterpriseRental/zsave.html?id='+id;
    document.forms[0].submit();
}

</script>


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" enctype="multipart/form-data" action='<c:if test="${model == null}">${ctx}/admin/enterpriseRental/save.html</c:if><c:if test="${model != null}">${ctx}/admin/enterpriseRental/update/${model.id}.html</c:if>' method="post">
 <pm:hasPermission permValue="qyzjlr_updt">
	       	<c:set var="qyzjlr_updt" value="true"/>
	    </pm:hasPermission>
  <div class="add_info" id="addinfo">
 <h2>新增缴费通知单</h2>
    <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
	<tr align="center">
     <th>房号:</th>
     <td colspan="3">
     <input id="fbzt" name="fbzt" type="hidden" value="${model.fbzt}"/>
     	<input id="zydy" name="zydy" type="text" value="${model.zydy}" class="input_a1"  maxlength="100"  readonly="true" />
     </td>
     <th align="center">会员编号：</th>
     <td colspan="2">
     	<input id="hybh" name="hybh" type="text" value="${model.hybh}" class="input_a1"  maxlength="20" readonly="true" />
     </td>
</tr>	
    <tr align="center">
     <th>用户:</th>
     <td colspan="3">
     	<input id="qymc" name="qymc" type="text" value="${model.qymc}"  class="input_a1"  maxlength="100"  onfocus="loadCorpName();" onblur="loadQyxx();"  readonly="true" />
     </td>
     <th>建筑面积：</th>
     <td colspan="2">
     	<input id="qymj" name="qymj" type="text" value="${model.qymj}" class="input_a1"  maxlength="20" onchange="sumfy();" readonly="true" />㎡
     </td>

  
    </tr>	
     <tr align="center">
       <th>缴费年月：</th>
      <td colspan="3">
     <input name="jfyd"  id="jfyd" type="text" class="input_a1" value="${model.jfyd}" readonly="true" />
     </td>
     <th>所属楼区：</th>
       <td colspan="2">
       
        <input name="sslq"  id="sslq" type="hidden" class="input_a1" value="${model.sslq}" />
     	 <select name="sslqname"  id="sslqname" style="text-align:center" disabled>
          <option value="1">科技大楼</option>
          <option value="2">A栋</option>
          <option value="3">B栋</option>
          <option value="4">C栋</option>
          <option value="5">D栋</option>
          <option value="6">琶洲科技创意中心</option>
        </select>
     </td>
    </tr>	
    <tr align="center">
     <th>序号：</th>
     <th >项目：</th>
     <th colspan="2">属期：</th>
     <th>金    额    （元）：</th>
     <th>滞纳金 （元）：</th>
     <th>备注：</th>			
	</tr>			

	     <tr align="center">
	     <td>1</td>
	    <td>
	     <input name="zjmc"  id="zjmc" type="text" class="input_a1" value="${model.zjmc!='' && model.zjmc !=null?model.zjmc:'租金'}"  readonly="true" />
	     	</td> 
	     <td colspan="2">
	    <input name="qyzjdj"  id="qyzjdj" type="hidden" class="input_a1" value="${model.qyzjdj}" onchange="sumzj();" readonly="true" />
	     <input name="zjsq"  id="zjsq" type="text" class="input_a1" value="${model.zjsq}" readonly="true"  />
	     	</td> 
	     <td>
	     <input name="qyzj"  id="qyzj" type="text" class="input_a1" value="${model.qyzj}" readonly="true" />
	     	</td>
	  	   <td>
	     <input name="qyzjznj"  id="qyzjznj" type="text" class="input_a1" value="${model.qyzjznj!='' && model.qyzjznj != null?model.qyzjznj:'0.0'}" readonly="true" />
	     	</td> 
	     <td>
	     <input name="zjbz"  id="zjbz" type="text" class="input_a1" value="${model.zjbz}" readonly="true"/> 
	     	</td> 	
	    
	    </tr>
	    <tr align="center">
	    <td>2</td>
	    <td>
	     <input name="glfwfmc"  id="glfwfmc" type="text" class="input_a1" value="${model.glfwfmc!='' && model.glfwfmc !=null?model.glfwfmc:'管理服务费'}"  readonly="true"/>
	     	</td>
	     <td colspan="2">
	       <input name="glfwfdj"  id="glfwfdj" type="hidden" class="input_a1" value="${model.glfwfdj}" readonly="true"/>
	   	 	<input name="glfsq"  id="glfsq" type="text" class="input_a1" value="${model.glfsq}" readonly="true"/>
	   	 </td>
	   	 <td>
	   	 	<input name="glfwf"  id="glfwf" type="text" class="input_a1" value="${model.glfwf}" readonly="true"/>
	   	 </td>
	      <td>
	   	 	<input name="glfwfznj"  id="glfwfznj" type="text" class="input_a1" value="${model.glfwfznj!='' && model.glfwfznj != null?model.glfwfznj:'0.0'}" readonly="true"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="glfbz"  id="glfbz" type="text" class="input_a1" value="${model.glfbz}" readonly="true"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>3</td>
	     <td>
	     <input name="zlbzjmc"  id="zlbzjmc" type="text" class="input_a1" value="${model.zlbzjmc!='' && model.zlbzjmc !=null?model.zlbzjmc:'租赁保证金'}" readonly="true" />
	     	</td>
	     
	      <td colspan="2">
	      <input name="zlbzjdj"  id="zlbzjdj" type="hidden" class="input_a1" value="${model.zlbzjdj}" readonly="true"/>
	   	 	<input name="zlbzjsq"  id="zlbzjsq" type="text" class="input_a1" value="${model.zlbzjsq}" readonly="true"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zlbzj"  id="zlbzj" type="text" class="input_a1" value="${model.zlbzj}" readonly="true"/>
	   	 </td>
	      <td>
	   	 	<input name="zlbzjznj"  id="zlbzjznj" type="text" class="input_a1" value="${model.zlbzjznj!='' && model.zlbzjznj != null?model.zlbzjznj:'0.0'}" readonly="true"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zlbzjbz"  id="zlbzjbz" type="text" class="input_a1" value="${model.zlbzjbz}" readonly="true"/>
	   	 </td>
	    </tr>
	    
	     <tr align="center">
	     <td>4</td>
	       <td>
	     <input name="zxyjmc"  id="zxyjmc" type="text" class="input_a1" value="${model.zxyjmc!='' && model.zxyjmc !=null?model.zxyjmc:'装修押金'}"  readonly="true"/>
	     	</td>
	    
	      <td colspan="2">
	       <input name="zxyjdj"  id="zxyjdj" type="hidden" class="input_a1" value="${model.zxyjdj}" readonly="true"/>
	   	 	<input name="zxyjsq"  id="zxyjsq" type="text" class="input_a1" value="${model.zxyjsq}" readonly="true"/>
	   	 </td>
	   	 <td>
	   	 	<input name="zxyj"  id="zxyj" type="text" class="input_a1" value="${model.zxyj}" readonly="true"/>
	   	 </td>
	      <td>
	   	 	<input name="zxyjznj"  id="zxyjznj" type="text" class="input_a1" value="${model.zxyjznj!='' && model.zxyjznj != null?model.zxyjznj:'0.0'}" readonly="true"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="zxyjbz"  id="zxyjbz" type="text" class="input_a1" value="${model.zxyjbz}" readonly="true"/>
	   	 </td>
	    </tr>
	    
	         <tr align="center">
	         <td>5</td>
	              <td>
	     <input name="sfmc"  id="sfmc" type="text" class="input_a1" value="${model.sfmc!='' && model.sfmc !=null?model.sfmc:'水费'}"  readonly="true"/>
	     	</td>
	 
	      <td colspan="2">
	   	 	<input name="sfsq"  id="sfsq" type="text" class="input_a1" value="${model.sfsq}" readonly="true"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qysf"  id="qysf" type="text" class="input_a1" value="${model.qysf}" readonly="true"/>
	   	 </td>
	      <td>
	   	 	<input name="qysfznj"  id="qysfznj" type="text" class="input_a1" value="${model.qysfznj!='' && model.qysfznj != null?model.qysfznj:'0.0'}" readonly="true"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="sfbz"  id="sfbz" type="text" class="input_a1" value="${model.sfbz}" readonly="true"/>
	   	 </td>
	    </tr>
	    
	        <tr align="center">
	        <td>6</td>
	         <td>
	     <input name="dfmc"  id="dfmc" type="text" class="input_a1" value="${model.dfmc!='' && model.dfmc !=null?model.dfmc:'电费'}" readonly="true"/>
	     	</td>
	  
	      <td colspan="2">
	   	 	<input name="dfsq"  id="dfsq" type="text" class="input_a1" value="${model.dfsq}" readonly="true"/>
	   	 </td>
	   	 <td>
	   	 	<input name="qydf"  id="qydf" type="text" class="input_a1" value="${model.qydf}"  onblur="rtnn(this);sumhjje();" readonly="true"/>
	   	 </td>
	      <td>
	   	 	<input name="qydfznj"  id="qysfznj" type="text" class="input_a1" value="${model.qydfznj!='' && model.qydfznj != null ? model.qydfznj:'0.0'}" readonly="true"/>
	   	 </td> 
	   	 <td>
	   	 	<input name="dfbz"  id="dfbz" type="text" class="input_a1" value="${model.dfbz}" readonly="true"/>
	   	 </td>
	    </tr>
	          <tr>
     <td colspan="4">小写：</td>
     <td align="center">
     	<input name="hjje"  id="hjje" type="text" class="input_a1" value="${model.hjje}" onchange="loadHjjezw();" readonly="true"/>
     </td>
    
       <td align="center"></td>
      <td align="center"></td>
    </tr>
     <tr>
     <td colspan="3">合计金额（人民币大写）：</td>
     <td colspan="4">
     	<input name="hjjedx"  id="hjjedx" type="text" class="input_a1" value="${model.hjjedx}" style="width:400px"  readonly="true"/>
     </td>
    </tr>
    <tr>
    	  <td colspan="7"><textarea name="texta" id="texta" style="width:90%;height:45px;color:red;">说明：1、费用采用现金或支票、公对公转账形式支付，租金水电费支票抬头写：广州市海珠科技产业园有限公司；帐号：635357744247 ，中国银行海珠支行                                                                                        2、请于每月5日前交纳以上列表之费用，逾期按每日5‰收取滞纳金；                                                                                                                                                                         3、如已交纳该款，可不予理会此单； </textarea></td>
    </tr>
    <tr>
    	  <td colspan="7">附件：</td>
    </tr>
      <tr>
    	  <th>项目</th>
    	  <th>上月行度</th>
    	  <th>本月行度</th>
    	  <th>合计用量</th>
    	  <th>单价</th>
    	  <th>金额（元）</th>
    	  <th>备注</th>
    </tr>
    

	    <tr>
	    <th>水1：</th>
	     <td>
     	<input name="ssyhd"  id="ssyhd" type="text" class="input_a1" value="${model.ssyhd}" readonly="true"/>吨
     </td>
     <td>
     	<input name="sbyhd"  id="sbyhd" type="text" class="input_a1" value="${model.sbyhd}" readonly="true"/>吨
     </td>
      <td>
     	<input name="shjyl"  id="shjyl" type="text" class="input_a1" value="${model.shjyl}" readonly="true"/>吨
     </td>
     <td>
     	<input name="qysfdj"  id="qysfdj" type="text" class="input_a1" value="${model.qysfdj}" readonly="true"/>元/吨
     </td>
       <td>
     	<input name="lqysf"  id="lqysf" type="text" class="input_a1" value="${model.qysf}" readonly="true"/>
     </td>
     
     <td>
     	<input name="sfbz"  id="sfbz" type="text" class="input_a1" value="${model.sfbz}" readonly="true"/>
     </td>
      
	    </tr>
	      <tr>
	    <th>水2：</th>
	     <td>
     	<input name="ssyhd2"  id="ssyhd2" type="text" class="input_a1" value="${model.ssyhd2}"  readonly="true" onblur="rtnn(this);sumshjyl2();"/>吨
     </td>
      <td>
     	<input name="sbyhd2"  id="sbyhd2" type="text" class="input_a1" value="${model.sbyhd2}"  readonly="true" onblur="rtnn(this);sumshjyl2();sumqysf2();"/>吨
     </td>
      <td>
     	<input name="shjyl2"  id="shjyl2" type="text" class="input_a1" value="${model.shjyl2}" readonly="true" onchange="sumqysf2();"/>吨
     </td>
     <td>
     	<input name="qysfdj2"  id="qysfdj2" type="text" class="input_a1" value="${model.qysfdj2}" readonly="true" onchange="sumqysf2();"/>元/吨
     </td>
       <td>
     	<input name="lqysf2"  id="lqysf2" type="text" class="input_a1" value="${model.lqysf2}" readonly="true" />
     </td>
     
     <td>
     	<input name="sfbz2"  id="sfbz2" type="text" class="input_a1" value="${model.sfbz2}" readonly="true" onchange="onchangebz();"/>
     </td>
      
	    </tr>
	    
	  
	    <tr>
	    <th>电1：</th>
	   <td>
     	<input name="dsyhd"  id="dsyhd" type="text" class="input_a1" readonly="true" value="${model.dsyhd}"/>度
     </td>
     <td>
     	<input name="dbyhd"  id="dbyhd" type="text" class="input_a1" readonly="true" value="${model.dbyhd}"/>度
     </td>
     <td>
     	<input name="dhjyl"  id="dhjyl" type="text" class="input_a1" readonly="true" value="${model.dhjyl}" />度
     </td>
     <td>
     	<input name="qydfdj"  id="qydfdj" type="text" class="input_a1" readonly="true" value="${model.qydfdj}"/>元/度
     </td>
       <td>
     	<input name="lqydf"  id="lqydf" type="text" class="input_a1" readonly="true" value="${model.qydf}" />
     </td>
     
     <td>
     	<input name="dfbz"  id="dfbz" type="text" class="input_a1" readonly="true" value="${model.dfbz}"/>
     </td>
      
	    </tr>  
	      <tr>
	    <th>电2：</th>
	   <td>
     	<input name="dsyhd2"  id="dsyhd2" type="text" class="input_a1" readonly="true" value="${model.dsyhd2}" onblur="rtnn(this);sumdhjyl2();"/>度
     </td>
     <td>
     	<input name="dbyhd2"  id="dbyhd2" type="text" class="input_a1" readonly="true" value="${model.dbyhd2}" onblur="rtnn(this);sumdhjyl2();sumqydf2();"/>度
     </td>
     <td>
     	<input name="dhjyl2"  id="dhjyl2" type="text" class="input_a1" readonly="true" value="${model.dhjyl2}"  onchange="sumqydf2();"/>度
     </td>
     <td>
     	<input name="qydfdj2"  id="qydfdj2" type="text" class="input_a1" readonly="true" value="${model.qydfdj2}" onchange="sumqydf2();"/>元/度
     </td>
       <td>
     	<input name="lqydf2"  id="lqydf2" type="text" class="input_a1" readonly="true" value="<fmt:formatNumber value="${model.lqydf2}" pattern="#.#" minFractionDigits="1" />" />
     </td>
      
     <td>
     	<input name="dfbz2"  id="dfbz2" type="text" class="input_a1" readonly="true" value="${model.dfbz2}" onchange="onchangebz();"/>
     </td>
      
	    </tr>  
	    
	          <tr>
     <th >备注：</th>
     <td colspan="6"><textarea id="xxbz" name="xxbz" rows="2" cols="120" >${model.xxbz}</textarea></td>
    </tr>
    
    <tr>
    <th>企业实缴金额</th>
    <td><input name="jnje"  id="jnje" type="text" class="input_a1" value="${model.jnje}"/></td>
     <th>缴费凭证上传：</th>
     <td  colspan="4">
     <input style="border:0px;" type="file" name="files" id="files"/>
     </td>
    </tr>
     <tr>
    <th>凭证图像</th>
    <td colspan="6">
    <img src="${ctx}/${model.accessory}" width="600px" height="400px"/>
    <input type="hidden" name="accessory" id="accessory" value="${model.accessory}"/>
     </td>
    </tr>
   </table>
     
   
    
    	
  
  </div>
  <div class="add_info" id="addinfo1">
       <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable" >
       <tr align="center">
       <th>开票日期：</th>
      <td colspan="3">
     <input name="kprq"  id="kprq" type="text" class="input_a1" value="${model.kprq}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
     </td>
     <th>租金发票号：</th>
       <td colspan="2">
     	<input name="zjfph"  id="zjfph" type="text" class="input_a1" value="${model.zjfph}"/>
     </td>
    </tr>	
     <tr align="center">
       <th>管理费发票号：</th>
      <td colspan="3">
      <input name="glffph"  id="glffph" type="text" class="input_a1" value="${model.glffph}"/>
     </td>
     <th>水电发票号：</th>
       <td colspan="2">
     	<input name="sdfph"  id="sdfph" type="text" class="input_a1" value="${model.sdfph}"/>
     </td>
    </tr>		
    <tr align="center">
       <th>装修押金发票号：</th>
      <td colspan="3">
      <input name="zxyjfph"  id="zxyjfph" type="text" class="input_a1" value="${model.zxyjfph}"/>
     </td>
     <th>租赁保证金发票号：</th>
       <td colspan="2">
     	<input name="zlbzjfph"  id="zlbzjfph" type="text" class="input_a1" value="${model.zlbzjfph}"/>
     </td>
    </tr>						
					
					</table>
       </div>
        <div class="div_submit">
        <input id="sumbit_bt" name="" type="submit" value=${userNo=='4401'?"提交":"审核"}
						class="photo_btn" />
						<input type="reset" value="暂存" onclick="zcsave();"
						class="photo_btn" />	
				
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
						
				</div>
  </form>
</div>

</body>
</html>