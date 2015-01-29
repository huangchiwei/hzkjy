
var tabs=new Array();
var tabsName=new Array();
/**
 *  释放广州读写卡插件资源
 * @param tabName
 * @return
 */
/*function freeOcx(tabName){
	 try{
		 self.frames["iframe"+tabName.substring(3)].FreeOcx();     //释放广州读写卡插件资源
		
	    }catch(e){}
}*/
/**
 * 判断是否已经打开同标题的TAB
 * @param plugin
 * @return
 */
function  exits(plugin){
	for (var i=0;i<tabsName.length;i++)
	{
			if(tabsName[i]==plugin){
				return true;
			}
	}
	return false;
}

function closeTab(closeTitle){
	refresh_select(closeTitle,false);
	closeCurrentTab(false);
	
}
/**
 * close Current Tab
 * @return
 */
function closeCurrentTab(isShowLastTab) {
	
	 var plugin= $("#tabs li.current").find(".tab").html();
	  // Get the tab name
     var tabName = $("#tabs li.current").find(".tab").attr("id");
  //   freeOcx(tabName);
    
     
     // remove tab and related content
     var contentName = tabName + "_content";
    // remove element from array
    removeElement(tabName,plugin);
     
     $("#" + contentName).remove();
     $("#tabs li.current").remove();
     if(isShowLastTab==true){
    	 showLastTab();
     }
    
        
}
/**
 * 获取当前选中的TAB的标题
 * @return
 */
function getCurrentTabTitle(){
	 var plugin= $("#tabs li.current").find(".tab").html();
	 return plugin;
}
/**
 * if there is no current tab and if there are still tabs left, show the first one
 * @return
 */
function showLastTab(){
	 if ($("#tabs li.current").length == 0 && $("#tabs li").length > 0) {

         // find the first tab    
         var lasttab = $("#tabs li:last-child");
         lasttab.addClass("current");

         // get its link name and show related content
         var lasttabid = $(lasttab).find("a.tab").attr("id");
         $("#" + lasttabid + "_content").show();
     }
}


/**
 * close all tab
 * @return
 */
function closeAllTab() {
	/*  for (var j=0;j<tabs.length;j++){
		  freeOcx(tabs[j]);  
	  }*/
	$("#tabs li").remove();
	$("#content p").remove();
	tabsName=new Array();
	tabs=new Array();
	
}
/**
 * 刷新当前选中的页面
 * @return
 */
function refresh(){
	
	 var tabName= $("#tabs li.current").find(".tab").attr("id");
	 $("#"+tabName+"_content").html($("#"+tabName+"_content").html());   //选中并刷新
 
}


/**
 * 选中指定标题的tab
 * @param plugin
 * @return
 */
function refresh_select(plugin,isRefresh){
	 $("#tabs li").removeClass("current");
     $("#content p").hide();
    
     for (var j=0;j<tabsName.length;j++)
 	{
 		if(tabsName[j]==plugin){
 			if(isRefresh==true){
 				$("#"+tabs[j]+"_content").html($("#"+tabs[j]+"_content").html());   //选中并刷新
 			}else{
 				$("#"+tabs[j]+"_content").show();   //选中不刷新
 			}
 			$("#"+tabs[j]).parent().addClass("current");
 			$("#"+tabs[j]+"_content").show();
 			break;
 		}
 	}
   
}
/**
 * remove element from array
 * @param tab
 * @param plugin
 * @return
 */
function removeElement(tab,plugin){
	
	for (var i=0;i<tabs.length;i++)
	{
		if(tabs[i]==tab){
			tabs.splice(i, 1);
			break;
		}
	}
	for (var j=0;j<tabsName.length;j++)
	{
		if(tabsName[j]==plugin){
			tabsName.splice(j, 1);
			break;
		}
	}
    
}
 function openNew(plugin, url) {
        	
	 if (tabs.length >= 8) {
			alert( '最多可以同时打开8个tab');
			return;
		}
	 if(exits(plugin)==true){
		 refresh_select(plugin,true);
		  top.frames['I1'].selectTreeTab(plugin);
		 return;
	 }
            var tabName="tab"+tabs.length;
            var contentName=tabName+"_content";
            // hide other tabs
            $("#tabs li").removeClass("current");
            $("#content p").hide();
            if(plugin=="welcome"){
            	  // add new tab and related content
                $("#tabs").append("<li class='current'><a class='tab' id='" +
                		tabName + "' href='#'>" + plugin + 
                    "</a></li>");
            }else{
            	  // add new tab and related content
                $("#tabs").append("<li class='current'><a class='tab' id='" +
                		tabName + "' href='#'>" + plugin + 
                    "</a><a href='#' class='remove'>X</a></li>");
            }
          

            var content = '<iframe scrolling="auto" frameborder="0" id="iframe'
    			+  tabs.length + '" src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $("#content").append("<p id='" + contentName + "'>" + 
            		content + "</p>");
            
            // set the newly added tab as current
            $("#" +contentName).show();
            tabs.push(tabName);
            tabsName.push(plugin);
        }
 
$(document).ready(function() {
           /* $("#documents a").click(function() {
               // addTab($(this));
            	openNew(plugin, url);
            });*/

            $('#tabs a.tab').live('click', function() {
                // Get the tab name
                var tabName = $(this).attr("id") ;

                // hide all other tabs
                $("#content p").hide();
                $("#tabs li").removeClass("current");

                // show current tab
                $("#" + tabName+"_content").show();
                $(this).parent().addClass("current");
                
                top.frames['I1'].selectTreeTab($(this).html());
                //如果是welcome页面，强制刷新
                if($(this).html()=="welcome"){
                	 $("#" + tabName+"_content").html($("#"+tabName+"_content").html());
                }
            });

            $('#tabs a.remove').live('click', function() {
                // Get the tab name
                var tabName = $(this).parent().find(".tab").attr("id");
                //freeOcx(tabName);  
            
                // remove tab and related content
                var contentName = tabName + "_content";
               // remove element from array
               removeElement(tabName,$(this).parent().find(".tab").html());
                
                $("#" + contentName).remove();
                $(this).parent().remove();

                // if there is no current tab and if there are still tabs left, show the last one
                if ($("#tabs li.current").length == 0 && $("#tabs li").length > 0) {

                    // find the first tab    
                    var lasttab = $("#tabs li:last-child");
                    lasttab.addClass("current");

                    // get its link name and show related content
                    var lasttabid = $(lasttab).find("a.tab").attr("id");
                    $("#" + lasttabid + "_content").show();
                    
                    top.frames['I1'].selectTreeTab($(lasttab).find("a.tab").html());
                    
                }
               
               
            });
        });