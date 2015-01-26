//页面表单验证，自动执行
function autoValidate(){
	
	validateRegex(false,"#roleNo","角色编号由6-20个数字、英文字母或者下划线组成",null,null,"角色编号由6-20个数字、英文字母或者下划线组成",false,"^\\w{6,20}$");
	validateMinMax(false,"#roleName","请输入角色名称",null,null,"角色名称不能为空",1,20,"size");
	
}