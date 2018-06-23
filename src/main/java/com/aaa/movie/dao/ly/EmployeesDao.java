package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

import com.aaa.movie.entity.ly.Employees;

/**
 * 
 * @author S
 * @see 员工管理对应操作
 */

public interface EmployeesDao {

	public List<Employees> checkEmp(Employees e);
	
	public List<Map<String, Object>> queryPage(String ename,Integer offset, Integer pageSize);

	// 获取登陆用户的详细信息
	public Map<String, Object> getLogEmp(String eid);
	
	public int add(Employees e);
	
	public int updEmp(Employees e);
	
	public int dels(String[] ids);
}
