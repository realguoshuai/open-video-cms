package com.zhiyou.service;

import static org.junit.Assert.*;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.service.SubjectService;
import com.zhiyou100.vo.QueryVO;

import junit.framework.TestCase;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-service.xml")
public class SubjectServiceTest {
	@Autowired
	private SubjectService service;

	@Test
	public void testListObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testListObjectByQuery() {
		// 分页
		QueryVO queryVO = new QueryVO(0, 5, null, null, null);
		TestCase.assertEquals(5, service.listObjectByQuery(queryVO).getRows().size());

		// 搜索 + 分页默认值
		queryVO = new QueryVO(null, null, "P", null, null);
		TestCase.assertEquals(2, service.listObjectByQuery(queryVO).getRows().size());

		// 搜索 + 分页指定值
		queryVO = new QueryVO(0, 1, "P", null, null);
		TestCase.assertEquals(1, service.listObjectByQuery(queryVO).getRows().size());

		// 排序 + 分页默认值
		queryVO = new QueryVO(null, null, null, "name", "desc");
		TestCase.assertEquals(5, service.listObjectByQuery(queryVO).getRows().size());

		// 排序 + 分页指定值
		queryVO = new QueryVO(5, 5, null, "course_count", "asc");
		TestCase.assertEquals(5, service.listObjectByQuery(queryVO).getRows().size());

		// 排序 + 搜索 + 分页指定值
		queryVO = new QueryVO(0, 5, "U P O", "video_count", "desc");
		TestCase.assertEquals(5, service.listObjectByQuery(queryVO).getRows().size());
	}

	@Test
	public void testAddObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemoveObject() {
		fail("Not yet implemented");
	}

}
