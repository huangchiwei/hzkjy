//页面表单验证，自动执行
function autoValidate(){
	validateMinMax(false,"#qymc","请输入企业名称",null,null,"企业名称不能为空",1,20,"size");
	validateMinMax(false,"#qtfy","请输入其它费用",null,null,"其它费用不能为空",1,20,"size");
	validateMinMax(false,"#qyzj","请输入企业租金",null,null,"企业租金不能为空",1,20,"size");
	validateMinMax(false,"#glfwf","请输入管理服务费",null,null,"管理服务费不能为空",1,20,"size");
	validateMinMax(false,"#qydf","请输入企业电费",null,null,"企业电费不能为空",1,20,"size");
	validateMinMax(false,"#qysf","请输入企业水费",null,null,"企业水费不能为空",1,20,"size");
	validateMinMax(false,"#jfyd","请输入缴费年月",null,null,"缴费年月不能为空",1,20,"size");
	
}