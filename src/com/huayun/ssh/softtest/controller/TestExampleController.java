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
import com.huayun.ssh.softtest.model.TestExample;
import com.huayun.ssh.softtest.model.TestPlan;
import com.huayun.ssh.softtest.service.ITestExampleService;
import com.huayun.ssh.softtest.service.ITestPlanService;
@Controller
@RequestMapping("softtest/testexample")
@SessionAttributes("LOGINER")
public class TestExampleController extends BaseController{
	@Autowired
	private ITestExampleService testexampleService;
	@Autowired
	private ITestPlanService testPlanService;
	
	/**
	 * 构造方法
	 */
	public TestExampleController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/softtest/testexample_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<TestExample> valueList = testexampleService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id,ModelMap map){
			List<TestPlan> testPlanList = testPlanService.getTableData();
			map.put("testPlanList", testPlanList);
			return "bootstrap/jsp/softtest/testexample_add";
		}
		@RequestMapping(value = "deleteTestExample",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteTestExample(String id){
			testexampleService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(TestExample testexample,HttpSession session,String planId){
			Account loginer = (Account) session.getAttribute("LOGINER");
			testexample.setStatus(1);
			testexample.setCreateTime(new Date());
			testexample.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			TestPlan testPlan = testPlanService.getById(planId);
			testexample.setTestPlan(testPlan);
			testexampleService.save(testexample);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			TestExample testexample = testexampleService.getById(id);
			map.put("testexample", testexample);
			return "bootstrap/jsp/softtest/testexample_edit";
		}
		@RequestMapping(value = "search")
		public String search(String id,ModelMap map){
			TestExample testexample = testexampleService.getById(id);
			map.put("testexample", testexample);
			return "bootstrap/jsp/softtest/testexample_search";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(TestExample TestExample){
			testexampleService.edit(TestExample);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	
}
