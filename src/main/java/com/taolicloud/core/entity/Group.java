package com.taolicloud.core.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className Group
 * @date 2018年3月21日上午9:50:05
 * @desc [年级组实体类]
 */
@Entity
@Table(name = "ECMS_GROUP")
@JsonIgnoreProperties(ignoreUnknown = true, value = {"hibernateLazyInitializer", "handler", "fieldHandler"})
public class Group implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1339992415732002527L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "group_level_id")
	private int groupLevelId;

	@Column(name = "parent")
	private int parent;
	
	@JsonIgnore
	@OneToMany(mappedBy = "group", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	private Set<Question> questions;

	public Group() {
		super();
	}

	public Group(int id, String name, int groupLevelId, int parent, Set<Question> questions) {
		super();
		this.id = id;
		this.name = name;
		this.groupLevelId = groupLevelId;
		this.parent = parent;
		this.questions = questions;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGroupLevelId() {
		return groupLevelId;
	}

	public void setGroupLevelId(int groupLevelId) {
		this.groupLevelId = groupLevelId;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

}
