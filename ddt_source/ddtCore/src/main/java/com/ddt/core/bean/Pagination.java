/*
 * @(#)Pagination.java 2014-7-24
 *
 * Copyright 2014 ddt, Inc. All rights reserved.
 */
package com.ddt.core.bean;

/**
 * Pagination.java
 *
 * @author     <A HREF="mailto:ruan635@163.com">Roy</A>
 * @version    1.0 2014-7-24
 * @since      1.0
 */
public class Pagination {
	
	private int page;
	
	private int limit = 5; 
	
	private int offset;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		if (page > 0) {
			offset = (page - 1) * limit;
		}
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
}
