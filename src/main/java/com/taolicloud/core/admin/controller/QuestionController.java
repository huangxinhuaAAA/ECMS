package com.taolicloud.core.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.taolicloud.core.entity.Field;
import com.taolicloud.core.entity.KnowledgePoint;
import com.taolicloud.core.entity.Question;
import com.taolicloud.core.entity.QuestionType;
import com.taolicloud.core.entity.User;
import com.taolicloud.core.entity.util.FileNameUtils;
import com.taolicloud.core.entity.util.Message;
import com.taolicloud.core.entity.util.SetUtil;
import com.taolicloud.core.service.FieldService;
import com.taolicloud.core.service.KnowledgePointService;
import com.taolicloud.core.service.QuestionService;
import com.taolicloud.core.service.QuestionTypeService;
import com.taolicloud.web.bind.Const;
import com.taolicloud.web.view.RequestElement;

/**
 * @author 马郡
 * @email Accpect_Majun@163.com / mj@taolicloud.com
 * @className QuestionController
 * @date 2018年3月21日下午12:07:08
 * @desc [试题管理控制层]
 */
@Controller
@RequestMapping("/admin/question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private FieldService fieldService;

	@Autowired
	private KnowledgePointService knowledgePointService;

	@Autowired
	private QuestionTypeService questionTypeService;

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping("/add")
	public String add(Model model) {
		List<QuestionType> questionTypes = questionTypeService.findAll();
		List<Field> fields = fieldService.findAll();
		if (fields != null) {
			Field field = fields.get(0);
			List<KnowledgePoint> knowledgePoints = new ArrayList<>();
			knowledgePoints.addAll(knowledgePointService.getKnowledgePointByField(field));
			model.addAttribute("knowledges", knowledgePoints);
		}
		model.addAttribute("questionTypes", questionTypes).addAttribute("fields", fields);
		return "admin/question/add";
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@PostMapping(value = "/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	Message addQuestion(@RequestBody Question question, HttpSession session) {
		User user = (User) session.getAttribute(Const.LOGIN_ADMIN);
		Message message = new Message();
		question.setCreateTime(new Date());
		question.setCreator(user.getUsername());
		try {
			questionService.saveAndFlush(question);
		} catch (Exception e) {
			message.setResult("error");
			message.setMessageInfo(e.getClass().getName());
			e.printStackTrace();
		}
		return message;
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping(value = "/get-knowledge-point/{fieldId}")
	@ResponseBody
	Message getKnowledges(@PathVariable int fieldId) {
		Message message = new Message();
		HashMap<Integer, String> pointMap = new HashMap<Integer, String>();
		Field field = fieldService.findById(fieldId);
		List<KnowledgePoint> knowledgePoints = new ArrayList<>();
		knowledgePoints.addAll(knowledgePointService.getKnowledgePointByField(field));
		for (KnowledgePoint point : knowledgePoints) {
			pointMap.put(point.getId(), point.getName());
		}
		message.setObject(pointMap);
		return message;
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping(value = "/upload-img/{num}")
	public String upload_cover(@PathVariable int num, Model model) {
		model.addAttribute("num", num);
		return "admin/question/upload_img";
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping("/edit")
	public String edit(Integer id, Model model) {
		Question question = questionService.findById(id);
		List<Field> fields = fieldService.findAll();
		Set<KnowledgePoint> kSet = SetUtil.difference(knowledgePointService.getKnowledgePointByField(question.getField()),question.getKnowledgePoint());
		List<KnowledgePoint> knowledgePoints = new ArrayList<>();
		knowledgePoints.addAll(kSet);
		model.addAttribute("knowledges", knowledgePoints)
			.addAttribute("question", question)
			.addAttribute("fields", fields);
		return "admin/question/edit";
	}
	
	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@PostMapping("/edit")
	@ResponseBody
	Message edit(@RequestBody Question question) {
		Message message = new Message();
		Question po = questionService.findById(question.getId());
		
		po.setField(question.getField());

		Set<KnowledgePoint> knowledgePoints = po.getKnowledgePoint();
		po.getKnowledgePoint().remove(knowledgePoints);
		knowledgePoints.remove(po);
		knowledgePoints.clear();
		for (KnowledgePoint knowledgePoint : question.getKnowledgePoint()) {
			knowledgePoints.add(knowledgePointService.findById(knowledgePoint.getId()));
		}
		po.setKnowledgePoint(knowledgePoints);

		try {
			questionService.update(po);
		} catch (Exception e) {
			message.setResult("error");
			message.setMessageInfo(e.getClass().getName());
			e.printStackTrace();
		}
		
		return message;
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@PostMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam(value = "file") MultipartFile file) {
		try {
			int pos = file.getOriginalFilename().lastIndexOf(".");
			String ext = file.getOriginalFilename().substring(pos);
			String name = FileNameUtils.genFileName() + ext;
			String filePath = Const.LOCAL_SITE_STORAGE + "/img/" + name;
			// System.out.println(filePath);
			file.transferTo(new File(filePath));
			return "{\"url\":\"/ecms/img/" + name + "\"}";
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			System.out.println("no");
			return "{\"url\":\"\"}";
		}

	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping("/list-{fieldId}-{knowledge}-{questionType}.html")
	public String listByFieldAndPoIntegerAndType(@PathVariable("fieldId") Integer fieldId,
			@PathVariable("knowledge") Integer knowledge, @PathVariable("questionType") Integer questionType,
			RequestElement element, Model model) {
		Sort sort = new Sort(Direction.DESC, "createTime");
		Pageable pageable = new PageRequest(element.getPageNo() - 1, element.getPageSize(), sort);
		Field field = fieldService.findById(fieldId);
		QuestionType qType = questionTypeService.findById(questionType);
		Page<Question> questions = questionService.findByFieldAndKnowledgePointAndQuestionType(field, knowledge, qType,
				pageable);
		int total = questions.getTotalPages();
		int start = element.getPageNo() - 3 > 0 ? element.getPageNo() - 3 : 1;
		int end = element.getPageNo() + 3 < total ? element.getPageNo() + 3 : total;

		List<Field> fields = fieldService.findAll();
		model.addAttribute("fields", fields);
		model.addAttribute("fieldId", fieldId);
		
		List<KnowledgePoint> knowledgePoints = new ArrayList<>();
		if(fieldId == 0) {
			knowledgePoints = knowledgePointService.findAll();
		}else {
			knowledgePoints.addAll(knowledgePointService.getKnowledgePointByField(field));
		}
		model.addAttribute("knowledgePoints", knowledgePoints);
		model.addAttribute("knowledge", knowledge);

		List<QuestionType> questionTypes = questionTypeService.findAll();
		model.addAttribute("questionTypes", questionTypes);
		model.addAttribute("questionType", questionType);

		model.addAttribute("page", questions).addAttribute("start", start).addAttribute("end", end);
		return "admin/question/list";
	}

	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@GetMapping("/view.html/{id}")
	public String view(@PathVariable("id") int id, Model model) {
		Question question = questionService.findById(id);
		Iterator<KnowledgePoint> iterators = question.getKnowledgePoint().iterator();
		List<KnowledgePoint> knowledgePoints = new ArrayList<>();
		while (iterators.hasNext()) {
			knowledgePoints.add(iterators.next());
		}
		model.addAttribute("view", question).addAttribute("knowledgePoint", knowledgePoints);
		return "admin/question/view";
	}
	
	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	Message delete(@PathVariable("id") int id) {
		Message message = new Message();
		Question  question = questionService.findById(id);
		if(question != null) {
			questionService.delete(question);
		}else {
			message.setResult("error");
			message.setMessageInfo("not found the question entity");
		}
		
		return message;
	}
	
	@RequiresRoles(value = {"ADMIN","TEACHER"}, logical= Logical.OR)
	@PostMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(Integer...ids) {
		for (Integer id : ids) {
			Question question = questionService.findById(id);
			if(question != null) {
				questionService.delete(question);
			}
		}
		return "ok";
	}
}
