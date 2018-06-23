/**
 * 
 */
package com.aaa.movie.service.xw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.movie.dao.xw.UsersDao;
import com.aaa.movie.entity.xw.Users;

/**
 * @title : UsersService
 * @author : 情玖
 * @date : 2018年6月6日下午7:03:13
 */
@Service
public class UsersService {

	@Autowired
	private UsersDao userDao;

	public void regist(Users user) {

		userDao.regist(user);

	}

}
