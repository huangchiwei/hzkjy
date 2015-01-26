//页面表单验证，自动执行
function autoValidate(){
	validateRegex(false,"#oldPwd","请输入旧密码",null,null,"密码由6-20个数字、英文字母或者下划线组成",false,"^\\w{6,20}$");
	validateRegex(false,"#newPwd","请输入新密码",null,null,"密码由6-20个数字、英文字母或者下划线组成",false,"^\\w{6,20}$");
	validateRepassword(false,"#newRePwd","请输入新重复密码","两次新旧密码必须一致哦",null,"重复密码不能为空","newPwd","新旧密码不一致,请确认");
	
}