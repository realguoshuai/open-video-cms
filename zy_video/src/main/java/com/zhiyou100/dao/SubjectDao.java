package com.zhiyou100.dao;

import com.zhiyou100.entity.SubjectDO;

public interface SubjectDao extends BaseDao<SubjectDO> {
	
	void updateSubjectIdNull(String[] ids);
}
