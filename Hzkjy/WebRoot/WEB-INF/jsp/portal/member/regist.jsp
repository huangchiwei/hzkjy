<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广州市海珠科技产业园有限公司</title>
<link rel="stylesheet" href="${ctx}/js/bootstrap3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${ctx}/js/bootstrap3/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="${ctx}/js/bootstrap3/css/bootstrapValidator.min.css"/>
<script src="${ctx}/js/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/js/bootstrap3/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap3/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.min.js"></script>
<script>
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
 //       container: 'tooltip',
//        trigger: 'blur',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	qymc: {
                validators: {
	                    notEmpty: {
	                        message: '请填写企业名称'
	                    }
	                }
	        },
            email: {
                validators: {
                    notEmpty: {
                        message: '请填写邮箱'
                    },
                    emailAddress: {
                            message: '请填写正确的邮箱'
                    },
                    remote: {
                            url: "${ctx}/portal/memberBasic/validEmail.json?random=" + Math.random(),
                            type: "post",
                            async: false,
                            data:
                                 {
                                     username: function(validator)
                                     {
                                         return $('#defaultForm :input[name="email"]').val();
                                     }
                                 },
                            message: '该邮箱已注册',
                    }
                }
            },
            address: {
                    validators: {
                    	uri: {
	                        allowLocal: true,
	                        message: '请填写正确的网址以http://开头'
	                    }
                    }
             },
            zydy: {
                    validators: {
                        notEmpty: {
                            message: '请填写租用地址'
                        }
                    }
             },
             mj: {
                    validators: {
                        notEmpty: {
                            message: '请填写租用面积'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '租用面积请填写数字'
                        }
                    }
             },
             zczb: {
                    validators: {
                        notEmpty: {
                            message: '请填写租注册资本'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '注册资本请填写数字'
                        }
                    }
             },
             frdb: {
                validators: {
	                    notEmpty: {
	                        message: '请填写法人代表'
	                    }
	                }
	        },
	        frlxdh: {
            	validators: {
            		notEmpty: {
	                        message: '请填写法人联系电话'
	                },
            		phone: {
            			message: '请填写正确的法人联系电话',
            			country: 'GB'
            		}
            	}
            },
            lxr: {
                validators: {
	                    notEmpty: {
	                        message: '请填写联系人'
	                    }
	                }
	        },
	        lxrdh: {
            	validators: {
            		notEmpty: {
	                        message: '请填写联系电话'
	                },
            		phone: {
            			message: '请填写正确的联系电话',
            			country: 'GB'
            		}
            	}
            },
            qydjzclx: {
                validators: {
                    notEmpty: {
                        message: '请选择企业登记注册类型'
                    }
                }
            },
            zzjgdm: {
                    validators: {
                        notEmpty: {
                            message: '请填写组织机构代码'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]{9}$/,
                            message: '组织机构代码由9个字符长度由字母或数字组成'
                        }
                    }
            },
            qyclsj: {
                    validators: {
                        notEmpty: {
                            message: '请填写企业成立时间'
                        }
                    }
            },
            htstze: {
                    validators: {
                        notEmpty: {
                            message: '请填写风险投资额'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '风险投资额请填写数字'
                        }
                    }
             },
             dzys: {
                    validators: {
                        notEmpty: {
                            message: '请填写在孵企业大专人数'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '在孵企业大专人员请填写数字'
                        }
                    }
             },
             xnyjdxs: {
                    validators: {
                        notEmpty: {
                            message: '请填写在孵企业大学应届生人数'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '在孵企业大学应届生请填写数字'
                        }
                    }
             },
             fmzl: {
                    validators: {
                        notEmpty: {
                            message: '请填写发明专利'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '发明专利请填写数字'
                        }
                    }
             },
             wgsj: {
                    validators: {
                        notEmpty: {
                            message: '请填写外观设计'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '外观设计请填写数字'
                        }
                    }
             },
             syxx: {
                    validators: {
                        notEmpty: {
                            message: '请填写实用新型'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '实用新型请填写数字'
                        }
                    }
             },
             rjzzq: {
                    validators: {
                        notEmpty: {
                            message: '请填写软件著作权'
                        },
                        regexp: {
                            regexp: /^\d+$/,
                            message: '软件著作权请填写数字'
                        }
                    }
             }
        }
    });
});
var registTypeJson = [{id:'0',value:'内资'},{id:'110',value:'国有'},{id:'120',value:'集体'},{id:'130',value:'股份合作'},{id:'141',value:'国有联营'},{id:'142',value:'集体联营'},{id:'143',value:'国有与集体联营'},{id:'149',value:'其他联营 '},{id:'151',value:'国有独资联营'},{id:'159',value:'其他有限责任公司'},{id:'160',value:'股份有好公司'},{id:'171',value:'私营独资'},{id:'172',value:'私营合伙'},{id:'173',value:'私营有限责任公司'},{id:'174',value:'私营股份有限公司'},{id:'190',value:'其他'},{id:'0',value:'港澳台商投资'},{id:'210',value:'与港澳台商合资经营'},{id:'220',value:'与港澳台商合作经营'},{id:'230',value:'港澳台商独资'},{id:'240',value:'港澳台商投资股份有限公司'},{id:'290',value:'其他港澳台商投资'},{id:'0',value:'外商投资'},{id:'310',value:'中外合资经营'},{id:'320',value:'中外合作经营'},{id:'330',value:'外资企业'},{id:'340',value:'外商投资股份有限公司'},{id:'390',value:'其他外商投资'}];
$(function(){
	
	$.each(registTypeJson,function(i,item){
		if(item.id == '0'){
			$('#qydjzclx').append('<option style="background-color: #ffa426" disabled="disabled" value="' + item.id + '">' + item.value + '</option>');
		}else{
			$('#qydjzclx').append('<option value="' + item.id + '">&nbsp;&nbsp;&nbsp;&nbsp;' + item.value + '</option>');
		}
	});
	
	$("#qymc").focus();
});
</script>
</head>

<body>

<div class="content">
<div class="reg_location">
 <h1>会员注册</h1>
 <div class="location">当前所在位置:<a href="${ctx}/portal/index.html">首页</a>&nbsp;&gt;&nbsp;会员注册</div>
</div>
<div class="reg_box">
 <div class="reg_b_ts">
  <h1>注册提示</h1>
  <div class="reg_b_ts_b">
   <h2> 注册前请确认:</h2>
   <p>1、贵公司的注册的企业名称必须是真实有效；</p>
   <p>2、贵公司是从事IT产业及其它高科技产业研发、生产、服务的企业。</p>
  </div>
 </div>
 <div class="zl_title"><b>用户填写资料</b>&nbsp;&nbsp;带<font class="c_ff0000"><b>*</b></font>为必填项</div>
 <form id="defaultForm" class="form-horizontal" action="${ctx}/portal/memberBasic/regist.html" method="post">
<input name="token" value="${token}" type="hidden"/>
 <div class="form-group">
 	<label for="qymc" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;企业名称:</label>
 	<div class="col-md-3">
      <input name="qymc" id="qymc" type="text" class="form-control" maxlength="100"/>
    </div>
    <label for="email" class="col-md-3 control-label">
    <font class="c_ff0000">*</font>&nbsp;电子邮箱:</label>
    <div class="col-md-3">
      <input name="email" id="email" class="form-control" maxlength="100"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="address" class="col-md-3 control-label">
 	企业网址:</label>
    <div class="col-md-3">
      <input id="address" name="address" type="text" class="form-control" maxlength="100" placeholder="http://" onclick="layer.tips('该网址将链接到科技园前台网站，以便于企业间互相了解，创造更多的合作机会！', this , {guide: 0, time: 2});"/>
    </div>
    <label for="zydy" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;租用地址:</label>
    <div class="col-md-3">
      <input id="zydy" name="zydy" type="text" class="form-control" maxlength="100"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="mj" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;租用面积:</label>
    <div class="col-md-3">
      	<input name="mj" id="mj" type="text" class="form-control" maxlength="20" placeholder="平方米"/>
    </div>
    <label for="zczb" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;注册资本:</label>
    <div class="col-md-3">
	      <input name="zczb" id="zczb" type="text" class="form-control" maxlength="20" placeholder="万元"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="frdb" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;法人代表:</label>
    <div class="col-md-3">
      	<input name="frdb" id="frdb" type="text" class="form-control" maxlength="20"/>
    </div>
    <label for="frlxdh" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;法人联系电话:</label>
    <div class="col-md-3">
		<input name="frlxdh" id="frlxdh" type="text" class="form-control" maxlength="20" placeholder="如:020-88888888"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="lxr" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;联系人:</label>
    <div class="col-md-3">
      	<input name="lxr" id="lxr" type="text" class="form-control" maxlength="20"/>
    </div>
    <label for="lxrdh" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;联系电话:</label>
    <div class="col-md-3">
	     <input name="lxrdh" id="lxrdh" type="text" class="form-control" maxlength="20" placeholder="如:020-88888888"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="qydjzclx" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;企业登记注册类型:</label>
    <div class="col-md-3">
      	<select name="qydjzclx" id="qydjzclx" class="form-control">
	      	<option value="" disabled="disabled">-- 请选择 --</option>
	      </select>
    </div>
    <label for="zzjgdm" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;组织机构代码:</label>
    <div class="col-md-3">
	     <input name="zzjgdm" id="zzjgdm" type="text" class="form-control" maxlength="20"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="qyclsj" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;企业成立时间:</label>
    <div class="col-md-3">
      	<input name="qyclsj" id="qyclsj" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="form-control"/>
    </div>
    <label for="htstze" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;获天使或风险投资额:</label>
    <div class="col-md-3">
	     <input name="htstze" id="htstze" type="text" class="form-control" maxlength="20" placeholder="万元"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="dzys" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;在孵企业大专以上人员:</label>
 	<div class="col-md-3">
	     <input name="dzys" id="dzys" type="text" class="form-control" maxlength="20" placeholder="人"/>
	 </div>
    <label for="xnyjdxs" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;在孵企业大学应届生:</label>
    <div class="col-md-3">
	     <input name="xnyjdxs" id="xnyjdxs" type="text" class="form-control" maxlength="20" placeholder="人"/>
	 </div>
  </div>
  
  <div class="form-group">
 	<label for="qyssjsly" class="col-md-3 control-label">
 	企业所属技术领域:</label>
    <div class="col-md-3">
      	<select name="qyssjsly" id="qyssjsly" class="form-control">
      	<option value="">-- 请选择 --</option>
          <option value="1">生物/医药技术业</option>
          <option value="2">电子与信息业</option>
          <option value="3">新材料技术/新材料业</option>
          <option value="4">展览服务</option>
          <option value="5">其他</option>
          <option value="6">工业</option>
        </select>
    </div>
    <label for="gxjsqy" class="col-md-3 control-label">
        高新技术企业:</label>
    <div class="col-md-3">
    	<select name="gxjsqy" id="gxjsqy" class="form-control">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="lxryqy" class="col-md-3 control-label">
 	留学人员企业:</label>
    <div class="col-md-3">
      	<select name="lxryqy" id="lxryqy" class="form-control">
          <option value="0">否</option>
          <option value="1">是</option>
         </select>
    </div>
    <label class="col-md-6">
       &nbsp;</label>
    
  </div>
  
<div class="well well-sm">到上一年为止拥有有效知识产权数:其中:</div>
 
 <div class="form-group">
 	<label for="fmzl" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;发明专利:</label>
    <div class="col-md-3">
      	<input id="fmzl" name="fmzl" type="text" class="form-control" maxlength="20" placeholder="件"/>
    </div>
    <label for="wgsj" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;外观设计:</label>
    <div class="col-md-3">
	     <input name="wgsj" id="wgsj" type="text" class="form-control" maxlength="20" placeholder="个"/>
    </div>
  </div>
  
  <div class="form-group">
 	<label for="syxx" class="col-md-3 control-label">
 	<font class=" c_ff0000">*</font>&nbsp;实用新型:</label>
    <div class="col-md-3">
      	<input id="syxx" name="syxx" type="text" class="form-control" maxlength="20" placeholder="件"/>
    </div>
    <label for="rjzzq" class="col-md-3 control-label">
    <font class=" c_ff0000">*</font>&nbsp;软件著作权:</label>
    <div class="col-md-3">
	     <input name="rjzzq" id="rjzzq" type="text" class="form-control" maxlength="20" placeholder="个"/>
    </div>
  </div>
  <div class="form-group">
  <div class="col-sm-offset-5 col-md-7">
     <button id="sumbit_bt" type="submit" class="btn btn-primary btn-lg">提交加入</button>
  </div>
  </div>
 </form>
     </div>
    </div>

</body>
</html>
