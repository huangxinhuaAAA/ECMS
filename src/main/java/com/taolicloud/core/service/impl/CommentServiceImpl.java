package com.taolicloud.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Order;
import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.taolicloud.core.dao.CommentDao;
import com.taolicloud.core.entity.Comment;
import com.taolicloud.core.service.CommentService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className CommentServiceImpl
 * @date   2018年5月1日下午5:27:02
 * @desc  [用一句话描述改文件的功能]
 */

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<Comment> findAll() {
		return commentDao.findAll();
	}

	@Override
	public List<Comment> findAll(Sort sort) {
		return commentDao.findAll(sort);
	}

	@Override
	public List<Comment> findAll(Iterable<Integer> ids) {
		return commentDao.findAll(ids);
	}

	@Override
	public Comment findById(Integer id) {
		return commentDao.findOne(id);
	}

	@Override
	public <S extends Comment> List<S> save(Iterable<S> entities) {
		return commentDao.save(entities);
	}

	@Override
	public <S extends Comment> S saveAndFlush(S entity) {
		return commentDao.saveAndFlush(entity);
	}

	@Override
	public <S extends Comment> void delete(S entity) {
		commentDao.delete(entity);
	}

	@Override
	public void deleteInBatch(Iterable<Comment> entities) {
		commentDao.deleteInBatch(entities);
	}

	@Override
	public <S extends Comment> List<S> findAll(Example<S> example) {
		return commentDao.findAll(example);
	}

	@Override
	public <S extends Comment> List<S> findAll(Example<S> example, Sort sort) {
		return commentDao.findAll(example, sort);
	}

	@Override
	public Page<Comment> findAll(Pageable pageable) {
		return commentDao.findAll(pageable);
	}

	@Override
	public List<Comment> findByQuestion(Integer index) {
		List<Comment> list = commentDao.findAll((root, query, builder) -> {

			List<Order> orders = new ArrayList<>();

			orders.add(builder.desc(root.<Long>get("createTime")));
			
			Predicate predicate = builder.conjunction();

			if (index != null && index > 0) {
				predicate.getExpressions().add(
						builder.equal(root.get("question").as(Integer.class), index));
			}
			
			query.orderBy(orders);
			return predicate;
		});
		
		return list;
	}

}