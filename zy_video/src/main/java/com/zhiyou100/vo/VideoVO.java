package com.zhiyou100.vo;

public class VideoVO extends QueryVO {
	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = -7033535352850593413L;

	private Integer courseId;
	private Integer speakerId;

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getSpeakerId() {
		return speakerId;
	}

	public void setSpeakerId(Integer speakerId) {
		this.speakerId = speakerId;
	}

	@Override
	public String toString() {
		return "VideoVO [courseId=" + courseId + ", speakerId=" + speakerId + "]";
	}

	public VideoVO() {
		super();
	}

	public VideoVO(Integer courseId, Integer speakerId) {
		super();
		this.courseId = courseId;
		this.speakerId = speakerId;
	}

	public VideoVO(Integer offset, Integer limit, String search, String sort, String order, Integer courseId,
			Integer speakerId) {
		super(offset, limit, search, sort, order);
		this.courseId = courseId;
		this.speakerId = speakerId;
	}

}
