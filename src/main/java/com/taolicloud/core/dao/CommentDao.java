package com.taolicloud.core.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.taolicloud.core.entity.Comment;
import com.taolicloud.core.entity.Question;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className CommentDao
 * @date   2018年5月1日下午5:25:34
 * @desc  [用一句话描述改文件的功能]
 */
public interface CommentDao extends JpaRepository<Comment, Integer>, JpaSpecificationExecutor<Comment>{

	List<Comment> findByQuestion(Question index);

}
