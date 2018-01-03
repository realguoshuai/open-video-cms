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
import com.zhiyou100.entity.SpeakerDO;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class SpeakerController {
	@Autowired
	private SpeakerService service;

	@RequestMapping("/speaker")
	public String forwardVideoPage(Model model) {


		return "forward:/WEB-INF/jsp/speaker.jsp";
	}

	@RequestMapping(path = { "/v1/speaker/list" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<BaseDTO<SpeakerDO>> listSpeakerByQuery(QueryVO vo) {

		BaseDTO<SpeakerDO> dto = service.listObjectByQuery(vo);
		// dto.setCount(11);
		System.out.println(dto);

		return new ResponseVO<BaseDTO<SpeakerDO>>(0, " ", dto);
	}

	@RequestMapping(path = { "/v1/speaker/get/{id}" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<SpeakerDO> getSpeaker(@PathVariable("id") int id) {

		SpeakerDO subject = service.getObject(id);

		return new ResponseVO<SpeakerDO>(0, "", subject);
	}

	@RequestMapping(path = { "/v1/speaker/add" }, method = RequestMethod.POST)
	@ResponseBody
	public ResponseVO<String> addSpeaker(@RequestBody SpeakerDO speaker) {
		service.addObject(speaker);
		return new ResponseVO<String>(0, "", "添加成功");

	}

	@RequestMapping(path = { "/v1/speaker/update/{id}" }, method = RequestMethod.PUT)
	@ResponseBody
	public ResponseVO<String> updateSpeaker(@PathVariable("id") int id, @RequestBody SpeakerDO speaker) {

		speaker.setId(id);

		service.updateObject(speaker);

		return new ResponseVO<String>(0, "", "修改成功");
	}

	@RequestMapping(path = { "/v1/speaker/{id}" }, method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseVO<String> removeSpeaker(@PathVariable("id") String id) {

		String[] idArray = id.split(",");

		service.removeObject(idArray);

		return new ResponseVO<String>(0, "", "删除成功");
	}

}
