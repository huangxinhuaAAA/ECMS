package com.taolicloud.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.taolicloud.core.entity.Question;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className QuestionDao
 * @date   2018年3月21日下午3:09:43
 * @desc  [用一句话描述改文件的功能]
 */
public interface QuestionDao extends JpaRepository<Question, Integer>, JpaSpecificationExecutor<Question>{


}
