package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.EasyuiPage;
import com.aaa.movie.entity.ly.Employees;
import com.aaa.movie.service.ly.EmployeesService;

@Controller
@RequestMapping("emp")
public class EmployeesController {

	@Autowired
	private EmployeesService empService;

	@RequestMapping("checkEmp")
	@ResponseBody
	public int checkEmp(Employees emp, HttpSession session) {
		return empService.checkEmp(emp, session);
	}
	
	@RequestMapping("queryPage")
	@ResponseBody
	public EasyuiPage queryPage(String ename,int page, int rows) {
		List<Map<String, Object>> list = empService.queryPage(ename,page, rows);
		int total = empService.queryPage(ename,null, null).size();
		return new EasyuiPage(list, total);
	}

	@RequestMapping("queryAll")
	@ResponseBody
	public List<Map<String, Object>> queryAll() {
		return empService.queryPage(null,null, null);
	}

	@RequestMapping("getLogEmp")
	@ResponseBody
	public Map<String, Object> getLogEmp(HttpSession session) {
		Employees emp = (Employees) session.getAttribute("logEmp");
		return empService.getLogEmp(emp.getEid());
	}
	
	@RequestMapping("add")
	@ResponseBody
	public int add(Employees e) {
		return empService.add(e);
	}
	
	@RequestMapping("updEmp")
	@ResponseBody
	public int updEmp(Employees e) {
		return empService.updEmp(e);
	}
	
	@RequestMapping("dels")
	@ResponseBody
	public int dels(String[] ids) {
		return empService.dels(ids);
	}
	
}
