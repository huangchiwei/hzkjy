package org.gzjr.web.page;

/**
 * 
 * 
 * Filename:    PageUnit.java  
 * Description:   记得说点啥！！！
 * Copyright:   Copyright (c) 2012 刘新  
 * Company:    gzjr 
 * @author:     刘新  
 * @version:    1.0  
 * Create at:   2012-7-12 上午10:35:59 
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2012-7-12       刘新        1.0        1.0 Version
 */
public class PageUnit
{
  private String orderByColumn;
  private String orderByType;
  private int pageSize;
  private int currentPage = 1;
  protected int totalRowCount;
  protected int startRowNumber;
  protected int endRowNumber;
  protected int pageCount;

  public PageUnit()
  {
    this.orderByType = "asc";
    this.orderByColumn = "id";
    this.pageSize = 10;
  }

  public PageUnit(int page) {
    this.orderByType = "asc";
    this.orderByColumn = "id";
    this.pageSize = 10;
    this.currentPage = page;
  }

  public void init() {
    if ((this.currentPage <= 0) || (this.totalRowCount < 0) || (this.pageSize <= 0)) {
      throw new RuntimeException("illegal page argument: " + this.currentPage + 
        ", " + this.pageSize + ", " + this.totalRowCount);
    }
    this.pageCount = ((this.totalRowCount % this.pageSize == 0) ? this.totalRowCount / this.pageSize : 
      this.totalRowCount / this.pageSize + 1);

    if (this.currentPage > this.pageCount) {
      this.currentPage = this.pageCount;
    }
    this.startRowNumber = ((this.currentPage - 1) * this.pageSize);

    if (this.pageCount == 0) {
      this.startRowNumber = 0;
    }
    this.endRowNumber = ((this.currentPage * this.pageSize > this.totalRowCount) ? this.totalRowCount : 
      this.currentPage * this.pageSize);
    if (this.currentPage < 1) {
        this.currentPage = 1;
      }
  }

  public void setCurrentPage(int currentPage)
  {
    if (currentPage < 1) currentPage = 1;
    this.currentPage = currentPage;
  }

  public void setTotalRowCount(int totalRowCount)
  {
    this.totalRowCount = totalRowCount;
  }

  public void setPageSize(int pageSize)
  {
    this.pageSize = pageSize;
  }

  public int getCurrentPage()
  {
    return this.currentPage;
  }

  public int getPageCount()
  {
    return this.pageCount;
  }

  public int getPageSize()
  {
    return this.pageSize;
  }

  public int getStartRowNumber()
  {
    return this.startRowNumber;
  }

  public int getEndRowNumber()
  {
    return this.endRowNumber;
  }

  public int getTotalRowCount()
  {
    return this.totalRowCount;
  }

  public String getOrderByColumn()
  {
    return this.orderByColumn;
  }

  public void setOrderByColumn(String orderByColumn) {
    this.orderByColumn = orderByColumn;
  }

  public String getOrderByType() {
    return this.orderByType;
  }

  public void setOrderByType(String orderByType) {
    this.orderByType = orderByType;
  }
}