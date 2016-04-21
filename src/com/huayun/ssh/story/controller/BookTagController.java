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
import com.huayun.ssh.story.model.BookTag;
import com.huayun.ssh.story.model.Section;
import com.huayun.ssh.story.service.IBookTagService;
@Controller
@RequestMapping("story/booktag")
@SessionAttributes("LOGINER")
public class BookTagController extends BaseController{
	@Autowired
	private IBookTagService booktagService;
	
	/**
	 * 构造方法
	 */
	public BookTagController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/booktag_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			JSONObject json = new JSONObject();
			List<BookTag> valueList = booktagService.getTableData(loginer.getId());
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/story/booktag_add";
		}
		@RequestMapping(value = "deleteBookTag",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteBookTag(String id){
			booktagService.deleteById(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(BookTag booktag,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			booktag.setStatus(1);
			booktag.setCreateTime(new Date());
			booktag.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			booktagService.save(booktag);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			BookTag booktag = booktagService.getById(id);
			Section section = booktag.getSection();
			map.put("section", section);
			return "bootstrap/jsp/story/section_read";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(BookTag BookTag){
			booktagService.edit(BookTag);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
