package com.taolicloud.web.view;

import java.io.Serializable;

import com.taolicloud.web.bind.Const;

/**
 * @author 马郡
 * @email  Accpect_Majun@163.com / mj@taolicloud.com 
 * @className UserController
 * @date   2018年3月19日上午9:13:01
 * @desc  [用一句话描述改文件的功能]
 */
public class RequestElement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer pageNo;
	private Integer pageSize;

	public RequestElement() {
		super();
	}

	public RequestElement(Integer pageNo, Integer pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public Integer getPageNo() {
		if(pageNo == null || pageNo <=0) {
			pageNo =Const.DEFAULT_PAGE_ON;
		}
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize == null ? Const.DEFAULT_PAGE_SIZE : pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "ReqDto [pageNo=" + pageNo + ", pageSize=" + pageSize + "]";
	}
}
