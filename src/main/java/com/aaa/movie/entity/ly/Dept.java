package com.aaa.movie.entity.ly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.aaa.movie.util.ly.DateConverter;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 
 * @author S
 * @see 部门
 */
public class Dept implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer dept_id;
	private String dept_name;
	private Integer dept_upeid;
	// 后台接收前台字符串时转换为Date类型
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	// 前台显示后台返回的日期类型
	// @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using = DateConverter.class)
	private Date dept_time;
	
	public Dept() {
		super();
	}
	
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public Integer getDept_upeid() {
		return dept_upeid;
	}
	public void setDept_upeid(Integer dept_upeid) {
		this.dept_upeid = dept_upeid;
	}
	public Date getDept_time() {
		return dept_time;
	}
	public void setDept_time(Date dept_time) {
		this.dept_time = dept_time;
	}

	@Override
	public String toString() {
		return "Dept [dept_id=" + dept_id + ", dept_name=" + dept_name
				+ ", dept_upeid=" + dept_upeid + ", dept_time=" + dept_time
				+ "]";
	}
	
}
