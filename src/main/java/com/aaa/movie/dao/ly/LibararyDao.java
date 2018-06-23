package com.aaa.movie.dao.ly;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author S
 * @see 权限接口类
 */
public interface LibararyDao {

	// 查询所有权限
	public List<Map<String, Object>> query(Integer parentlibid);

	// 查询指定角色的全列列表
	public List<Map<String, Object>> queryByRid(Integer parentlibid, Integer rid);

	public List<Map<String, Object>> queryPage(Integer offset, Integer pageSize);

	public int addNode(Map<String, Object> node);

}
