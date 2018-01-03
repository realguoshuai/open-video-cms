package com.zhiyou100.entity;

import java.io.Serializable;
import java.sql.Date;

public class SubjectDO implements Serializable {

	private static final long serialVersionUID = 7665220483672828154L;

	private Integer id;

	private String name;

	private Integer courseCount;

	private Integer videoCount;

	private VideoDO video;

	private SpeakerDO speaker;

	private CourseDO course;

	private boolean status;

	private Date gmtCreate;

	private Date gmtmodified;

	public VideoDO getVideo() {
		return video;
	}

	public void setVideo(VideoDO video) {
		this.video = video;
	}

	public SpeakerDO getSpeaker() {
		return speaker;
	}

	public void setSpeaker(SpeakerDO speaker) {
		this.speaker = speaker;
	}

	public CourseDO getCourse() {
		return course;
	}

	public void setCourse(CourseDO course) {
		this.course = course;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public Date getGmtmodified() {
		return gmtmodified;
	}

	public void setGmtmodified(Date gmtmodified) {
		this.gmtmodified = gmtmodified;
	}

	public Integer getCourseCount() {
		return courseCount;
	}

	public void setCourseCount(Integer courseCount) {
		this.courseCount = courseCount;
	}

	public Integer getVideoCount() {
		return videoCount;
	}

	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}

	@Override
	public String toString() {
		return "SubjectDO [id=" + id + ", name=" + name + ", courseCount=" + courseCount + ", videoCount=" + videoCount
				+ ", video=" + video + ", speaker=" + speaker + ", course=" + course + ", status=" + status
				+ ", gmtCreate=" + gmtCreate + ", gmtmodified=" + gmtmodified + "]";
	}

}
