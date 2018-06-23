package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.EasyuiPage;
import com.aaa.movie.entity.ly.Employees;
import com.aaa.movie.entity.ly.TreeNode;
import com.aaa.movie.service.ly.LibararyService;

@Controller
@RequestMapping("lib")
public class LibararyController {

	@Autowired
	private LibararyService libService;

	@RequestMapping("getTree")
	@ResponseBody
	public List<TreeNode> getTree() {
		return libService.getTree();
	}

	@RequestMapping("getTreeByRid")
	@ResponseBody
	public List<TreeNode> getTreeByRid(HttpSession session) {
		Employees e = (Employees) session.getAttribute("logEmp");
		return libService.getTreeByRid(e.getRid());
	}

	@RequestMapping("queryPage")
	@ResponseBody
	public EasyuiPage queryPage(Integer page, Integer rows) {
		return new EasyuiPage(libService.queryPage(page, rows), libService
				.queryPage(null, null).size());
	}

	@RequestMapping("queryAll")
	@ResponseBody
	public List<Map<String, Object>> queryAll() {
		return libService.queryPage(null, null);
	}

	// 接收json字符串
	@RequestMapping("addNode")
	@ResponseBody
	public boolean addNode(@RequestBody Map<String, Object> node) {
		return libService.addNode(node);
	}
}
