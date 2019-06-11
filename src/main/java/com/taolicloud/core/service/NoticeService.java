package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Notice;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className NoticeService
 * @date 2018年5月7日下午2:23:26
 * @desc [用一句话描述改文件的功能]
 */
public interface NoticeService extends SimpleService<Notice, Integer> {

	List<Notice> findByFlag(Integer flag);

}
