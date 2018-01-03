package com.zhiyou100.dao;

import com.zhiyou100.entity.VideoDO;

public interface VideoDao extends BaseDao<VideoDO> {
	
	void updateCourseIdNull(String[] ids);

	void updateSpeakerIdNull(String[] ids);

}
