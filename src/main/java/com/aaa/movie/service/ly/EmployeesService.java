package com.aaa.movie.service.ly;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.movie.dao.ly.EmployeesDao;
import com.aaa.movie.entity.ly.Employees;

/**
 * 
 * @author S
 * @see 员工管理业务逻辑层
 */
@Service
@Transactional
public class EmployeesService {

	@Autowired
	EmployeesDao empDao;

	// 登陆校验用户名密码
	public int checkEmp(Employees e, HttpSession session) {
			List<Employees> list = empDao.checkEmp(e);
			if (list.size() == 1) {
				session.setAttribute("logEmp", list.get(0));
				return 0;// 用户名密码正确
			} else if (list.size() > 1) {
				return 1;// 账号异常
			} else {
				return 2;// 登陆失败
			}
		}
		
	public List<Map<String, Object>> queryPage(String ename,Integer pageNum, Integer pageSize) {
		Integer offset = null;
		if (pageNum != null) {
			offset = (pageNum - 1) * pageSize;
		}
		return empDao.queryPage(ename,offset, pageSize);
	}

	public Map<String, Object> getLogEmp(String eid) {
		return empDao.getLogEmp(eid);
	}
    
	public int add(Employees e) {
		int rs = empDao.add(e);
		if(rs > 0){
			return 1;
		}else{
			return 0;
		}
	}
	
	public int updEmp(Employees e) {
		int rs = empDao.updEmp(e);
		System.out.println("-------------rs:"+rs);
		if (rs > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	public int dels(String[] ids) {
		int rs = empDao.dels(ids);
		if (rs == ids.length) {
			return 1;// 成功
		} else {
			return 0;// 失败
		}
	}

}
