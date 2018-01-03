package com.zhiyou100.entity;

import java.io.Serializable;
import java.sql.Date;

public class CourseDO implements Serializable {

	private static final long serialVersionUID = 2453438221361218443L;

	private Integer id;

	private String name;

	private String subjectName;

	private String describe;

	private Integer subjectId;

	private SpeakerDO speaker;

	private SubjectDO subject;

	private CourseDO course;

	public CourseDO getCourse() {
		return course;
	}

	public void setCourse(CourseDO course) {
		this.course = course;
	}

	private VideoDO video;

	private boolean status;

	private Date gmtCreate;

	private Date gmtmodified;

	public SpeakerDO getSpeaker() {
		return speaker;
	}

	public void setSpeaker(SpeakerDO speaker) {
		this.speaker = speaker;
	}

	public SubjectDO getSubject() {
		return subject;
	}

	public void setSubject(SubjectDO subject) {
		this.subject = subject;
	}

	public VideoDO getVideo() {
		return video;
	}

	public void setVideo(VideoDO video) {
		this.video = video;
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

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
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

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "CourseDO [id=" + id + ", name=" + name + ", subjectName=" + subjectName + ", describe=" + describe
				+ ", subjectId=" + subjectId + ", speaker=" + speaker + ", subject=" + subject + ", video=" + video
				+ ", status=" + status + ", gmtCreate=" + gmtCreate + ", gmtmodified=" + gmtmodified + "]";
	}

}
