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
import com.zhiyou100.entity.SpeakerDO;
import com.zhiyou100.entity.VideoDO;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class VideoController {
	@Autowired
	private VideoService videoService;

	@Autowired
	private SpeakerService speakerService;
	@Autowired
	private CourseService courseService;

	@RequestMapping("/video" )
	public String forwardVideoPage(Model model) {

		List<SpeakerDO> speakers = speakerService.listObject();
		List<CourseDO> courses = courseService.listObject();

		model.addAttribute("speakers", speakers);
		model.addAttribute("courses", courses);

		return "forward:/WEB-INF/jsp/video.jsp";
	}

	@RequestMapping(path = { "/v1/video/list" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<BaseDTO<VideoDO>> listVideoByQuery(QueryVO vo) {

		BaseDTO<VideoDO> dto = videoService.listObjectByQuery(vo);
		System.out.println(dto);

		return new ResponseVO<BaseDTO<VideoDO>>(0, " ", dto);
	}

	@RequestMapping(path = { "/v1/video/get/{id}" }, method = RequestMethod.GET)
	@ResponseBody
	public ResponseVO<VideoDO> getVideo(@PathVariable("id") int id) {

		VideoDO video = videoService.getObject(id);

		return new ResponseVO<VideoDO>(0, "", video);
	}

	@RequestMapping(path = { "/v1/video/add" }, method = RequestMethod.POST)
	@ResponseBody
	public ResponseVO<String> addVideo(@RequestBody VideoDO video) {
		videoService.addObject(video);
		return new ResponseVO<String>(0, "", "添加成功");

	}

	@RequestMapping(path = { "/v1/video/update/{id}" }, method = RequestMethod.PUT)
	@ResponseBody
	public ResponseVO<String> updateVideo(@PathVariable("id") int id, @RequestBody VideoDO video) {

		video.setId(id);

		videoService.updateObject(video);

		return new ResponseVO<String>(0, "", "修改成功");
	}

	@RequestMapping(path = { "/v1/video/{id}" }, method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseVO<String> removeVideo(@PathVariable("id") String id) {

		String[] idArray = id.split(",");

		videoService.removeObject(idArray);

		return new ResponseVO<String>(0, "", "删除成功");
	}
}
