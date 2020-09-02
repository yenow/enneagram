package com.enneagram.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QueryNumber {
	private int startNum;
	private int endNum;
	private int pageNum;
	private int count;
	
	public QueryNumber() {
		this(1,9);
	}
	
	public QueryNumber(int pageNum, int count) {
		this.count = count;
		this.pageNum = pageNum;
	}
	
	public void setPageNumEndNum() {
		this.endNum = pageNum*count;
		this.startNum = endNum-count+1;
	}
}
