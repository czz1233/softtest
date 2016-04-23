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
import com.huayun.ssh.softtest.model.TestPlanType;
import com.huayun.ssh.softtest.service.ITestPlanTypeService;
@Controller
@RequestMapping("softtest/testplantype")
@SessionAttributes("LOGINER")
public class TestPlanTypeController extends BaseController{
	@Autowired
	private ITestPlanTypeService testplantypeService;
	
	/**
	 * 构造方法
	 */
	public TestPlanTypeController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/softtest/testplantype_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<TestPlanType> valueList = testplantypeService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/softtest/testplantype_add";
		}
		@RequestMapping(value = "deleteTestPlanType",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteTestPlanType(String id){
			testplantypeService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(TestPlanType testplantype,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			testplantype.setStatus(1);
			testplantype.setCreateTime(new Date());
			testplantype.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			testplantypeService.save(testplantype);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			TestPlanType testplantype = testplantypeService.getById(id);
			map.put("testplantype", testplantype);
			return "bootstrap/jsp/softtest/testplantype_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(TestPlanType TestPlanType){
			testplantypeService.edit(TestPlanType);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
