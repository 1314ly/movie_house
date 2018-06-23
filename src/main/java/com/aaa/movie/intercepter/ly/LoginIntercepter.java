package com.aaa.movie.intercepter.ly;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.aaa.movie.controller.ly.EmployeesController;

public class LoginIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// 判断是否登录
		HandlerMethod method = (HandlerMethod) arg2;
		String methodName = method.getMethod().getName();
		Class c = method.getBeanType();

		if (c.equals(EmployeesController.class) && "checkEmp".equals(methodName)) {
			return true;
		} else {
			HttpSession session = arg0.getSession();
			Object logEmp = session.getAttribute("logEmp");
			if (null != logEmp) {
				return true;
			} else {
				arg1.sendRedirect("../jsp/ly/login.jsp");
				return false;
			}
		}

	}
	

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}
}
