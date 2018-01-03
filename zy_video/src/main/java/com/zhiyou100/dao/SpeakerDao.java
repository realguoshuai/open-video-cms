package com.zhiyou100.dao;

import com.zhiyou100.entity.SpeakerDO;

public interface SpeakerDao extends BaseDao<SpeakerDO> {

	void updateSpeakerIdNull(String[] ids);
}
