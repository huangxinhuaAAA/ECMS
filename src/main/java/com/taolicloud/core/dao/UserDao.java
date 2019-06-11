package com.taolicloud.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taolicloud.core.entity.User;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserDao
 * @date   2018年3月16日上午10:02:07
 * @desc  [用一句话描述改文件的功能]
 */
public interface UserDao extends JpaRepository<User, Integer>{
	User findByUsername(String username);
}
