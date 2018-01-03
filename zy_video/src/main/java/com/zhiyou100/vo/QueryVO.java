package com.zhiyou100.vo;

import java.io.Serializable;

public class QueryVO implements Serializable {

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = -7140838614937397062L;
	// 分页中使用
	// 查询的时候输入的起始下标
	private Integer offset;
	// 每页查询几条数据
	private Integer limit;

	// 搜索中使用
	// 搜索字段
	private String search;

	// 排序中使用
	// 按照什么字段名进行排序
	private String sort;
	// 按照哪种方式排序
	private String order;

	private Integer speakerId;

	private Integer courseId;

	private Integer subjectId;

	private Integer videoId;

	public Integer getSpeakerId() {
		return speakerId;
	}

	public void setSpeakerId(Integer speakerId) {
		this.speakerId = speakerId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public QueryVO(Integer offset, Integer limit, String search, String sort, String order) {
		super();
		this.offset = offset;
		this.limit = limit;
		this.search = search;
		this.sort = sort;
		this.order = order;
	}

	public QueryVO() {
		super();
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "QueryVO [offset=" + offset + ", limit=" + limit + ", search=" + search + ", sort=" + sort + ", order="
				+ order + "]";
	}

	public String[] getKeywords() {
		if (search == null || search.equals(" ")) {
			return null;
		} else {
			return search.split(" ");
		}
	}
}
