package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Page;
import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionPage;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionPageService
 * @date   2018年4月26日下午2:58:13
 * @desc  [用一句话描述改文件的功能]
 */
public interface QuestionPageService extends SimpleService<QuestionPage, Integer>{

	List<QuestionPage> findByPage(Integer pid);

	void updata(QuestionPage po);

	QuestionPage findByPageAndQuestion(Page page, Question question);

}
