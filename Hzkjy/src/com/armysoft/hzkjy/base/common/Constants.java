package com.armysoft.hzkjy.base.common;

import java.io.IOException;
import java.util.Properties;
import java.util.Set;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public final class Constants {
	public final static Properties mailPros = Constants.getProperties("/mail/mail.properties");
	public final static String WEBSITE = "http://localhost:8080/gzjkjy/";
	//public static String solrServerUrl="http://192.168.2.182:8080/solr";
	//public static String solrServerUrl_biaoying="http://192.168.2.182:8080/solr_biaoying";
	/** 定义存放在cookie中的用户编号 */
	public static final String ADMIN_KEY = "admin_key";
	public static final String FRONT_KEY = "front_key";
	public static final String VERIFY_CODE = "verify_code";
	/** 分隔符 */
	public static final String SEPARATOR = "_";
	public static final Integer USER_ACTIVE = 1;
	/**默认密码*/
	public static final String DEFAULT_PASSWORD = "888888";
	public static String systemPath = "D:/gzjkjy_upfile/";
	/** 网络访问文件夹*/
	public final static String NET_FOLDER = "/gzjkjy_upfile/";
	/** */
	public final static String EXHIBIT_IMAGES = "images/exhibit_room/images/";
	/** */
	public final static String EXHIBIT_THUMB = "images/exhibit_room/thumbimages/";
	/** 所有用户权限 key:userNo_permValue */
	private static Set<String> resourcesMap = null;
	
	public static Set<String> getResourcesMap() {
		return resourcesMap;
	}
	public static void setResourcesMap(Set<String> resourcesMap) {
		Constants.resourcesMap = resourcesMap;
	}
	
	public static Properties getProperties(String path){
		Properties props = null;
		 ResourceLoader loader = new DefaultResourceLoader();  
		   Resource resource = loader.getResource(path);
		   try {
			 props = PropertiesLoaderUtils.loadProperties(resource);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return props;
	}
}
