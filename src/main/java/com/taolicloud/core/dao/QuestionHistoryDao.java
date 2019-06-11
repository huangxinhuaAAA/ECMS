package com.taolicloud.core.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionHistory;
import com.taolicloud.core.entity.User;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionHistoryDao
 * @date   2018年4月30日下午4:34:33
 * @desc  [用一句话描述改文件的功能]
 */
public interface QuestionHistoryDao extends JpaRepository<QuestionHistory, Integer>, JpaSpecificationExecutor<QuestionHistory>{

	QuestionHistory findByQuestion(Question question);

	QuestionHistory findByUserAndQuestion(User user, Question question);

	List<QuestionHistory> findByUserAndFlag(User user, boolean flag);

}
