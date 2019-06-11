package com.taolicloud.core.service;

import java.util.Set;

import com.taolicloud.core.entity.Field;
import com.taolicloud.core.entity.KnowledgePoint;
import com.taolicloud.core.service.base.SimpleService;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className KnowledgeService
 * @date   2018年3月22日上午11:39:48
 * @desc  [用一句话描述改文件的功能]
 */
public interface KnowledgePointService extends SimpleService<KnowledgePoint, Integer>{

	Set<KnowledgePoint> getKnowledgePointByField(Field field);

}
