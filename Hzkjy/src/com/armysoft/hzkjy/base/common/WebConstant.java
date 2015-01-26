package com.armysoft.hzkjy.base.common;

import java.util.Set;

/**
 * 常量�?
 */
public final class WebConstant {
	
	/** 定义存放在Session中的验证�?*/
	public static final String VERIFY_CODE = "verify_code";
	/** 定义存放在cookie中的用户编号 */
	public static final String COOKIE_KEY = "user_key";
	/** 监控多少时间内的信息（分钟）*/
	public static int MINS = 10;
	/** 图表时间轴的展示时间间隔 (毫秒)*/
	public static int SECONDS = 30000;
	/** 用户�?��状�? */
	public static final int USER_ACTIVE = 1;
	/** database参数类型 */
	public static final int PARAM_TYPE_6 = 6;
	/** busservice参数类型 */
	public static final int PARAM_TYPE_8 = 8;
	/** 分隔�?*/
	public static final String SEPARATOR = "_";
	/** 页面样式文件�?*/
	public static String cssFile = "default";
	/** �?��用户权限 key:userNo_permValue */
	private static Set<String> resourcesMap = null;
	
	public static Set<String> getResourcesMap() {
		return resourcesMap;
	}
	public static void setResourcesMap(Set<String> resourcesMap) {
		WebConstant.resourcesMap = resourcesMap;
	}
	
	
}
