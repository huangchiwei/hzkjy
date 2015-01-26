<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>permission</title>
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/font.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx}/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery.ztree.excheck-3.5.min.js"></script>
  <script type="text/javascript">
  function checkParent(obj){
  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var node = treeObj.getNodesByFilter(function (node) {
			return node.id == $(obj).attr("name").replace("ck_","")
		},true);
	if(obj.checked){
		node.checked = obj.checked;
		treeObj.updateNode(node);
	}
  }
  var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onCheck: function zTreeOnCheck(event, treeId, treeNode) {
				    $("input[name='ck_" + treeNode.id + "']").attr("checked",treeNode.checked);
				}
			}
		};

		$(document).ready(function(){
			$.ajax({
		  		url:'${ctx}/sys/sysModule/loadModuleTree.html',
		  		type:'post',
		  		data:'roleNo=' + '${role.roleNo}',
		  		dataType:'json',
		  		async:true,
		  		success:function(data){
		  			var arrJson = [];
		  			$.each(data,function(i,item){
		  				var json = {};
		  				json.id = item.ModuleNo;
						json.name = item.ModName + '　';
		  				if(item.ParentNo == undefined){
		  					json.value = '';
		  					json.pId = '0';
		  					json.open = 'true';
		  					//是否要选中
		  					$.each(data,function(i,item2){
		  						if(item2.ParentNo == item.ModuleNo && item2.PermId != undefined){
		  							json.checked = 'true';
		  							return false;
		  						}
		  					});
		  					arrJson.push(json);
		  				}else if(item.PermType == 0){
		  					json.value = item.ID;
		  					json.pId = item.ParentNo;
  							if(item.PermId != undefined){
  								json.checked = 'true';
  							}
  							arrJson.push(json);
		  				}
		  				
		  			});
		  			var t = $("#treeDemo");
					t = $.fn.zTree.init(t, setting, arrJson);
					$.each(data,function(i,item){
						if(item.ParentNo != undefined && item.PermType == 1){
							$("a[title^='" + item.ModName + "']").parent().append($("<input type='checkbox' onchange='checkParent(this)'/>").attr("checked",item.PermId != undefined).attr("value",item.ID).attr("name","ck_" + item.ModuleNo));
							$("a[title^='" + item.ModName + "']").parent().append(" " + item.PermName + "　");
						}
					});
					
		  		},
		  		error:function(){
		  			alert('功能菜单加载异常');
		  		} 
		  		
		  	});
		  	
		  	$("#bt_sumbit").click(function(){
		  		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		  		var nodes = zTree.getCheckedNodes(true);
		  		var permIds = "";
		  		var flag = true;
		  		for(var i = 0; i < nodes.length; i++){
		  			if(nodes[i].value != ""){
		  				if(flag){
		  					permIds = permIds + nodes[i].value;
		  					flag = false;
		  				}else{
		  					permIds = permIds + "," + nodes[i].value;
		  				}
		  			}
		        }
		        var cks = $("input[name^='ck_']:checked");
		        for(var i = 0; i < cks.length; i++){
		        	permIds = permIds + "," + cks[i].value;
		        }
		        location.href = "${ctx}/sys/sysRole/saveRolePerm.html?roleNo=${role.roleNo}&permIds=" + permIds;
		       
		  	});
		});

</script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
white:link {
color: #FFFFFF;
text-decoration: none;
}
</style>
</head>

<body>
<div class="content_box">
 	  <div class="btn_box">
 	  	<pm:hasPermission permValue="ro_saveperm">
	  		<input type="button" value="保存" class="initial" style="cursor:hand" id="bt_sumbit"/>&nbsp;
	  	</pm:hasPermission>
	  	<input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/sys/sysRole/list/1.html'"/>
	  </div>
	  角色：${role.roleName}<br/>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>
</body>
</html>