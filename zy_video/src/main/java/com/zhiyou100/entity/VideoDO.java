package com.zhiyou100.entity;

import java.io.Serializable;
import java.sql.Date;

public class VideoDO implements Serializable {

	private static final long serialVersionUID = -3050275338399943366L;

	private Integer id;

	private String name;

	private String describe;

	private String length;

	private String playCount;

	private String coverUrl;

	private String videoUrl;

	private Integer courseId;

	private Integer speakerId;

	private Integer subjectId;

	private CourseDO course;

	private SubjectDO subject;

	private String courseName;
	private String speakerName;
	
	private String subjectName;
	

	private SpeakerDO speaker;

	private boolean status;

	private Date gmtCreate;

	private Date gmtmodified;

	
	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
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

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getPlayCount() {
		return playCount;
	}

	public void setPlayCount(String playCount) {
		this.playCount = playCount;
	}

	public String getCoverUrl() {
		return coverUrl;
	}

	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

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

	public CourseDO getCourse() {
		return course;
	}

	public void setCourse(CourseDO course) {
		this.course = course;
	}

	public SubjectDO getSubject() {
		return subject;
	}

	public void setSubject(SubjectDO subject) {
		this.subject = subject;
	}

	public SpeakerDO getSpeaker() {
		return speaker;
	}

	public void setSpeaker(SpeakerDO speaker) {
		this.speaker = speaker;
	}

	
	
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getSpeakerName() {
		return speakerName;
	}

	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "VideoDO [id=" + id + ", name=" + name + ", describe=" + describe + ", length=" + length + ", playCount="
				+ playCount + ", coverUrl=" + coverUrl + ", videoUrl=" + videoUrl + ", courseId=" + courseId
				+ ", speakerId=" + speakerId + ", course=" + course + ", subject=" + subject + ", speaker=" + speaker
				+ ", status=" + status + ", gmtCreate=" + gmtCreate + ", gmtmodified=" + gmtmodified + "]";
	}

}
