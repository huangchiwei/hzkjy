package com.armysoft.hzkjy.base.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.base.util.CookieUtil;


public class HtmlControlTag extends SimpleTagSupport {
	
	private String attrName;
	private String permValue;
	private boolean isShow = false;
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		if(StringUtils.hasText(permValue)){
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			String userNo = CookieUtil.getUserCookieValue(request);
			if("admin".equalsIgnoreCase(userNo)){//默认admin是超级管理员，不作拦�?
				isShow = true;
			}else{
				if(WebConstant.getResourcesMap().contains(userNo + "_" + permValue)){
					isShow = true;
				}
			}
			
		}
		if(isShow)
		{
			super.getJspContext().getOut().print("");
		}else{
			if("display".equalsIgnoreCase(attrName)){
				attrName = attrName + "='none'";
			}else if("disabled".equalsIgnoreCase(attrName)){
				attrName = "disabled style='color:#cccccc'";
			}else {
				attrName = "";
			}
			super.getJspContext().getOut().print(attrName);
		}
		
	}
	public String getAttrName() {
		return attrName;
	}
	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	public String getPermValue() {
		return permValue;
	}
	public void setPermValue(String permValue) {
		this.permValue = permValue;
	}

}
