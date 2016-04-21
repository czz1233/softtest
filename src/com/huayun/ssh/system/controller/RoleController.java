package com.huayun.ssh.system.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.controller.BaseController;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.system.model.Role;
import com.huayun.ssh.system.service.IRoleService;
@Controller
@RequestMapping("system/role")
@SessionAttributes("LOGINER")
public class RoleController extends BaseController{
	@Autowired
	private IRoleService RoleService;
	
	/**
	 * 构造方法
	 */
	public RoleController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		return "bootstrap/jsp/system/role_list";
	}

		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<Role> valueList = RoleService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(String id){
			return "bootstrap/jsp/system/role_add";
		}
		@RequestMapping(value = "deleteRole",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteRole(String id){
			RoleService.logicDelete(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(Role role,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			role.setStatus(1);
			role.setEnable(true);
			role.setCreateTime(new Date());
			role.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			RoleService.save(role);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			Role role = RoleService.getById(id);
			map.put("role", role);
			return "bootstrap/jsp/system/role_edit";
		}
		@RequestMapping(value = "{id}/roleRightShow")
		public String roleRightShow(@PathVariable("id")String id,ModelMap map){
			Role role = RoleService.getById(id);
			map.put("role", role);
			return "bootstrap/jsp/system/role_right";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(Role Role){
			RoleService.edit(Role);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "addRightToRole",method=RequestMethod.POST)
		public @ResponseBody JSONObject addRightToRole(@RequestParam(required=true,value="rightIds[]")String[] ringhtsId,String roleId){
			Assert.isNotNull(ringhtsId, "表单提交错误，请至少指定一个权限信息");
			Assert.isNotEmpty(roleId, "表单提交错误，请指定权限信息");
			RoleService.addRightToRole(roleId,ringhtsId);
			System.out.println(ringhtsId.length);
			System.out.println(roleId);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "getRoleIdByAccountId",method=RequestMethod.POST)
		public @ResponseBody JSONObject getRoleIdByAccountId(String accountId){
			Assert.isNotEmpty(accountId, "表单提交错误，请指定账号信息");
			List<String> roleIdList = RoleService.getIdsByAccountId(accountId);
			JSONObject json = new JSONObject();
			json.put("roleIdList", roleIdList);
			return json;
		}
	
}
