package com.aaa.movie.service.ly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.movie.dao.ly.Role_libDao;

@Service
@Transactional
public class Role_libService {
	@Autowired
	Role_libDao rlDao;
	
	public int add(int rid,int lid) {
		int rs = rlDao.add(rid, lid);
		if (rs > 0 ) {
			return 1;// 成功
		} else {
			return 0;// 失败
		}
	}
	
	public int del(int rid) {
		int rs = rlDao.del(rid);
		if (rs > 0) {
			return 1;// 成功
		} else {
			return 0;// 失败
		}
	}
}
