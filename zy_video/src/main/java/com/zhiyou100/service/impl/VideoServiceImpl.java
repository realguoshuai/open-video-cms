package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.VideoDao;
import com.zhiyou100.entity.VideoDO;
import com.zhiyou100.service.VideoService;

@Service
public class VideoServiceImpl extends BaseServiceImpl<VideoDO, VideoDao> implements VideoService {

	@Autowired
	private VideoDao dao;

	@Override
	public void removeObject(String[] ids) {

		super.removeObject(ids);

		dao.updateSpeakerIdNull(ids);

		dao.updateCourseIdNull(ids);

	}

}
