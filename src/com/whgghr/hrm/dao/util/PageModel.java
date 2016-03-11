package com.whgghr.hrm.dao.util;

public class PageModel {
	
	private int page;
	private int pageSize;
	private long count;
	private int pageCount;
	
	public PageModel() {
		
		this.page = 1;
		this.pageSize = 4;
	}
	public int getPage() {
		if(page > this.getCount()) {
			page = this.pageCount;
		}
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize <= 0) {
			pageSize = 1;
		}
		this.pageSize = pageSize;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public int getPageCount() {
		this.pageCount = (int)( count % pageSize == 0 ? (count / pageSize) : (count / pageSize + 1) );
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}
