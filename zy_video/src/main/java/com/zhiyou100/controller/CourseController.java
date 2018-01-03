package com.zhiyou100.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.dto.BaseDTO;
import com.zhiyou100.entity.CourseDO;
import com.zhiyou100.entity.SubjectDO;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SubjectService;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class CourseController {
	@Autowired
	private CourseService service;
	@Autowired
	private SubjectService subjectService;

	@RequestMapping("/course")
	public String forwardVideoPage(Model model) {

		List<SubjectDO> subjects = subjectService.listObject();
		System.out.println(subjects);

		model.addAttribute("subjects", subjects);

		return "forward:/WEB-INF/jsp/course.jsp";
	}

	@RequestMapping(path = { "/v1/course/list" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<BaseDTO<CourseDO>> listCourseByQuery(QueryVO vo) {

		BaseDTO<CourseDO> dto = service.listObjectByQuery(vo);

		return new ResponseVO<BaseDTO<CourseDO>>(0, " ", dto);
	}

	@RequestMapping(path = { "/v1/course/get/{id}" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<CourseDO> getCourse(@PathVariable("id") int id, Model model) {

		CourseDO course = service.getObject(id);
		model.addAttribute("update_subject_id", course.getSubjectId());
		System.out.println(course.getSubjectId()+"+++++++++++++++++course_subjectId");
		return new ResponseVO<CourseDO>(0, "", course);
	}

	@RequestMapping(path = { "/v1/course/add" }, method = RequestMethod.POST)
	@ResponseBody
	public ResponseVO<String> addCourse(@RequestBody CourseDO course) {
		service.addObject(course);
		return new ResponseVO<String>(0, "", "添加成功");

	}

	@RequestMapping(path = { "/v1/course/update/{id}" }, method = RequestMethod.PUT)
	@ResponseBody
	public ResponseVO<String> updateCourse(@PathVariable("id") int id, @RequestBody CourseDO course) {

		course.setId(id);

		service.updateObject(course);

		return new ResponseVO<String>(0, "", "修改成功");
	}

	@RequestMapping(path = { "/v1/course/{id}" }, method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseVO<String> removeCourse(@PathVariable("id") String id) {

		String[] idArray = id.split(",");

		service.removeObject(idArray);

		return new ResponseVO<String>(0, "", "删除成功");
	}
}
