var registTypeJson = [{id:'0',value:'内资'},{id:'110',value:'国有'},{id:'120',value:'集体'},{id:'130',value:'股份合作'},{id:'141',value:'国有联营'},{id:'142',value:'集体联营'},{id:'143',value:'国有与集体联营'},{id:'149',value:'其他联营 '},{id:'151',value:'国有独资联营'},{id:'159',value:'其他有限责任公司'},{id:'160',value:'股份有限公司'},{id:'171',value:'私营独资'},{id:'172',value:'私营合伙'},{id:'173',value:'私营有限责任公司'},{id:'174',value:'私营股份有限公司'},{id:'190',value:'其他'},{id:'0',value:'港澳台商投资'},{id:'210',value:'与港澳台商合资经营'},{id:'220',value:'与港澳台商合作经营'},{id:'230',value:'港澳台商独资'},{id:'240',value:'港澳台商投资股份有限公司'},{id:'290',value:'其他港澳台商投资'},{id:'0',value:'外商投资'},{id:'310',value:'中外合资经营'},{id:'320',value:'中外合作经营'},{id:'330',value:'外资企业'},{id:'340',value:'外商投资股份有限公司'},{id:'390',value:'其他外商投资'}];
var isFlag = false;
$(function(){
	$.each(registTypeJson,function(i,item){
		if(item.id == '0'){
			$('#qydjzclx').append('<option style="background-color: #ffa426" disabled="disabled" value="' + item.id + '">' + item.value + '</option>');
		}else{
			$('#qydjzclx').append('<option value="' + item.id + '">&nbsp;&nbsp;&nbsp;&nbsp;' + item.value + '</option>');
		}
	});
	var strRegex = "((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?"
	var telReg = /^0\d{2,3}-?\d{7,8}$/;
	var phoneReg = /^1[3|4|5|8]\d{9}$/;
	/*var strRegex = '^((https|http|ftp|rtsp|mms)?://)' 
	+ '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@ 
	+ '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184 
	+ '|' // 允许IP和DOMAIN（域名） 
	+ '([0-9a-z_!~*\'()-]+.)*' // 域名- www. 
	+ '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名 
	+ '[a-z]{2,6})' // first level domain- .com or .museum 
	+ '(:[0-9]{1,4})?' // 端口- :80 
	+ '((/?)|' // a slash isn't required if there is no file name 
	+ '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$'; */
	var re = new RegExp(strRegex);
	var obj;
	var token = true;
	$("#sumbit_bt").click(function(){
		if(token){
			token = false;
		}else{
			return false;
		}
		var msg = '';
		if($.trim($("#qymc").val()) == ''){
			msg = '请填写企业名称';
			obj = $("#qymc");
		}else if($("#address").val() != '' && (!re.test($("#address").val()))){
			msg = '请填写正确的网址，以http://开头';
			obj = $("#address");
		}else if($.trim($("#email").val()) == ''){
			msg = '请填写邮箱';
			obj = $("#email");
		}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test($("#email").val()))){
			msg = '请填写正确的邮箱';
			obj = $("#email");
		}else if(!isFlag){
			msg = '该邮箱已注册';
			obj = $("#email");
		}else if($("#zydy").val() == ''){
			msg = '请填写租用地址';
			obj = $("#zydy");
		}else if($("#mj").val() == ''){
			msg = '请填写租用面积';
			obj = $("#mj");
		}else if(!/^\d+([\.]\d{1,2})?$/.test($("#mj").val())){
			msg = '租用面积请填写数字,最多两位小数.';
			obj = $("#mj");
		}else if($("#zczb").val() == ''){
			msg = '请填写注册资金';
			obj = $("#zczb");
		}else if(!/^\d+$/.test($("#zczb").val())){
			msg = '注册资金请填写数字';
			obj = $("#zczb");
		}else if($("#frdb").val() == ''){
			msg = '请填写法人代表';
			obj = $("#frdb");
		}else if($.trim($("#frlxdh").val()) == ''){
			obj = $("#frlxdh");
			msg = '请填写法人电话';
		}else if ((!telReg.test($("#frlxdh").val())) && (!phoneReg.test($("#frlxdh").val()))){
			msg = "法人电话格式不正确：区号+电话或手机号码";
			obj = $("#frlxdh");
		}else if($("#lxr").val() == ''){
			msg = '请填写联系人';
			obj = $("#lxr");
		}else if($("#lxrdh").val() == ''){
			msg = '请填写联系电话';
			obj = $("#lxrdh");
		}else if((!telReg.test($("#lxrdh").val())) && (!phoneReg.test($("#lxrdh").val()))){
			msg = "联系电话格式不正确：区号+电话或手机号码";
			obj = $("#lxrdh");
		}else if($("#qydjzclx").val() == '0'){
			msg = '请选择企业登记注册类型';
			obj = $("#qydjzclx");
		}else if($.trim($("#zzjgdm").val()) == ''){
			msg = '请填写组织机构代码';
			obj = $("#zzjgdm");
		}else if (!/^[a-zA-Z0-9]{9}$/.test($("#zzjgdm").val())){
			msg = "组织机构代码由9个字符长度由字母或数字组成";
			obj = $("#zzjgdm");
		}else if($("#qyclsj").val() == ''){
			msg = '请填写企业成立时间';
			obj = $("#qyclsj");
		}else if($("#htstze").val() == ''){
			msg = '请填写风险投资额';
			obj = $("#htstze");
		}else if(!/^\d+$/.test($("#htstze").val())){
			msg = '风险投资额请填写数字';
			obj = $("#htstze");
		}else if($("#dzys").val() == ''){
			msg = '请填写在孵企业大专人数';
			obj = $("#dzys");
		}else if(!/^\d+$/.test($("#dzys").val())){
			msg = '在孵企业大专人员请填写数字';
			obj = $("#dzys");
		}else if($("#xnyjdxs").val() == ''){
			msg = '请填写在孵企业大学应届生人数';
			obj = $("#xnyjdxs");
		}else if(!/^\d+$/.test($("#xnyjdxs").val())){
			msg = '在孵企业大学应届生请填写数字';
			obj = $("#xnyjdxs");
		}else if($("#fmzl").val() == ''){
			msg = '请填写发明专利';
			obj = $("#fmzl");
		}else if(!/^\d+$/.test($("#fmzl").val())){
			msg = '发明专利请填写数字';
			obj = $("#fmzl");
		}else if($("#wgsj").val() == ''){
			msg = '请填写外观设计';
			obj = $("#wgsj");
		}else if(!/^\d+$/.test($("#wgsj").val())){
			msg = '外观设计请填写数字';
			obj = $("#wgsj");
		}else if($("#syxx").val() == ''){
			msg = '请填写实用新型';
			obj = $("#syxx");
		}else if(!/^\d+$/.test($("#syxx").val())){
			msg = '实用新型请填写数字';
			obj = $("#syxx");
		}else if($("#rjzzq").val() == ''){
			msg = '请填写软件著作权';
			obj = $("#rjzzq");
		}else if(!/^\d+$/.test($("#rjzzq").val())){
			msg = '软件著作权请填写数字';
			obj = $("#rjzzq");
		}
		if(msg == ''){
			return true;
		}
		token = true;
		if(obj.attr('id') != 'qyclsj')
			obj.focus();
		layer.tips(msg, obj[0] , {guide: 0, time: 3});
		return false;
	});
	$("#qymc").focus();
	
	$('#qymc').change(function(){
		if($.trim(this.value) == ''){
			$('#qymc_img').css('display','none');
		}else{
			$('#qymc_img').css('display','');
		}
	});
	$('#address').change(function(){
		if(this.value == ''){
			$('#address_img').css('display','none');
		}else if(re.test(this.value)){
			$('#address_img').css('display','');
		}else if(!re.test(this.value)){
			$('#address_img').css('display','none');
		}
	});
	$('#zydy').change(function(){
		if(this.value == ''){
			$('#zydy_img').css('display','none');
		}else{
			$('#zydy_img').css('display','');
		}
	});
	$('#mj').change(function(){
		if(this.value == '' || (!/^\d+([\.]\d{1,2})?$/.test(this.value))){
			$('#mj_img').css('display','none');
		}else{
			$('#mj_img').css('display','');
		}
	});
	$('#zczb').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#zczb_img').css('display','none');
		}else{
			$('#zczb_img').css('display','');
		}
	});
	$('#frdb').change(function(){
		if(this.value == ''){
			$('#frdb_img').css('display','none');
		}else{
			$('#frdb_img').css('display','');
		}
	});
	$('#frlxdh').change(function(){
		if(this.value == '' || ((!telReg.test(this.value)) && (!phoneReg.test(this.value)))){
			$('#frlxdh_img').css('display','none');
		}else{
			$('#frlxdh_img').css('display','');
		}
	});
	$('#lxr').change(function(){
		if(this.value == ''){
			$('#lxr_img').css('display','none');
		}else{
			$('#lxr_img').css('display','');
		}
	});
	$('#lxrdh').change(function(){
		if(this.value == '' || ((!telReg.test(this.value)) && (!phoneReg.test(this.value)))){
			$('#lxrdh_img').css('display','none');
		}else{
			$('#lxrdh_img').css('display','');
		}
	});
	$('#qydjzclx').change(function(){
		if(this.value == '0'){
			$('#qydjzclx_img').css('display','none');
		}else{
			$('#qydjzclx_img').css('display','');
		}
	});
	$('#zzjgdm').change(function(){
		if(this.value == '' || (!/^[a-zA-Z0-9]{9}$/.test(this.value))){
			$('#zzjgdm_img').css('display','none');
		}else{
			$('#zzjgdm_img').css('display','');
		}
	});
	$('#qyclsj').blur(function(){
		if(this.value == ''){
			$('#qyclsj_img').css('display','none');
		}else{
			$('#qyclsj_img').css('display','');
		}
	});
	$('#htstze').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#htstze_img').css('display','none');
		}else{
			$('#htstze_img').css('display','');
		}
	});
	$('#dzys').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#dzys_img').css('display','none');
		}else{
			$('#dzys_img').css('display','');
		}
	});
	$('#xnyjdxs').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#xnyjdxs_img').css('display','none');
		}else{
			$('#xnyjdxs_img').css('display','');
		}
	});
	$('#fmzl').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#fmzl_img').css('display','none');
		}else{
			$('#fmzl_img').css('display','');
		}
	});
	$('#wgsj').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#wgsj_img').css('display','none');
		}else{
			$('#wgsj_img').css('display','');
		}
	});
	$('#syxx').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#syxx_img').css('display','none');
		}else{
			$('#syxx_img').css('display','');
		}
	});
	$('#rjzzq').change(function(){
		if(this.value == '' || (!/^\d+$/.test(this.value))){
			$('#rjzzq_img').css('display','none');
		}else{
			$('#rjzzq_img').css('display','');
		}
	});
	
});