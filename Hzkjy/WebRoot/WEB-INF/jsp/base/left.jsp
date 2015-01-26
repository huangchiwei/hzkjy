<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>  
<link href="${ctx}/theme/${cssFile}/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/${cssFile}/css/default.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/theme/default/js/jquery-1.2.1.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/default/js/menu.js" type="text/javascript"></script>

<link rel="stylesheet" href="${ctx}/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery.ztree.core-3.5.js"></script>
  <script type="text/javascript">
  
	var zTree;
	var demoIframe;

	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					openNew('I2',treeNode.name,"${ctx}/" + treeNode.file + "/1.html");
					return true;
				}
			}
		}
	};

	$(document).ready(function(){
	demoIframe = $("#testIframe");
		$.ajax({
	  		url:'${ctx}/sys/sysModule/loadModuleTreeByUserNo.html',
	  		type:'post',
	  		dataType:'json',
	  		async:true,
	  		success:function(data){
	  			var t = $("#tree");
				t = $.fn.zTree.init(t, setting, data);
				var zTree = $.fn.zTree.getZTreeObj("tree");
				//zTree.selectNode(zTree.getNodeByParam("id", 2));
	  		},
	  		error:function(){
	  			//parent.location = "${ctx}";
	  			//alert('功能菜单加载异常');
	  		} 
	  		
	  	});
		

	});
	function selectTreeTab(title){
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("name", title));
	}

</script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>
</head>
<body>
<div class="box_p">
 <div class="submenu_top"></div>
 <div class="submenu_box">
	<ul id="tree" class="ztree" style="overflow:auto; width:200px;"></ul>
        <!--<table border="0" height="600px" align="left">
			<tr>
				<td align=left valign=top>
					<ul id="tree" class="ztree" style="overflow:auto; width:200px;"></ul>
				</td>
			</tr>
		</table>-->
 </div>
 </div>
</body>
</html>