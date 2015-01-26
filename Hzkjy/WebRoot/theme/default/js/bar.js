(function($){
    $.fn.extend({
        iSelect: function(options){
            var iset = {
                name: $('.selectitem'), //容器
                select: $('.selectitem>dl'), //dl列表
                dropCSS: 'drop', //收藏状态dt的样式
                shrinkCSS: 'shrink', //展开状态dt的样式
                hoverCSS: 'hover', //鼠标划过dd时的样式
                clearTime: 100, //允许用户快速划过不触发的时间(ms)
                dropTime: 100, //展开时间(ms)
                shrinkTime: 100, //收缩时间(ms)
                selectVal: null//选择的值传到此元素中
            }            
            options=$.extend(iset, options || {});
            var mainHeight = iset.name.height();//容器高度
            var selectHeight = iset.select.height(); //dl实际高度
            var currentVal = iset.selectVal.val();
            var curTxt = iset.select.find('dt').html(currentVal); //dt默认html内容
            var self = null;
            var hoverElem = null; //避免用户快速划过时触发事件
            iset.name.each(function(){
                $(this).hover(function(){
                    self = this;
                    hoverElem = setTimeout(function(){
                        $(self).stop(true, false).animate({ //鼠标划过时,展开dl
                            height: selectHeight
                        }, iset.dropTime);
                        if ($(self).find('dt').html() == curTxt) { //判断是否有选择下拉列表,若无则改变dt样式
                            $(self).find('dt').attr('class', iset.dropCSS);
                        }
                        //dd的鼠标事件
                        $(self).find('dd').mouseover(function(){
                            $(this).addClass(iset.hoverCSS).siblings().removeClass(iset.hoverCSS);
                        }).mousedown(function(){ //鼠标点击时取值并赋给dt
                            $(self).find('dt').html($(this).html()).attr('class', $(this).attr('class'));
							//为表单传值                            
							if(iset.selectVal){
								iset.selectVal.val($(this).html());								
							}
                            $(self).stop(true, false).animate({
                                height: mainHeight
                            }, iset.shrinkTime);
                        }).removeClass(iset.hoverCSS);
                    }, iset.clearTime);
                }, function(){
                    //鼠标移出后触发的事件
                    clearTimeout(hoverElem);
                    $(self).stop(true, false).animate({
                        height: mainHeight
                    }, iset.shrinkTime);
                    if ($(self).find('dt').html() == curTxt) {
                        $(self).find('dt').attr('class', iset.shrinkCSS);
                    }
                });
            })
        }
    })
})(jQuery);