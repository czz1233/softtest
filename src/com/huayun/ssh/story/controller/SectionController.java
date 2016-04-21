package com.huayun.ssh.story.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.controller.BaseController;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.system.service.IAccountService;
import com.huayun.ssh.story.model.BookTag;
import com.huayun.ssh.story.model.Section;
import com.huayun.ssh.story.model.Story;
import com.huayun.ssh.story.service.ISectionService;
import com.huayun.ssh.story.service.IStoryService;
@Controller
@RequestMapping("story/section")
@SessionAttributes("LOGINER")
public class SectionController extends BaseController{
	@Autowired
	private ISectionService sectionService;
	@Autowired
	private IStoryService storyService;
	@Autowired
	private IAccountService accountService;
	
	/**
	 * 构造方法
	 */
	public SectionController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/section_list";
	}
	@RequestMapping(value = "search")
	public String search(){
		
		return "bootstrap/jsp/story/section_search";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<Section> valueList = sectionService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id,ModelMap map){
			List<Story> storyList = storyService.getTableData();
			map.put("storyList", storyList);
			return "bootstrap/jsp/story/section_add";
		}
		@RequestMapping(value = "deleteSection",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteSection(String id){
			sectionService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "tagRecord",method=RequestMethod.POST)
		public @ResponseBody JSONObject tagRecord(String id,HttpSession session){
			Section section = sectionService.getById(id);
			Account loginer = (Account) session.getAttribute("LOGINER");
			Account a = accountService.getById(loginer.getId());
			BookTag bookTag = new BookTag();
			bookTag.setAccount(a);
			bookTag.setSection(section);
			a.getBookTagList().add(bookTag);
			accountService.updateAccount(a);
			
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(Section section,HttpSession session,String storyId){
			Account loginer = (Account) session.getAttribute("LOGINER");
			section.setStatus(1);
			section.setCreateTime(new Date());
			section.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			String content = section.getSection();
			Story story = storyService.getById(storyId);
			if(content != null && !"".equals(content)){
				int le = content.length();
				section.setSwordNum((long) le);
				story.setWordCount(story.getWordCount() + le);
				story.setUpdateTime(new Date());
				storyService.edit(story);
			}else{
				section.setSwordNum(0l);
			}
			section.setSreadNum(0L);
			section.setStory(story);
			section.setSupdate(new Date());
			sectionService.save(section);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			Section section = sectionService.getById(id);
			map.put("section", section);
			return "bootstrap/jsp/story/section_edit";
		}
		@RequestMapping(value = "{id}/commentRecordShow")
		public String commentRecordShow(@PathVariable("id")String id,ModelMap map){
			Section section = sectionService.getById(id);
			map.put("section", section);
			return "bootstrap/jsp/story/section_comment";
		}
		@RequestMapping(value = "{id}/readRecord")
		public String readRecord(@PathVariable("id")String id,ModelMap map){
			Section section = sectionService.getById(id);
			Story story = section.getStory();
			story.setReadCount(story.getReadCount() + 1);
			storyService.edit(story);
			section.setSreadNum(section.getSreadNum() + 1);
			sectionService.edit(section);
			map.put("section", section);
			return "bootstrap/jsp/story/section_read";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(Section section){
			Section old = sectionService.getById(section.getId());
			long lg = old.getSwordNum();
			Story s = old.getStory();
			s.setWordCount(s.getWordCount() - lg +section.getSection().length());
			s.setUpdateTime(new Date());
			storyService.edit(s);
			section.setSupdate(new Date());
			section.setSwordNum((long) section.getSection().length());
			sectionService.edit(section);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
