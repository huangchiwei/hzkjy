function info1(){
	//信息框例一
	layer.alert('白菜级别前端攻城师贤心', 8);
}
function info2(){
	//信息框例二
	layer.msg('前端攻城师贤心', 2, -1);
}
function ask1(){
	//询问框
	$.layer({
	  shade : [0], //不显示遮罩
	  area : ['auto','auto'],
	  dialog : {
	      msg:'您是如何看待前端开发？',
	      btns : 2, 
	      type : 4,
	      btn : ['重要','奇葩'],
	      yes : function(){
	          layer.msg('您选择了重要。',2,1);
	      },
	      no : function(){
	          layer.msg('奇葩!!!',2,4);
	      }
	  }
	});
}
function page1(){
	//页面层例一
	$.layer({
		shade : false,
		type : 1,
		area : ['auto','auto'],
		title : false,
		border : [0],
		page : {dom : '.layer_notice'},
		close : function(index){
			layer.close(index);
			$('.layer_notice').show();
		}
	});
}
function page2(){
	//页面层例二
	var i = $.layer({
		type: 1,
		title: false,
		closeBtn: false,
		border : [5, 0.5, '#666', true],
		offset: ['0px',''],
		move: ['.juanmove', true],
		area: ['620px','auto'],
		page: {
			html: 'http://www.baidu.com'
		},
	  success: function(){
	      layer.shift('top',500);
	  }
	});
	$('.juanLu').on('click', function(){
		layer.close(i);
	});
}



//快捷调用：layer.confirm();

function iframe1(){
	//iframe层例一
	$.layer({
	  type : 2,
	  closeBtn : false,
		shadeClose: true,
	  time : 5,
	  iframe : {
	      src : 'http://player.youku.com/player.php/sid/XMjY3MzgzODg0/v.swf'
	  },
	  title : false,
	  area : ['500px','300px'],
	  success : function(){ //层加载成功后进行的回调
	      layer.shift('right-bottom',1000); //浏览器右下角弹出
	  },
	  end : function(){ //层彻底关闭后执行的回调
	      $.layer({
	          type : 2,
	          offset : ['100px', ''],
	          iframe : {
	              src : 'http://sentsin.com/about/'
	          },	
	          area : ['960px','500px']
	      })
	  }
	});

}
function iframe2(){

	//iframe层例二
	$.layer({
		type: 2,
		title: false,
		fix: false,
		closeBtn: false,
		shadeClose: true,
		shade: [0.1,'#fff', true],
		border : [5, 0.3, '#666', true],
		offset: ['100px',''],
		area: ['990px','500px'],
		iframe: {src: 'http://sentsin.taobao.com/'},
		success: function(){
			layer.msg('点击层外任意处，可关闭该iframe层', 2, 9);
		}
	});

}
function load1(){
	//加载层
	layer.load(5); //5秒后关闭

}
function tip1(){
	//tips层一
	layer.tips('tips的样式并非是固定的，您可自定义外观。', this, {
	  style: ['background-color:#E227C7; color:#fff', '#E227C7'],
	  maxWidth:185,
	  closeBtn:[0,true] //显示关闭按钮
	});
}

function tip2(){
	//tips层二
	layer.tips('也可以不要关闭按钮', this, {guide: 1});
	         
}
function example1(){
	layer.alert('一个很普通的信息框');

}
function example2(){
	layer.alert('信息框演示二', 11, !1);

}
function example3(){
	layer.confirm('信息框演示三',function(index){
	    layer.close(index);
	    layer.msg('信息框演示三');
	});

}
function example4(){
	layer.msg('也可以不用显示图标哦', 2, -1);

}
function example5(){
	var i = 0;
	$.layer({
		dialog:{type:0,msg:'<a href="javascript:;" id="setface">点击我，换图标</a>'},
		success: function(layerE){
			$('#setface').unbind('click').bind('click',function(){
				var index = layer.getIndex(this);
				i++;
				layerE.find('.xubox_msgico').removeClass('xubox_msgtype'+(i-1)).addClass('xubox_msgtype'+i);
				i > 10 && layer.close(index);
			});
		}, end: function(){
			i = 0;
		}
	});

}
function example6(){
	layer.msg('踩到屎啦', 2, 13);

}

function login(){
	var i = $.layer({
		type : 1,
		title : false,
		closeBtn : false,
		border : [0],
		area : ['455px','371px'],
		page : {dom : '#baidu'}
	});
	$('#baidu').on('click', function(){
		layer.close(i);
	});

}
function picture(){
	var i = $.layer({
	    type : 1,
	    title : false,
	    fix : false,
	    offset:['50px' , ''],
	    area : ['515px','615px'],
	    page : {dom : '#tong'}
	});

}
function taobao(){
	var i = $.layer({
	    type : 1,
	    title : false,
	    offset:['150px' , ''],
	    border : false,
	    area : ['503px','395px'],
	    page : {dom : '#taobao'}
	});

}

function leftButtom(){
	//一：iframe层之从左下角弹出
	$.layer({
	    type: 2,
	    title: false,
	    iframe: {src: 'http://www.bayuanbao.com'},
	    area : ['1000px' , '500px'],
	    success : function(){
	        layer.shift('bottom', 400)	
	    }
	});



}
function center(){
	//二：iframe层之正中央
	$.layer({
	    type : 2,
	    title : '天之痕三个人的时光-半抱琵琶版',
	    iframe : {src : 'http://www.tudou.com/v/Rvy0IbYmBrQ/&resourceId=0_04_05_99/v.swf'},
	    area : ['750px' , '466px'],
	    offset : ['100px','']
	});

}
function parentChildren1(){
	//三：iframe层之子父操作
	$.layer({
		type : 2,
		shade : [0],
	    fix: false,
		title : ['iframe子父操作',true],
		iframe : {src : '/Validate/jsp/user/create.jsp'},
		area : ['500px' , '260px'],
		offset : ['150px', ''],
		close : function(index){
			layer.msg('您获得了子窗口标记：' + layer.getChildFrame('#name', index).val(),3,1);
			layer.close(index);
		}
	});

}
function parentChildren2(){
	//子窗口操作父窗口：
	var index = parent.layer.getFrameIndex(window.name);
	$('#a').click(function(){
		parent.layer.msg('您将标记"' + $('#name').val() + '"成功传送给了父窗口' , 3, 1);
		parent.layer.close(index);
	});
	$('#add').on('click', function(){
		$('body').append('新元素');
		parent.layer.iframeAuto(index);
	});
	$('#new').on('click', function(){
		parent.$.layer({
			type : 2,
			title : ['iframe子父操作',true],
			iframe : {src : 'http://sentsin.com'},
			area : ['1000px' , '500px'],
			offset : ['100px', '']
		});
	});  
}

function loadExample1(){
	//例一：
	var loadi = layer.load(5, 0); //如不想让加载自动关闭，第一个参数设置0即可，如：layer.load(0);

}
function loadExample2(){
	//例二：					
	var loadi = layer.load('加载中…'); //需关闭加载层时，执行layer.close(loadi)即可

}

