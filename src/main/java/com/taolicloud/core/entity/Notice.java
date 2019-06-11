package com.taolicloud.core.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className Notice
 * @date 2018年5月7日下午2:19:38
 * @desc [用一句话描述改文件的功能]
 */
@Entity
@Table(name = "ECMS_NOTICE")
public class Notice implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -841577057948458305L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "content")
	private String content;

	@Column(name = "status")
	private int status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
