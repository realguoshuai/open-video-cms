package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SpeakerDao;
import com.zhiyou100.entity.SpeakerDO;
import com.zhiyou100.service.SpeakerService;

@Service
public class SpeakerServiceImpl extends BaseServiceImpl<SpeakerDO, SpeakerDao> implements SpeakerService {
	@Autowired
	private SpeakerDao dao;

	@Override
	public void removeObject(String[] ids) {

		super.removeObject(ids);

		dao.updateSpeakerIdNull(ids);

	}

}
