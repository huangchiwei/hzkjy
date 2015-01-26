
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
	// 最多可以同时打开8个tab
	if ($('#tt').tabs('tabs').length >= 10) {
		$.messager.alert('打开提示', '最多可以同时打开8个tab');
		return;
	}

	if ($('#tt').tabs('exists', plugin)) { // 当要打开的tab已经存在，就选中该tab
		$('#tt').tabs('select', plugin);
		refresh();
	} else {
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