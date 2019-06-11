package com.taolicloud.core.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className User
 * @date 2018年3月16日上午9:37:30
 * @desc [用户实体类]
 */
@Entity
@Table(name = "ECMS_USER")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2224567088082091306L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "salt")
	private String salt;

	@Column(name = "realname")
	private String realname;

	@Column(name = "email")
	private String email;

	@Column(name = "phone")
	private String phone;

	@Column(name = "status")
	private Integer status;

	@Column(name = "create_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime;

	@Column(name = "field_id")
	private Integer fieldId;

	@Column(name = "field_name")
	private String fieldName;

	@Column(name = "type_id")
	private Integer typeId;

	@Column(name = "type_name")
	private String typeName;

	@Column(name = "last_login_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastLoginTime;

	@Column(name = "province")
	private String province;

	@Column(name = "company")
	private String company;

	@Column(name = "department")
	private String department;

	@OneToMany(mappedBy = "user", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	private Set<QuestionHistory> questionHistories = new HashSet<>();

	@OneToMany(mappedBy = "user", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	private Set<PageHistory> pageHistories = new HashSet<>();

	@OneToMany(mappedBy = "user", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	private Set<Comment> comments = new HashSet<>();

	public User() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getFieldId() {
		return fieldId;
	}

	public void setFieldId(Integer fieldId) {
		this.fieldId = fieldId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCredentialsSalt() {
		return username + salt;
	}

	public Set<QuestionHistory> getQuestionHistories() {
		return questionHistories;
	}

	public void setQuestionHistories(Set<QuestionHistory> questionHistories) {
		this.questionHistories = questionHistories;
	}

	public Set<PageHistory> getPageHistories() {
		return pageHistories;
	}

	public void setPageHistories(Set<PageHistory> pageHistories) {
		this.pageHistories = pageHistories;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

}