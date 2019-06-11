package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Page;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className PageService
 * @date   2018年4月18日上午10:08:01
 * @desc  [用一句话描述改文件的功能]
 */
public interface PageService extends SimpleService<Page, Integer>{

	List<Page> findByStatus(int i);

}
