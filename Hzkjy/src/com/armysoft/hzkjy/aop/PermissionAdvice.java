package com.armysoft.hzkjy.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.armysoft.hzkjy.annotation.PermissionsAnno;
import com.armysoft.hzkjy.base.util.CookieUtil;
import com.armysoft.hzkjy.base.common.WebConstant;
import com.armysoft.hzkjy.exception.NoPermissionExp;


@Aspect
public class PermissionAdvice {
	
	/** 调用controller方法之前  */
	@Before("execution(* com.armysoft.motorcar.controller.*.*.*(..))")
	public void invokeBefore(JoinPoint jp){
//		Method method = ((MethodSignature) jp.getSignature()).getMethod(); 
//		if(method.isAnnotationPresent(PermissionsAnno.class)){
//			String permValue = method.getAnnotation(PermissionsAnno.class).value().getEnName();
//			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//			permValue = CookieUtil.getUserCookieId(request) + WebConstant.SEPARATOR + permValue;
//	        if(!WebConstant.getResourcesMap().contains(permValue)){
//	        	throw new NoPermissionExp("用户权限不足�?);
//	        }
//		}
		System.out.println("开始");
	}
}
