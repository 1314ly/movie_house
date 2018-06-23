package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

import com.aaa.movie.entity.ly.Goods;

public interface GoodsDao {
	public List<Map<String,Object>> queryPage(String goods_name,Integer offset, Integer pageSize);
	public Goods queryById(Integer goods_id);
	public int edit(Goods g);
	public int add(Goods g);
}
