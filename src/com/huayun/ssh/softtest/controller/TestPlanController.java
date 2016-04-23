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
import com.huayun.ssh.softtest.model.TestPlan;
import com.huayun.ssh.softtest.model.TestPlanType;
import com.huayun.ssh.softtest.service.ITestPlanService;
import com.huayun.ssh.softtest.service.ITestPlanTypeService;
@Controller
@RequestMapping("softtest/testplan")
@SessionAttributes("LOGINER")
public class TestPlanController extends BaseController{
	@Autowired
	private ITestPlanService testplanService;
	@Autowired
	private ITestPlanTypeService testPlanTypeService; 
	
	/**
	 * 构造方法
	 */
	public TestPlanController() {

	}
		@RequestMapping(value = "index")
		public String index(){
			
			return "bootstrap/jsp/softtest/testplan_list";
		}
		@RequestMapping(value = "audit")
		public String audit(){
			
			return "bootstrap/jsp/softtest/testplan_audit";
		}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<TestPlan> valueList = testplanService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id,ModelMap map){
			List<TestPlanType> testPlanTypeList = testPlanTypeService.getTableData();
			map.put("testPlanTypeList", testPlanTypeList);
			return "bootstrap/jsp/softtest/testplan_add";
		}
		@RequestMapping(value = "deleteTestPlan",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteTestPlan(String id){
			testplanService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(TestPlan testplan,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			testplan.setStatus(1);
			testplan.setState(0);
			testplan.setCreateTime(new Date());
			testplan.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			testplanService.save(testplan);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			TestPlan testplan = testplanService.getById(id);
			map.put("testplan", testplan);
			return "bootstrap/jsp/softtest/testplan_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(TestPlan TestPlan){
			testplanService.edit(TestPlan);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "auditPass",method=RequestMethod.POST)
		public @ResponseBody JSONObject auditPass(String id){
			TestPlan testPlan = new TestPlan();
			testPlan.setId(id);
			testPlan.setState(1);
			testplanService.edit(testPlan);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "auditNoPass",method=RequestMethod.POST)
		public @ResponseBody JSONObject auditNoPass(String id){
			TestPlan testPlan = new TestPlan();
			testPlan.setId(id);
			testPlan.setState(-1);
			testplanService.edit(testPlan);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
