package com.taolicloud.core.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taolicloud.core.entity.Field;
import com.taolicloud.core.entity.KnowledgePoint;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className KnowledgePointDao
 * @date   2018年3月21日下午4:54:00
 * @desc  [用一句话描述改文件的功能]
 */
public interface KnowledgePointDao extends JpaRepository<KnowledgePoint, Integer>{

	Set<KnowledgePoint> getKnowledgePointByField(Field field);

}
