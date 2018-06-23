package com.aaa.movie.service.ly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.movie.dao.ly.DeptDao;
import com.aaa.movie.entity.ly.Dept;

/**
 * 
 * @author S
 * @see 部门管理业务逻辑层
 */
@Service
@Transactional
public class DeptService {
	
	@Autowired
	DeptDao deptDao;
	
	public List<Map<String, Object>> queryAll(){
		return deptDao.queryAll();
	}
	
	public int add(Dept d) {
		int rs = deptDao.add(d);
		if(rs > 0){
			return 1;
		}else{
			return 0;
		}
	}
	
	public int edit(Dept d) {
		int rs = deptDao.edit(d);
		if (rs > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	
	public int dels(int[] ids) {
		int rs = deptDao.dels(ids);
		if (rs == ids.length) {
			return 1;// 成功
		} else {
			return 0;// 失败
		}
	}
}
