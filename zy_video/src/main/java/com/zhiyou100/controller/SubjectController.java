package com.zhiyou100.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.dto.BaseDTO;
import com.zhiyou100.entity.SubjectDO;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SubjectService;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class SubjectController {
	@Autowired
	private SubjectService service;

	@RequestMapping("/subject")
	public String forwardSubjectPage(Model model) {

		return "forward:/WEB-INF/jsp/subject.jsp";
	}

	@RequestMapping(path = { "/v1/subject/list" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<BaseDTO<SubjectDO>> listSubjectByQuery(QueryVO vo) {

		BaseDTO<SubjectDO> dto = service.listObjectByQuery(vo);
		// dto.setCount(11);
		System.out.println(dto);

		return new ResponseVO<BaseDTO<SubjectDO>>(0, " ", dto);
	}

	@RequestMapping(path = { "/v1/subject/get/{id}" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<SubjectDO> getSubject(@PathVariable("id") int id) {

		SubjectDO subject = service.getObject(id);

		return new ResponseVO<SubjectDO>(0, "", subject);
	}

	@RequestMapping(path = { "/v1/subject/add" }, method = RequestMethod.POST)
	@ResponseBody
	public ResponseVO<String> addSubject(@RequestBody SubjectDO subject) {
		service.addObject(subject);
		return new ResponseVO<String>(0, "", "添加成功");

	}

	@RequestMapping(path = { "/v1/subject/update/{id}" }, method = RequestMethod.PUT)
	@ResponseBody
	public ResponseVO<String> updateSubject(@PathVariable("id") int id, @RequestBody SubjectDO subject) {

		subject.setId(id);

		service.updateObject(subject);

		return new ResponseVO<String>(0, "", "修改成功");
	}

	@RequestMapping(path = { "/v1/subject/{id}" }, method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseVO<String> removeSubject(@PathVariable("id") String id) {

		String[] idArray = id.split(",");

		service.removeObject(idArray);

		return new ResponseVO<String>(0, "", "删除成功");
	}
}
