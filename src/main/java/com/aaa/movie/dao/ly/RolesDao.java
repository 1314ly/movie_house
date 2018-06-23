package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

import com.aaa.movie.entity.ly.Role;

/**
 * 
 * @author S
 * @see 角色管理接口类
 */
public interface RolesDao {

	public List<Map<String, Object>> queryAll();
	
	public int add(Role r);
}
