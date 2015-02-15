<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<link rel="stylesheet" href="${ctx}/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/js/ztree/js/jquery.ztree.core-3.5.js"></script>
  <script type="text/javascript">
  /**
   * *打开新的tab
   * 
   * @param plugin
   *            新的tab标题
   * @param url
   *            新的tab里面显示的内容来源路径
   * @param iframe   
   * 			  指明哪个iframe       
   * @return
   */
  function openNew(iframe,plugin, url) {
  	//var obj=window.parent.document;
  	// obj.openNew(iframe,plugin, url);
  	//alert("d");
  //	self.parent.frames[iframe].openNew(plugin, url);
	  self.parent.openNew(plugin, url);
  }
 
  
	var zTree;
	//var demoIframe;

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
			
				openNew('I2',treeNode.name,"${ctx}/" + treeNode.file);
					return true;
				}
			}
		}
	};

	$(document).ready(function(){
		$.ajax({
	  		url:'${ctx}/admin/sysModule/loadModuleTreeByUserNo.json',
	  		type:'post',
	  		dataType:'json',
	  		async:true,
	  		success:function(data){
	  			var t = $("#tree");
				t = $.fn.zTree.init(t, setting, data);
	  		},
	  		error:function(){
	  			alert('功能菜单加载异常');
	  		} 
	  		
	  	});
		

	});
	function selectTreeTab(title){
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("name", title));
	}
</script>
</head>
<body>
<div class="box_p">
 <div class="submenu_top"></div>
 <div class="submenu_box">
	<ul id="tree" class="ztree" style="overflow:auto; width:200px;"></ul>
 </div>
 </div>
</body>
</html>