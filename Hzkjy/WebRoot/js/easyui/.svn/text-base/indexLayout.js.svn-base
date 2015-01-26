/**
 * 刷新当前tab内容
 * 
 * @return
 */
function refresh() {
	var tab = $('#tt').tabs('getSelected'); // get selected panel
	$('#tt').tabs('update', {
		tab : tab,
		options : {
			title : tab.panel('options').title,
			content : tab.panel('options').content
		// the new content
		}
	});
}
/**
 * 关闭当前tab
 * 
 * @return
 */
function closeCurrentTab() {
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex', tab);
	$('#tt').tabs('close', index);
}
/**
 * 关闭所有tab
 * 
 * @return
 */
function closeAllTab() {
	for ( var i = $('#tt').tabs('tabs').length - 1; i >= 0; i--) {
		$('#tt').tabs('close', i);
	}
}
/**
 * 加载显示刷新当前页面按钮，关闭当前面按钮，关闭所有面按钮。
 * 
 * @return
 */
function loadButton() {
	$('#tt').tabs( {
		tools : [ {
			iconCls : 'icon-reload', // 刷新当前tab
			handler : function() {
				refresh();
			}
		}, {
			iconCls : 'icon-closeOne', // 关闭当前tab
			handler : function() {
				closeCurrentTab();
			}
		}, {
			iconCls : 'icon-closeAll', // 关闭所有tab
			handler : function() {
				closeAllTab();
			}
		} ]
	});

}
/**
 * *打开新的tab
 * 
 * @param plugin
 *            新的tab标题
 * @param url
 *            新的tab里面显示的内容来源路径
 * @return
 */
function openNew(plugin, url) {
	if ($('#tt').tabs('exists', plugin)) { // 当要打开的tab已经存在，就选中该tab
		$('#tt').tabs('select', plugin);
		refresh();
	} else {
		// 最多可以同时打开10个tab
		if ($('#tt').tabs('tabs').length >= 10) {
			$.messager.alert('打开提示', '最多可以同时打开10个tab');
			return;
		}
		var content = '<iframe scrolling="auto" frameborder="0" id="iframe'
				+ $('#tt').tabs('tabs').length + '" src="' + url
				+ '" style="width:100%;height:100%;"></iframe>';
		$('#tt').tabs('add', {
			title : plugin,
			content : content,
			closable : true,
			extractor : function(data) {
				data = $.fn.panel.defaults.extractor(data);
				var tmp = $('<div></div>').html(data);
				data = tmp.find('#content').html();
				tmp.remove();
				return data;
			}
		});
	}
}