package com.taolicloud.core.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;

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
 * @className PageHistory
 * @date 2018年5月3日上午10:38:08
 * @desc [用一句话描述改文件的功能]
 */
@Entity
@Table(name = "ECMS_PAGE_HISTORY")
public class PageHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6488268400323922698L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "user_id", nullable = true)
	private User user;

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "page_id", nullable = true)
	private Page page;

	@Column(name = "answers")
	private HashMap<Integer, String> answers;

	@Column(name = "counts")
	private Float counts;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "status")
	private Boolean status;

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

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public HashMap<Integer, String> getAnswers() {
		return answers;
	}

	public void setAnswers(HashMap<Integer, String> answers) {
		this.answers = answers;
	}

	public Float getCounts() {
		return counts;
	}

	public void setCounts(Float counts) {
		this.counts = counts;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

}
