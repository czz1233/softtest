package com.huayun.ssh.softtest.controller;

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
import com.huayun.ssh.softtest.model.SoftWareType;
import com.huayun.ssh.softtest.service.ISoftWareTypeService;
@Controller
@RequestMapping("softtest/softwaretype")
@SessionAttributes("LOGINER")
public class SoftWareTypeController extends BaseController{
	@Autowired
	private ISoftWareTypeService softwaretypeService;
	
	/**
	 * 构造方法
	 */
	public SoftWareTypeController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/softtest/softwaretype_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<SoftWareType> valueList = softwaretypeService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/softtest/softwaretype_add";
		}
		@RequestMapping(value = "deleteSoftWareType",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteSoftWareType(String id){
			softwaretypeService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(SoftWareType softwaretype,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			softwaretype.setStatus(1);
			softwaretype.setCreateTime(new Date());
			softwaretype.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			softwaretypeService.save(softwaretype);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			SoftWareType softwaretype = softwaretypeService.getById(id);
			map.put("softwaretype", softwaretype);
			return "bootstrap/jsp/softtest/softwaretype_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(SoftWareType SoftWareType){
			softwaretypeService.edit(SoftWareType);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
