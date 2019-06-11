package com.taolicloud.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.taolicloud.core.dao.QuestionHistoryDao;
import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionHistory;
import com.taolicloud.core.entity.User;
import com.taolicloud.core.service.QuestionHistoryService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionHistoryServiceImpl
 * @date   2018年4月30日下午4:56:28
 * @desc  [用一句话描述改文件的功能]
 */
@Service("questionHist")
public class QuestionHistoryServiceImpl implements QuestionHistoryService{

	@Autowired
	private QuestionHistoryDao historyDao;
	
	@Override
	public List<QuestionHistory> findAll() {
		return historyDao.findAll();
	}

	@Override
	public List<QuestionHistory> findAll(Sort sort) {
		return historyDao.findAll(sort);
	}

	@Override
	public List<QuestionHistory> findAll(Iterable<Integer> ids) {
		return historyDao.findAll(ids);
	}

	@Override
	public QuestionHistory findById(Integer id) {
		return historyDao.findOne(id);
	}

	@Override
	public <S extends QuestionHistory> List<S> save(Iterable<S> entities) {
		return historyDao.save(entities);
	}

	@Override
	public <S extends QuestionHistory> S saveAndFlush(S entity) {
		return historyDao.saveAndFlush(entity);
	}

	@Override
	public <S extends QuestionHistory> void delete(S entity) {
		historyDao.delete(entity);
	}

	@Override
	public void deleteInBatch(Iterable<QuestionHistory> entities) {
		historyDao.deleteInBatch(entities);
	}

	@Override
	public <S extends QuestionHistory> List<S> findAll(Example<S> example) {
		return historyDao.findAll(example);
	}

	@Override
	public <S extends QuestionHistory> List<S> findAll(Example<S> example, Sort sort) {
		return historyDao.findAll(example,sort);
	}

	@Override
	public Page<QuestionHistory> findAll(Pageable pageable) {
		return historyDao.findAll(pageable);
	}

	@Override
	public QuestionHistory findByQuestion(Question question) {
		return historyDao.findByQuestion(question);
	}

	@Override
	public QuestionHistory findByUserAndQuestion(User user, Question question) {
		return historyDao.findByUserAndQuestion(user, question);
	}

	@Override
	public List<QuestionHistory> findByUserAndFlag(User user, boolean flag) {
		return historyDao.findByUserAndFlag(user,flag);
	}

}