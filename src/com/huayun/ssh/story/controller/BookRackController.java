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
import com.huayun.ssh.story.model.BookRack;
import com.huayun.ssh.story.service.IBookRackService;
@Controller
@RequestMapping("story/bookrack")
@SessionAttributes("LOGINER")
public class BookRackController extends BaseController{
	@Autowired
	private IBookRackService bookrackService;
	
	/**
	 * 构造方法
	 */
	public BookRackController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/story/bookrack_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			JSONObject json = new JSONObject();
			List<BookRack> valueList = bookrackService.getTableData(loginer.getId());
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/story/bookrack_add";
		}
		@RequestMapping(value = "deleteBookRack",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteBookRack(String id){
			bookrackService.deletebyID(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(BookRack bookrack,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			bookrack.setStatus(1);
			bookrack.setCreateTime(new Date());
			bookrack.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			bookrackService.save(bookrack);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			BookRack bookrack = bookrackService.getById(id);
			map.put("bookrack", bookrack);
			return "bootstrap/jsp/story/bookrack_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(BookRack BookRack){
			bookrackService.edit(BookRack);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
