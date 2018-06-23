package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.Role;
import com.aaa.movie.service.ly.RolesService;

@Controller
@RequestMapping("roles")
public class RolesController {

	@Autowired
	private RolesService rolesService;

	@RequestMapping("queryAll")
	@ResponseBody
	public List<Map<String, Object>> queryAll() {
		return rolesService.queryAll();
	}
	
	@RequestMapping("add")
	@ResponseBody
	public int add(Role r) {
		return rolesService.add(r);
	}

	@RequestMapping("savePermission")
	@ResponseBody
	public void savePermission(Integer rid, int[] lids) {
		System.out.println("rid:" + rid);
		System.out.println("lids:" + lids);
		// 先删除该角色原来的所有信息
		// 保存新权限
	}
}
