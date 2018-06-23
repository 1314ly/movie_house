package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.Dept;
import com.aaa.movie.service.ly.DeptService;

@Controller
@RequestMapping("dept")
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("queryAll")
	@ResponseBody
	public List<Map<String, Object>> queryAll(){
		return deptService.queryAll();
	}
	
	@RequestMapping("add")
	@ResponseBody
	public int add(Dept d) {
		return deptService.add(d);
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public int edit(Dept d) {
		return deptService.edit(d);
	}
	
	@RequestMapping("dels")
	@ResponseBody
	public int dels(int[] ids) {
		return deptService.dels(ids);
	}
	
}
