package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.BaseDao;
import com.zhiyou100.dto.BaseDTO;
import com.zhiyou100.service.BaseService;
import com.zhiyou100.vo.QueryVO;

@Service
public abstract class BaseServiceImpl<T, D extends BaseDao<T>> implements BaseService<T> {
	@Autowired
	protected D dao;

	public List<T> listObject() {
		List<T> listObject = dao.listObject();

		return listObject;

	}

	public BaseDTO<T> listObjectByQuery(QueryVO vo) {

		BaseDTO<T> dto = new BaseDTO<T>();
		
		int count = dao.countObjectByQuery(vo);
		System.out.println("1111111" + count);

		dto.setCount(count);

		if (count != 0) {

			if (vo.getLimit() == null) {

				vo.setLimit(5);
			}
			if (vo.getOffset() == null || vo.getOffset() < 0) {

				vo.setOffset(0);

			} else {

				// 正常输入正常的 offset，需要和最后一页的起始索引进行比较
				// (11/5)*5 最后获得的是最后一页的第一条数据的索引
				int lastOffset = (count / vo.getLimit()) * vo.getLimit();

				// 如果大于最后一页的起始索引，修正为最后一页的起始索引
				if (vo.getOffset() > lastOffset) {
					vo.setOffset(lastOffset);
				}
			}
			List<T> rows = dao.listObjectByQuery(vo);
			System.out.println(rows);
			dto.setRows(rows);
		}
		return dto;
	}

	public void addObject(T t) {
		dao.addObject(t);
	}

	public T getObject(Integer id) {

		T t = dao.getObject(id);

		return t;
	}

	public void updateObject(T t) {
		dao.updateObject(t);
	}

	public void removeObject(String[] ids) {

		dao.removeObject(ids);
	}
}
