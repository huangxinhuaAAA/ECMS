package com.taolicloud.core.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.taolicloud.core.entity.Field;
import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionType;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionService
 * @date   2018年3月21日下午3:08:05
 * @desc  [用一句话描述改文件的功能]
 */
public interface QuestionService extends SimpleService<Question, Integer>{

	Page<Question> findByFieldAndKnowledgePointAndQuestionType(Field field,Integer knowledge,QuestionType qType,Pageable pageable);

	void update(Question po);

	List<Question> findAllByFieldAndKnowledgePointAndQuestionType(Field field, Integer knowledgePoint,
			QuestionType questionType);

}
