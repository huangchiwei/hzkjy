package com.armysoft.hzkjy.base.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.util.StringUtils;

import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.CookieUtil;

public class PermissionTag extends TagSupport {

	private String permValue;
	@Override
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) super.pageContext.getRequest();
		if(StringUtils.hasText(permValue)){
			String userNo = CookieUtil.getUserCookieValue(request);
			if("admin".equalsIgnoreCase(userNo)){//默认admin是超级管理员，不作拦�?
				return EVAL_BODY_INCLUDE;
			}else{
				if(WebConstant.getResourcesMap().contains(CookieUtil.getUserCookieValue(request) + "_" + permValue)){
					return EVAL_BODY_INCLUDE;
				}
			}
		}
		return SKIP_BODY;
	}
	public String getPermValue() {
		return permValue;
	}
	public void setPermValue(String permValue) {
		this.permValue = permValue;
	}

	
}
