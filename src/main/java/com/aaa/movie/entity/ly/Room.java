package com.aaa.movie.entity.ly;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author S
 * @see 影厅
 */
public class Room implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer room_id;
	private String room_name;
	private Integer room_state;
	private String room_sit;
	private String room_class;
	private Integer emp_id;
	private Date room_createtime;
	
	public Room() {
		super();
	}

	public Integer getRoom_id() {
		return room_id;
	}

	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public Integer getRoom_state() {
		return room_state;
	}

	public void setRoom_state(Integer room_state) {
		this.room_state = room_state;
	}

	public String getRoom_sit() {
		return room_sit;
	}

	public void setRoom_sit(String room_sit) {
		this.room_sit = room_sit;
	}

	public String getRoom_class() {
		return room_class;
	}

	public void setRoom_class(String room_class) {
		this.room_class = room_class;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public Date getRoom_createtime() {
		return room_createtime;
	}

	public void setRoom_createtime(Date room_createtime) {
		this.room_createtime = room_createtime;
	}

	@Override
	public String toString() {
		return "Room [room_id=" + room_id + ", room_name=" + room_name
				+ ", room_state=" + room_state + ", room_sit=" + room_sit
				+ ", room_class=" + room_class + ", emp_id=" + emp_id
				+ ", room_createtime=" + room_createtime + "]";
	}
	
}
