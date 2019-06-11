package com.taolicloud.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.taolicloud.core.entity.Page;
import com.taolicloud.core.entity.PageHistory;
import com.taolicloud.core.entity.User;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className PageHistory
 * @date 2018年5月3日上午11:15:42
 * @desc [用一句话描述改文件的功能]
 */
public interface PageHistoryDao extends JpaRepository<PageHistory, Integer>, JpaSpecificationExecutor<PageHistory>{

	PageHistory findByPageAndUserAndStatus(Page page, User user, Boolean flag);

}
