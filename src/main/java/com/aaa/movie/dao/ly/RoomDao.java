package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

import com.aaa.movie.entity.ly.Room;

/**
 * 
 * @author S
 * @see 影厅管理对应操作
 */
public interface RoomDao {
	public List<Map<String,Object>> queryAll();
	public int edit(Room r);
	public int add(Room r);
	public int dels(int[] ids);
}
