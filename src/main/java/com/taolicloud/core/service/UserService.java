package com.taolicloud.core.service;

import com.taolicloud.core.entity.User;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserService
 * @date   2018年3月16日上午9:56:21
 * @desc  [用一句话描述改文件的功能]
 */
public interface UserService extends SimpleService<User, Integer>{
	User findByUsername(String username);
	User upDate(User user);
}
