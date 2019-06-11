package com.taolicloud.core.service;

import java.util.List;

import com.taolicloud.core.entity.Comment;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className CommentService
 * @date   2018年5月1日下午5:26:22
 * @desc  [用一句话描述改文件的功能]
 */
public interface CommentService extends SimpleService<Comment, Integer>{

	List<Comment> findByQuestion(Integer index);

}
