package com.aaa.movie.controller.ly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.movie.service.ly.Role_libService;

@Controller
@RequestMapping("role_lib")
public class Role_libController {
	@Autowired
	private Role_libService rlService;
	
	@RequestMapping("savePermission")
	@ResponseBody
	public int savePermission(Integer rid, int[] lids) {
		System.out.println("-------------------rid:"+rid);
		int lid = 0;
		int res = 0;
		
		// 先删除该角色原来的所有信息
		int rs = rlService.del(rid);

		if(rs == 1){
			// 保存新权限
			for(int i=0;i<lids.length;i++){
				lid = lids[i];
				res = rlService.add(rid, lid);
			}
			return res;

		}else{
			return rs;
		}
		
	}
}
