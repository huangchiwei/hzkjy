package org.armysoft.security.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 配置需要权限拦截
 * @author Administrator
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface PermissionsAnno {
	String value();
}
