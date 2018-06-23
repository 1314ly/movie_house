/**
 * 
 */
package com.aaa.movie.controller.xw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aaa.movie.entity.xw.Users;
import com.aaa.movie.service.xw.UsersService;

/**
 * @title : UsersController
 * @author : 情玖
 * @date : 2018年6月6日下午7:08:12
 */
@Controller
@RequestMapping("users")
public class UsersController {

	@Autowired
	private UsersService usersService;

	@RequestMapping("regist")
	public String regist(Users user) {

		usersService.regist(user);

		return null;

	}

}
