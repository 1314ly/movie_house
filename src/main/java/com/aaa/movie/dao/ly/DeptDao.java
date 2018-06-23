package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

import com.aaa.movie.entity.ly.Dept;

/**
 * 
 * @author S
 * @see 部门管理对应操作
 */
public interface DeptDao {
	public List<Map<String,Object>> queryAll();
	public int edit(Dept d);
	public int add(Dept d);
	public int dels(int[] ids);
}
