package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SubjectDao;
import com.zhiyou100.entity.SubjectDO;
import com.zhiyou100.service.SubjectService;

@Service
public class SubjectServiceImpl extends BaseServiceImpl<SubjectDO, SubjectDao> implements SubjectService {

	@Autowired
	private SubjectDao dao;

	@Override
	public void removeObject(String[] ids) {

		super.removeObject(ids);

		dao.updateSubjectIdNull(ids);

	}

}
