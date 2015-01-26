package org.gzjr.web.page;

/**
 * 
 * 
 * Filename:    SqlUnit.java  
 * Description:   记得说点啥！！！
 * Copyright:   Copyright (c) 2012 刘新  
 * Company:    gzjr 
 * @author:     刘新  
 * @version:    1.0  
 * Create at:   2012-7-12 上午10:36:09 
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2012-7-12       刘新        1.0        1.0 Version
 */
public class SqlUnit
{
  private String key;
  private String sql;
  private Object val;

  public String getSql()
  {
    return this.sql; }

  public void setSql(String sql) {
    this.sql = sql; }

  public Object getVal() {
    return this.val; }

  public void setVal(String val) {
    this.val = val; }

  public String getKey() {
    return this.key; }

  public void setKey(String key) {
    this.key = key;
  }

  public SqlUnit(String key, String sql, Object val) {
    this.key = key;
    this.sql = sql;
    this.val = val;
  }
}
