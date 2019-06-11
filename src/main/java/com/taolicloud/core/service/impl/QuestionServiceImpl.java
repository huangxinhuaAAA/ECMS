package com.taolicloud.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Order;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.SetJoin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.taolicloud.core.dao.QuestionDao;
import com.taolicloud.core.entity.Field;
import com.taolicloud.core.entity.KnowledgePoint;
import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionType;
import com.taolicloud.core.service.QuestionService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionServiceImpl
 * @date   2018年3月21日下午3:08:52
 * @desc  [用一句话描述改文件的功能]
 */
@Service("questionService")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public List<Question> findAll() {
		return questionDao.findAll();
	}

	@Override
	public List<Question> findAll(Sort sort) {
		return questionDao.findAll(sort);
	}

	@Override
	public List<Question> findAll(Iterable<Integer> ids) {
		return questionDao.findAll(ids);
	}

	@Override
	public Question findById(Integer id) {
		return questionDao.findOne(id);
	}

	@Override
	public <S extends Question> List<S> save(Iterable<S> entities) {
		return questionDao.save(entities);
	}

	@Override
	@Transactional
	public <S extends Question> S saveAndFlush(S entity) {
		return questionDao.saveAndFlush(entity);
	}

	@Override
	public <S extends Question> void delete(S entity) {
		questionDao.delete(entity);
	}

	@Override
	public void deleteInBatch(Iterable<Question> entities) {
		questionDao.deleteInBatch(entities);
	}

	@Override
	public <S extends Question> List<S> findAll(Example<S> example) {
		return questionDao.findAll(example);
	}

	@Override
	public <S extends Question> List<S> findAll(Example<S> example, Sort sort) {
		return questionDao.findAll(example,sort);
	}

	@Override
	public Page<Question> findAll(Pageable pageable) {
		return questionDao.findAll(pageable);
	}

	@Override
	public Page<Question> findByFieldAndKnowledgePointAndQuestionType(Field field, Integer knowledgePoint, QuestionType type, Pageable pageable) {
		Page<Question> page = questionDao.findAll((root, query, builder) -> {
			List<Order> orders = new ArrayList<>();
			orders.add(builder.asc(root.<Long>get("id")));
			Predicate predicate = builder.conjunction();
			if (field != null && field.getId() > 0) {
				predicate.getExpressions().add(
						builder.equal(root.get("field").as(Field.class), field));
			}
			if (knowledgePoint != null && knowledgePoint > 0) {
				SetJoin<Question,KnowledgePoint> depJoin = root.join(root.getModel().getSet("knowledgePoint",KnowledgePoint.class));  
				predicate.getExpressions().add(
						builder.equal(depJoin.get("id").as(Integer.class), knowledgePoint));
			}
			if (type != null && type.getId() > 0) {
				predicate.getExpressions().add(
						builder.equal(root.get("questionType").as(QuestionType.class), type));
			}
			query.orderBy(orders);
			return predicate;
		}, pageable);
		return page;
	}

	@Override
	public List<Question> findAllByFieldAndKnowledgePointAndQuestionType(Field field, Integer knowledgePoint,
			QuestionType type) {
		List<Question> questions = questionDao.findAll((root, query, builder) -> {

			List<Order> orders = new ArrayList<>();

			orders.add(builder.asc(root.<Long>get("id")));

			Predicate predicate = builder.conjunction();

			if (field != null && field.getId() > 0) {
				predicate.getExpressions().add(
						builder.equal(root.get("field").as(Field.class), field));
			}
			
			if (knowledgePoint != null && knowledgePoint > 0) {
				SetJoin<Question,KnowledgePoint> depJoin = root.join(root.getModel().getSet("knowledgePoint",KnowledgePoint.class));  
				predicate.getExpressions().add(
						builder.equal(depJoin.get("id").as(Integer.class), knowledgePoint));
			}
			if (type != null && type.getId() > 0) {
				predicate.getExpressions().add(
						builder.equal(root.get("questionType").as(QuestionType.class), type));
			}
			query.orderBy(orders);
			return predicate;
		});
		return questions;
	}
	
	@Override
	@Transactional
	public void update(Question po) {
		questionDao.save(po);
	}

}
