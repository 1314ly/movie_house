package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.Room;
import com.aaa.movie.service.ly.RoomService;

@Controller
@RequestMapping("room")
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping("queryAll")
	@ResponseBody
	public List<Map<String, Object>> queryAll(){
		return roomService.queryAll();
	}
	
	@RequestMapping("add")
	@ResponseBody
	public int add(Room r) {
		return roomService.add(r);
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public int edit(Room r) {
		return roomService.edit(r);
	}
	
	@RequestMapping("dels")
	@ResponseBody
	public int dels(int[] ids) {
		return roomService.dels(ids);
	}
	
}
