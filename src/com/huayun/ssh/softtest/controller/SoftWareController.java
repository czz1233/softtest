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
import com.huayun.ssh.softtest.model.SoftWare;
import com.huayun.ssh.softtest.model.SoftWareType;
import com.huayun.ssh.softtest.service.ISoftWareService;
import com.huayun.ssh.softtest.service.ISoftWareTypeService;
@Controller
@RequestMapping("softtest/software")
@SessionAttributes("LOGINER")
public class SoftWareController extends BaseController{
	@Autowired
	private ISoftWareService softwareService;
	@Autowired
	private ISoftWareTypeService softWareTypeService;
	
	/**
	 * 构造方法
	 */
	public SoftWareController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/softtest/software_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<SoftWare> valueList = softwareService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id,ModelMap map){
			List<SoftWareType> softWareTypeList = softWareTypeService.getTableData();
			map.put("softWareTypeList", softWareTypeList);
			return "bootstrap/jsp/softtest/software_add";
		}
		@RequestMapping(value = "deleteSoftWare",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteSoftWare(String id){
			softwareService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(SoftWare software,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			software.setStatus(1);
			software.setCreateTime(new Date());
			software.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			softwareService.save(software);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			SoftWare software = softwareService.getById(id);
			map.put("software", software);
			return "bootstrap/jsp/softtest/software_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(SoftWare SoftWare){
			softwareService.edit(SoftWare);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
