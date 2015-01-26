<%@ page contentType="text/html;charset=UTF-8"%>
  



<script type="text/javascript">

function localHref(url,newsCategory,lawType){
	document.getElementById("newsCategory").value=newsCategory;
	if(typeof(lawType) != "undefined" && lawType!=null )document.getElementById("lawType").value=lawType;
	with (document.getElementById("headForm")) {
			method = "post";
			action = url;
			submit();
		} 
}
</script>


<form id="headForm" >
	<input  type="hidden" name="newsCategory"  id="newsCategory" value="${newsCategory}" />
	<input  type="hidden" name="lawType"  id="lawType" value="${lawType}" />
	<div class="top">
 <div class="w"><a href="#">设为首页</a>&nbsp;&nbsp;<span class="c_aeaeae">|</span>&nbsp;&nbsp;<a href="#">加入收藏</a></div>
</div>
<div class="index_logo relative">
  <div class="search_bj"></div>
  <div class="search_box"><label>搜索</label>
    <input name="input" type="text"  class="input"/>
  <div class="input_btn"><input name="" type="image" src="theme/default/images1/search.png"/></div></div>
 </div>
 <!--top_end-->
 <!--nav-->
<div class="w">
<div id="top_nav">
  <ul class="level1">
            <li class="level1-li"><a class="level1-a" href="${ctx}/">首页</a></li>
            <li class="level1-li"><a class="level1-a drop" href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','协会简介');">行业协会<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','协会简介');">协会简介</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','协会章程');">协会章程</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','协会制度');">协会制度</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','协会机构');">协会机构</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','入会指南');">入会指南</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/GetNetPage.html?','会费标准');">会费标准</a></li>
                    <li><a href="javascript:localHref('${ctx}/getportal/list/1.html?','会员名录');">会员名录</a><b></b></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
            <li class="level1-li"><a class="level1-a drop" href="#">行业协会<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="#" class="fly">协会动态</a><b></b><!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="javascript:localHref('${ctx}/getportallist/list/1.html?','协会动态');">协会公告</a></li>
                            <li><a href="javascript:localHref('${ctx}/getportallist/list/1.html?','协会动态');">协会通知</a></li>
                            <li><a href="javascript:localHref('${ctx}/getportallist/list/1.html?','协会动态');">活动简讯</a></li>
                            <li><a href="javascript:localHref('${ctx}/getportallist/list/1.html?','协会动态');">协会会刊</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a href="javascript:localHref('${ctx}/gethyhdnews/list/1.html?','会员活动');">会员活动</a></li>
                    <li><a href="javascript:localHref('${ctx}/gethyhdnews/list/1.html?','政策法规');">政策法规</a><b></b></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
            <li class="level1-li"><a class="level1-a drop" href="#">诚优活动<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="#">网上申报</a></li>
                    <li><a href="javascript:localHref('${ctx}/getzdscnews/list/1.html?','指导手册');">指导手册、评选标准</a></li>
                    <li><a href="javascript:localHref('${ctx}/getzdscnews/list/1.html?','诚优企业名单');">诚优企业名单</a></li>
                    <li><a href="#">诚信评价</a></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
            <li class="level1-li"><a class="level1-a drop" href="#">尾气治理<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a class="fly" href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','专修站');">专修站</a><b></b><!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','专修站');">简介</a></li>
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','专修站');">名录</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a class="fly" href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','示范企业');">示范企业<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','示范企业');">简介</a></li>
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','示范企业');">名录</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a class="fly" href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','工作动态');">工作动态<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','工作动态');">活动信息</a></li>
                            <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','工作动态');">培训信息</a><b></b></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','政策法规');">政策法规</a></li>
                    <li><a href="javascript:localHref('${ctx}/getzxjjnews/list/1.html?','案例分析');">案例分析</a></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
            <li class="level1-li"><a class="level1-a drop" href="#">二级维护<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="javascript:localHref('${ctx}/getewzcfg/list/1.html?','政策法规');">政策法规</a></a></li>
                    <li><a href="javascript:localHref('${ctx}/getewzcfg/list/1.html?','二维企业名单');">二维企业名单</a></li>
                    <li><a href="javascript:localHref('${ctx}/getewzcfg/list/1.html?','工作动态');">工作动态</a></li>
                    <li><a href="javascript:localHref('${ctx}/getewzcfg/list/1.html?','抽检情况通报');">抽检情况通报</a></li>
                    <li><a href="javascript:localHref('${ctx}/getewzcfg/list/1.html?','通告');">通告</a></li>
                    <li><a href="#">投诉与建议</a></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
            <li class="level1-li"><a class="level1-a drop" href="#">安全生产<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="javascript:localHref('${ctx}/getaqkpjg/list/1.html?','考评机构');">考评机构</a></li>
                    <li><a href="javascript:localHref('${ctx}/getaqkpjg/list/1.html?','政策法规');">政策法规</a></li>
                    <li><a href="javascript:localHref('${ctx}/getaqkpjg/list/1.html?','工作动态');">工作动态</a></li>
                    <li><a href="javascript:localHref('${ctx}/getaqkpjg/list/1.html?','达标情况');">达标情况</a></li>
                    <li><a href="#">下载中心</a></li>
                </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
           <li class="level1-li"><a class="level1-a drop" href="#">从业人员<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="#" class="fly">从业资格培训<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="#">开班通知</a></li>
                            <li><a href="#">培训报名</a></li>
                            <li><a href="#">考试通知</a></li>
                            <li><a href="#">考试报名</a></li>
                            <li><a href="#">考试成绩查询</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                    <li><a href="#" class="fly">继续教育培训<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="#">开班通知</a></li>
                            <li><a href="#">培训报名</a></li>
                            <li><a href="#">培训记录查询</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
                    <li><a href="#">资格证管理</a></li>
               </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
            <li class="level1-li left"><a class="level1-a drop" href="#">专家库<!--[if gte IE 7]><!--></a><!--<![endif]-->
            <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul class="level2">
                    <li><a href="#">网上申请</a></li>
                    <li><a href="#" class="fly">年度考核<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="#">年度考核填报</a></li>
                            <li><a href="#">出勤管理</a></li>
                            <li><a href="#">培训记录查询</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
                    <li><a href="#" class="fly">相关文件请<!--[if gte IE 7]><!--></a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul class="level3">
                            <li><a href="#">专家考核办法</a></li>
                            <li><a href="#">专家管理规定</a></li>
                        </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
                    <li><a href="#">专家名录</a></li>
               </ul>
            <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
            <li class="level1-li"><a class="level1-a" href="http://219.137.166.185:16808/">办公OA</a></li>
            <li class="level1-li"><a class="level1-a" href="#">交流论坛</a></li>
        </ul>
</div>
</div>
</form>
