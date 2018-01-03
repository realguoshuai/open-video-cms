package com.zhiyou100.vo;

public class CourseVO extends QueryVO {

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = -5841434724833406386L;
	
	private Integer subjectId;

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	@Override
	public String toString() {
		return "CourseVO [subjectId=" + subjectId + "]";
	}

}
