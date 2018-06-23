package com.aaa.movie.service.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.movie.dao.ly.RolesDao;
import com.aaa.movie.entity.ly.Role;

/**
 * 
 * @author S
 * @see 角色管理业务逻辑层
 */
@Service
public class RolesService {

	@Autowired
	RolesDao rolesDao;

	public List<Map<String, Object>> queryAll() {
		return rolesDao.queryAll();
	}
	
	public int add(Role r) {
		int rs = rolesDao.add(r);
		if(rs > 0){
			return 1;
		}else{
			return 0;
		}
	}

}
