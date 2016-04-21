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
import com.huayun.ssh.story.model.StoryType;
import com.huayun.ssh.story.service.IStoryTypeService;
@Controller
@RequestMapping("story/storytype")
@SessionAttributes("LOGINER")
public class StoryTypeController extends BaseController{
	@Autowired
	private IStoryTypeService storytypeService;
	
	/**
	 * 构造方法
	 */
	public StoryTypeController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/storytype_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<StoryType> valueList = storytypeService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/story/storytype_add";
		}
		@RequestMapping(value = "deleteStoryType",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteStoryType(String id){
			storytypeService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(StoryType storytype,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			storytype.setStatus(1);
			storytype.setCreateTime(new Date());
			storytype.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			storytypeService.save(storytype);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			StoryType storytype = storytypeService.getById(id);
			map.put("storytype", storytype);
			return "bootstrap/jsp/story/storytype_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(StoryType StoryType){
			storytypeService.edit(StoryType);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
