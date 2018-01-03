package com.zhiyou100.dao;

import com.zhiyou100.entity.CourseDO;

public interface CourseDao extends BaseDao<CourseDO> {
	/** 
	 * @Title: updateVideoIdNull 
	 * @Description: 置空video中的courseId
	 * @param id
	 * @return: void
	 */
	void updateCourseIdNull(String[] ids);
}
