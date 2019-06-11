package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionHistory;
import com.taolicloud.core.entity.User;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionHistoryService
 * @date   2018年4月30日下午4:35:26
 * @desc  [用一句话描述改文件的功能]
 */
public interface QuestionHistoryService extends SimpleService<QuestionHistory, Integer>{

	QuestionHistory findByQuestion(Question question);

	QuestionHistory findByUserAndQuestion(User user, Question question);

	List<QuestionHistory> findByUserAndFlag(User user, boolean flag);

}
