package com.taolicloud.core.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className Comment
 * @date 2018年5月1日下午5:20:02
 * @desc [用一句话描述改文件的功能]
 */

@Entity
@Table(name = "ECMS_COMMENT")
public class Comment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8091008528378921659L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "user_id", nullable = true)
	private User user;

	@Column(name = "question_id")
	private Integer question;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "content")
	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getQuestion() {
		return question;
	}

	public void setQuestion(Integer question) {
		this.question = question;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}