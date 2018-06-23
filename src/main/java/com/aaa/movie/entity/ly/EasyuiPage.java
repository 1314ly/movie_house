package com.aaa.movie.entity.ly;

import java.util.List;

/**
 * 
 * @author S
 * @see eazyui分页数据实体类
 */

@SuppressWarnings("rawtypes")
public class EasyuiPage {

	private List rows;// 显示的数据
	private Integer total;// 总条数

	public EasyuiPage() {
		super();
	}

	public EasyuiPage(List rows, Integer total) {
		super();
		this.rows = rows;
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

}
