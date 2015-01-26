
function openLayer(title,url){
	//height  660px
	//width  950px
	$.layer({
	    type: 2,
	    shade: [0],
	    fix: false,
	    title : [title,true],
	    maxmin: true,
	    iframe : {src : url},
	    area : ['950px' , '660px'],
	    offset: [($(window).height() - 342-12)/2+'px','']

	});
}

function loadCustomPageLayer(title,url,width,height){
	
	var mypop = $.layer({
	    type: 2,
	    title: title,
	    iframe: {src : url},
	    maxmin: true,
	    area: [width+'px', height+'px'],
	    offset: [($(window).height())/4+'px',''], 
	    end: function(){
	        mypop = null
	    }
	});
	$(window).on('resize', function(){
	    if(mypop){
	        layer.area(mypop, {
	            top: ($(window).height())/4
	        });
	    }
	});


}
/**
 * 居中
 * @param title
 * @param url
 * @return
 */
function loadPageLayer(title,url){
	var mypop = $.layer({
	    type: 2,
	    title: title,
	    iframe: {src : url},
	    maxmin: true,
	    area: ['950px', '650px'],
	    offset: [($(window).height())/4+'px',''], 
	    end: function(){
	        mypop = null
	    }
	});
	$(window).on('resize', function(){
	    if(mypop){
	        layer.area(mypop, {
	            top: ($(window).height())/4
	        });
	    }
	});


}
var loadi;
function loadLayer(title){
	loadi= layer.load(title);
}
function closeLayer(){
	layer.close(loadi)
}
function msgLayer(title,status){
	 layer.msg(title,1,status);
}