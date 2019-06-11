package com.taolicloud.core.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taolicloud.core.entity.Notice;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className NoticeDao
 * @date   2018年5月7日下午2:22:11
 * @desc  [用一句话描述改文件的功能]
 */
public interface NoticeDao  extends JpaRepository<Notice, Integer>{

	List<Notice> findByStatus(int flag);

}
