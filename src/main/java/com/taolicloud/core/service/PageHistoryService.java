package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Page;
import com.taolicloud.core.entity.PageHistory;
import com.taolicloud.core.entity.User;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className PageHistoryService
 * @date 2018年5月3日上午11:16:42
 * @desc [用一句话描述改文件的功能]
 */
public interface PageHistoryService extends SimpleService<PageHistory, Integer> {

	PageHistory findByPageAndUserAndStatus(Page page, User user, Boolean flag);
	
	List<PageHistory> findAllByPageAndUserAndStatus(Page page, User user, Boolean flag);
}
