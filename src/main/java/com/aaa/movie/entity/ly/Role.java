package com.aaa.movie.entity.ly;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.aaa.movie.util.ly.DateConverter;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer rid;
	private String rname;
	private Integer eid;
	// 后台接收前台字符串时转换为Date类型
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	// 前台显示后台返回的日期类型
	@JsonSerialize(using = DateConverter.class)
	private Date uptime;
	
	public Role() {
		super();
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Date getUptime() {
		return uptime;
	}

	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Role [rid=" + rid + ", rname=" + rname + ", eid=" + eid
				+ ", uptime=" + uptime + "]";
	}
}
