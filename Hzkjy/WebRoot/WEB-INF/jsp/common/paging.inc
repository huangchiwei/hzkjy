<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.armysoft.core.Pagination"%>
 
<script language="JavaScript" type="text/javascript">
  	function changePageNo(pageNo)
	{ 
		with (document.getElementById("form1")) {
			method = "post";
			//action = pageNo.toString();
			action=getAction(action,pageNo);
			submit();
		} 
  		//window.location.href= pageNo.toString();
 
	}
function getAction(action,pageNo){
		try{
			if (action==null || action==""){return pageNo.toString();}
			var pos=action.lastIndexOf("/");
			alert(pos);
			var url=action.substring(0,pos+1);
			return url+pageNo+".html";
		}catch(e){
			alert(e.message);
		}
	}
function OrderByFun(columnName)
{
   
  var  orderByColumn=document.getElementById("orderByColumn");
  var  orderByType=document.getElementById("orderByType");
  if(columnName==orderByColumn.value)
  {
    if(orderByType.value=="asc")
    {
    	orderByType.value="desc";
    }
    else
    {
    	orderByType.value="asc";
    }
  }
  else
  {
    orderByColumn.value=columnName;
    orderByType.value="asc";
  }
  document.forms[0].submit();
}
</script>
<%
    Pagination pagenav=(Pagination)request.getAttribute("page");
 %>
<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize }">
<input id="newsCategory" name="newsCategory" type="hidden" value="${newsCategory}">
<div class="fenye">
			${page.currentPage }/ ${page.pageCount}页 ，共 ${page.totalRowCount } 记录
			
			|&nbsp;&nbsp;
		    <%
		    if(pagenav.getCurrentPage()==1)
		      {
		        out.print(" 首 页 ");  }else
		      {
		          out.print(" <a href=\"javascript:changePageNo(1);\">首 页</a> ");
		    
		      }
		      
		      if(pagenav.getCurrentPage()>1)
		      {
		         out.print(" <a href=\"javascript:changePageNo("+(pagenav.getCurrentPage()-1)+");\">上一页</a> ");
		      }else
		      {
		         out.print(" 上一页 ");
		      }
		      
		      if(pagenav.getCurrentPage()<pagenav.getPageCount())
		      {
		         out.print(" <a href=\"javascript:changePageNo("+(pagenav.getCurrentPage()+1)+");\">下一页</a> ");
		      }else
		      {
		         out.print(" 下一页 ");
		      }
		      
		      if(pagenav.getCurrentPage()==pagenav.getPageCount())
		      {
		           out.print(" 尾 页");
		      }else
		      {
		            out.print(" <a href=\"javascript:changePageNo("+(pagenav.getPageCount())+");\">尾 页</a> ");
		            		 
		      }
		    %>
			
			
			&nbsp;&nbsp;|			转
			<input name="currentPage"  style="width:30px;height=20px"  id="currentPage"
				value="<%=pagenav.getCurrentPage() %>" 
				onkeyup="value=value.replace(/[^\d]/g,'') " 
				onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
			<input type="button" value="" onclick="changePageNo($('#currentPage').val());" style="height:19px;width:33px;margin:0px 0px 0px 0px;border:0px;cursor:pointer;background:url(${ctx }/theme/default/images/go1.gif) no-repeat">
		
</div>

