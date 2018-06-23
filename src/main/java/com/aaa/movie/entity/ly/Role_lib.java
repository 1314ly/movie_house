package com.aaa.movie.entity.ly;

import java.io.Serializable;
import java.util.List;

public class Role_lib implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer rid;
	private Integer lid;
	
	private List<Role> roleList;
	private List<Libarary> libList;
	public Role_lib() {
		super();
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public List<Libarary> getLibList() {
		return libList;
	}
	public void setLibList(List<Libarary> libList) {
		this.libList = libList;
	}
	
	@Override
	public String toString() {
		return "Role_lib [rid=" + rid + ", lid=" + lid + ", roleList="
				+ roleList + ", libList=" + libList + "]";
	}
	
}
