package com.aaa.movie.service.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.movie.dao.ly.RoomDao;
import com.aaa.movie.entity.ly.Room;

/**
 * 
 * @author S
 * @see 影厅管理业务逻辑层
 */
@Service
@Transactional
public class RoomService {
	@Autowired
	RoomDao roomDao;
	
	public List<Map<String, Object>> queryAll(){
		return roomDao.queryAll();
	}
	
	public int add(Room r) {
		int rs = roomDao.add(r);
		if(rs > 0){
			return 1;
		}else{
			return 0;
		}
	}
	
	public int edit(Room r) {
		int rs = roomDao.edit(r);
		if (rs > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	public int dels(int[] ids) {
		int rs = roomDao.dels(ids);
		if (rs == ids.length) {
			return 1;// 成功
		} else {
			return 0;// 失败
		}
	}
}
