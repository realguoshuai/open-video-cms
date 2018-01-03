package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.CourseDao;
import com.zhiyou100.entity.CourseDO;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.vo.QueryVO;

@Service
public class CourseServiceImpl extends BaseServiceImpl<CourseDO, CourseDao> implements CourseService {
	@Autowired
	private CourseDao dao;
	
	public void removeObject(String[] ids) {
		super.removeObject(ids);

		dao.updateCourseIdNull(ids);
	}

	public Integer countCourseCount(QueryVO vo) {

		return dao.countObjectByQuery(vo);
	}

}
