package com.aaa.movie.controller.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.entity.ly.EasyuiPage;
import com.aaa.movie.entity.ly.Goods;
import com.aaa.movie.service.ly.GoodsService;

@Controller
@RequestMapping("good")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("queryPage")
	@ResponseBody
	public EasyuiPage queryPage(String goods_name,int page, int rows) {
		List<Map<String, Object>> list = goodsService.queryPage(goods_name,page, rows);
		int total = goodsService.queryPage(goods_name,null, null).size();
		return new EasyuiPage(list, total);
	}

	@RequestMapping("queryById")
	@ResponseBody
	public Goods queryById(Integer goods_id) {
		return goodsService.queryById(goods_id);
	}

	
	@RequestMapping("add")
	@ResponseBody
	public int add(Goods g) {
		return goodsService.add(g);
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public int edit(Goods g) {
		return goodsService.edit(g);
	}
}
