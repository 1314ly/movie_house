/**
 * 
 */
package com.aaa.movie.entity.xw;

import java.sql.Date;

/**
 * @title : Users
 * @author : 情玖
 * @date : 2018年6月6日下午6:56:52
 */
public class Users {

	private Integer user_id;
	private String user_name;
	private String user_pwd;
	private String user_sex;
	private Date user_birth;
	private String user_phone;
	private Date user_createTime;
	private Integer user_states;

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public Date getUser_createTime() {
		return user_createTime;
	}

	public void setUser_createTime(Date user_createTime) {
		this.user_createTime = user_createTime;
	}

	public Integer getUser_states() {
		return user_states;
	}

	public void setUser_states(Integer user_states) {
		this.user_states = user_states;
	}

}
