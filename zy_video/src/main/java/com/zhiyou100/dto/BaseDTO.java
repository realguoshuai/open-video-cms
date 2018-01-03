package com.zhiyou100.dto;

import java.util.List;

public class BaseDTO<T> {
	// 数据总量
	private Integer count;
	// 当前页数据信息
	private List<T> rows;

	public BaseDTO() {
		super();
	}

	public BaseDTO(Integer count, List<T> rows) {
		super();
		this.count = count;
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "BaseDTO [count=" + count + ", rows=" + rows + "]";
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
