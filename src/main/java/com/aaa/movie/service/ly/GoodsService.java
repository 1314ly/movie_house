package com.aaa.movie.service.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.movie.dao.ly.GoodsDao;
import com.aaa.movie.entity.ly.Goods;

/**
 * 
 * @author S
 * @see 商品管理业务逻辑层
 */
@Service
@Transactional
public class GoodsService {
	
	@Autowired
	GoodsDao goodsDao;
	
	public List<Map<String,Object>> queryPage(String goods_name,Integer pageNum, Integer pageSize){
		Integer offset = null;
		if (pageNum != null) {
			offset = (pageNum - 1) * pageSize;
		}
		return goodsDao.queryPage(goods_name,offset, pageSize);
	}
	
	public Goods queryById(Integer goods_id){
		return goodsDao.queryById(goods_id);
	}
	
	public int edit(Goods g){
		int rs = goodsDao.edit(g);
		if (rs > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	public int add(Goods g){
		int rs = goodsDao.add(g);
		if(rs > 0){
			return 1;
		}else{
			return 0;
		}
	}
}
