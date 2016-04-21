package com.huayun.ssh.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.controller.BaseController;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.system.model.Right;
import com.huayun.ssh.system.service.IRightService;

@Controller
@RequestMapping("system/right")
@SessionAttributes("LOGINER")
public class RightController extends BaseController{
	@Autowired
	private IRightService rightService;

	public RightController() {

	}
	@RequestMapping(value = "getRights")
	public @ResponseBody JSONObject getRights(){
		List<Right> rightList = rightService.getAllRight();
		JSONObject json = new JSONObject();
		json.put("ok", true);
		json.put("treeNodes", rightList);
		return json;
	}
	@RequestMapping(value = "getRightsByRoleId")
	public @ResponseBody JSONObject getRightsByRoleId(String roleId){
		Assert.isNotEmpty(roleId, "表单提交错误，请填写角色信息");
		List<String> rightIds = rightService.getRightsByRoleId(roleId);
		JSONObject json = new JSONObject();
		json.put("ok", true);
		json.put("rightIds", rightIds);
		return json;
	}

}
