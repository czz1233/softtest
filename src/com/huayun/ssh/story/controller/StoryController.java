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
import com.huayun.ssh.story.dao.IStoryTypeDao;
import com.huayun.ssh.story.model.BookRack;
import com.huayun.ssh.story.model.Story;
import com.huayun.ssh.story.model.StoryType;
import com.huayun.ssh.story.service.IStoryService;
import com.huayun.ssh.story.service.IStoryTypeService;
@Controller
@RequestMapping("story/story")
@SessionAttributes("LOGINER")
public class StoryController extends BaseController{
	@Autowired
	private IStoryService storyService;
	@Autowired
	private IStoryTypeService typeService;
	@Autowired
	private IAccountService accountService;
	
	/**
	 * 构造方法
	 */
	public StoryController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/story_list";
	}
	@RequestMapping(value = "readorder")
	public String readorder(){
		
		return "bootstrap/jsp/story/story_readorder";
	}
	@RequestMapping(value = "search")
	public String search(){
		
		return "bootstrap/jsp/story/story_search";
	}
	@RequestMapping(value = "neworder")
	public String neworder(){
		
		return "bootstrap/jsp/story/story_neworder";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<Story> valueList = storyService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "getTableDataByOrder")
		public @ResponseBody JSONObject getTableDataByOrder(){
			JSONObject json = new JSONObject();
			List<Story> valueList = storyService.getTableDataByOrder();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "getTableDataByCreat")
		public @ResponseBody JSONObject getTableDataByCreat(){
			JSONObject json = new JSONObject();
			List<Story> valueList = storyService.getTableDataByCreat();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id,ModelMap map){
			List<StoryType> storyTypeList = typeService.getTableData();
			map.put("storyTypeList", storyTypeList);
			return "bootstrap/jsp/story/story_add";
		}
		@RequestMapping(value = "deleteStory",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteStory(String id){
			storyService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(Story story,HttpSession session,String typeId){
			Account loginer = (Account) session.getAttribute("LOGINER");
			story.setStatus(1);
			story.setCreateTime(new Date());
			story.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			StoryType storyType = typeService.getById(typeId);
			story.setStoryType(storyType);
			Account account = accountService.getById(loginer.getId());
			story.setAuthor(account);
			story.setUpdateTime(new Date());
			story.setCollectNum(0);
			story.setWordCount(0l);
			story.setReadCount(0l);
			storyService.save(story);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			Story story = storyService.getById(id);
			map.put("story", story);
			return "bootstrap/jsp/story/story_edit";
		}
		@RequestMapping(value = "{id}/commentRecord")
		public String commentRecord(@PathVariable("id")String id,ModelMap map){
			Story story = storyService.getById(id);
			map.put("story", story);
			return "bootstrap/jsp/story/story_comment";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(Story Story){
			storyService.edit(Story);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "shoucangStory",method=RequestMethod.POST)
		public @ResponseBody JSONObject shoucangStory(HttpSession session,String id){
			Account loginer = (Account) session.getAttribute("LOGINER");
			Account a = accountService.getById(loginer.getId());
			Story story = storyService.getById(id);
			BookRack bookRack = new BookRack();
			bookRack.setAccount(a);
			bookRack.setStory(story);
			a.getBookRackList().add(bookRack);
			accountService.updateAccount(a);
			story.setCollectNum(story.getCollectNum() +1);
			storyService.edit(story);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
