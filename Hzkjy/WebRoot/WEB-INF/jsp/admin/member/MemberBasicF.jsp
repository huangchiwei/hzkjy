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
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
<script type="text/javascript">

function importEmp(){  
    //检验导入的文件是否为Excel文件  
    var exlFile = document.getElementById("exlFile").value;  
    if(exlFile == null || exlFile == ''){  
        alert("请选择要上传的Excel文件");  
        return;  
    }else{  
        var fileExtend = exlFile.substring(exlFile.lastIndexOf('.')).toLowerCase();   
        if(fileExtend == '.xls'){  
        }else{  
            alert("文件格式需为'.xls'格式");  
            return;  
        }  
    }  
    //提交表单  
    
    
	document.getElementById("search1_form").submit();
	
   	
   	
} 
	$(document).ready(function(){
		var exl="${exl}";
		if(exl =="ok"){
		parent.location.href="${ctx}/admin/member/memberBasic/list/1.html"
	    parent.layer.close();
		}
       
		});
		</script>
</head>

<body>
<div class="content_box">
  <div class="btn_box">
  	
     
  </div>
  <div class="list_info">
  	<form id="search1_form" action="${ctx}/admin/memberBasic/inputExport.html" method="post" enctype="multipart/form-data">
    <div class="div2">
    <input type="file" id="exlFile" name="exlFile"/>&nbsp;&nbsp;  
   <input type="button"  value="导入Excel" onclick="importEmp()"/>  
    </div>
    
    </form>
   
  </div>
</div>
</body>
</html>
