package com.huayun.ssh.system.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.huayun.ssh.common.util.Md5EncoderUtil;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.system.model.Role;
import com.huayun.ssh.system.service.IAccountService;
import com.huayun.ssh.system.service.IRoleService;
@Controller
@RequestMapping("system/account")
@SessionAttributes("LOGINER")
public class AccountController extends BaseController{
	@Autowired
	private IAccountService accountService;
	@Autowired
	private IRoleService roleService;
	
	/**
	 * 构造方法
	 */
	public AccountController() {

	}
	@RequestMapping(value = "index")
	public String index(){
		
		//return "page/jsp/system/account_index";
		return "bootstrap/jsp/sys/account_list";
	}
	//bootstrap begin
		@RequestMapping(value = "getTableData")
		public @ResponseBody JSONObject getTableData(){
			JSONObject json = new JSONObject();
			List<Account> valueList = accountService.getTableData();
			json.put("data", valueList);
			return json;
		}
		@RequestMapping(value = "addRecordShow")
		public String addRecordShow(ModelMap map){
			List<Role> roleList = roleService.getAll();
			map.put("roleList", roleList);
			return "bootstrap/jsp/sys/account_add";
		}
		@RequestMapping(value = "deleteAccount",method=RequestMethod.POST)
		public @ResponseBody JSONObject deleteAccount(String id){
		//	accountService.logicDelete(id);
			accountService.deleteById(id);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "save",method=RequestMethod.POST)
		public @ResponseBody JSONObject save(Account account,HttpSession session,@RequestParam(value="roleId",required=false)String[] roleIds){
			Assert.isNotNull(roleIds, "表单提交错误，请至少选择一个角色信息");
			Account loginer = (Account) session.getAttribute("LOGINER");
			account.setPassword(Md5EncoderUtil.encode("123456"));
			account.setStatus(1);
			account.setCreateTime(new Date());
			account.setEnable(true);
			account.setCreator(loginer.getNickName() + "【" + loginer.getAccount() + "】");
			accountService.save(account,roleIds);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "regist",method=RequestMethod.POST)
		public @ResponseBody JSONObject regist(Account account,HttpSession session){
			account.setPassword(Md5EncoderUtil.encode("123456"));
			account.setStatus(1);
			account.setCreateTime(new Date());
			account.setEnable(true);
			String[] roleIds = null; 
			if("0".equals(account.getType())){
				roleIds = new String[]{"0"};
			}
			if("1".equals(account.getType())){
				roleIds = new String[]{"1"};
			}
			accountService.save(account,roleIds);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "{id}/editRecordShow")
		public String editRecordShow(@PathVariable("id")String id,ModelMap map){
			Account account = accountService.getById(id);
			map.put("account", account);
			List<Role> roleList = roleService.getAll();
			map.put("roleList", roleList);
			return "bootstrap/jsp/sys/account_edit";
		}
		@RequestMapping(value = "edit",method=RequestMethod.POST)
		public @ResponseBody JSONObject edit(Account account,@RequestParam(value="roleId",required=false)String[] roleIds){
			accountService.edit(account,roleIds);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
		@RequestMapping(value = "updatepwd",method=RequestMethod.POST)
		public @ResponseBody JSONObject updatepwd(String oldPwd,String newPwd,HttpSession session){
			Account loginer = (Account) session.getAttribute("LOGINER");
			String p = Md5EncoderUtil.encode(oldPwd);
			Assert.isTrue(p.equals(loginer.getPassword()), "原密码不正确");
			Account account = new Account();
			account.setId(loginer.getId());
			account.setPassword(Md5EncoderUtil.encode(newPwd));
			accountService.updateAccount(account);
			JSONObject json = new JSONObject();
			json.put("ok", true);
			return json;
		}
	//bootstrap end
	@RequestMapping(value = "loadTableData")
	public @ResponseBody JSONObject loadTableData(@RequestParam(defaultValue="",required=false)String nickName,@RequestParam(defaultValue="",required=false)String account,int page,int rows){
		JSONObject json = new JSONObject();
		int total = accountService.getTableDataCount(nickName,account);
		int start = (page-1) * rows;
		List<Account> valueList = accountService.getTableData(nickName, account, start, rows);
		json.put("total", total);
		json.put("rows", valueList);
		return json;
	}
	@RequestMapping(value = "showAdd")
	public String showAdd(){
		
		return "page/jsp/system/account_add";
	}
	
	@RequestMapping(value = "showEdit")
	public String showEdit(ModelMap map,String id){
		Account account = accountService.getById(id);
		map.put("account", account);
		return "page/jsp/system/account_edit";
	}

	@RequestMapping(value = "test01", method = RequestMethod.GET)
	public @ResponseBody String test01(){
		
		return "你好";
	}
	@RequestMapping(value = "test02", method = RequestMethod.GET)
	public ResponseEntity<Account> test02(){
		Account account = new Account();
		account.setId("张三");
		account.setSex("木");
		ResponseEntity<Account> a = new ResponseEntity<Account>(account,HttpStatus.OK);
		return a;
	}
	@RequestMapping(value = "test03", method = RequestMethod.GET)
	public ResponseEntity<JSONObject> test03(){
		JSONObject json = new JSONObject();
		json.put("ok", true);
		json.put("hello","你好");
		json.put("int",1);
		json.put("int2","2");
		ResponseEntity<JSONObject> a = new ResponseEntity<JSONObject>(json,HttpStatus.OK);
		return a;
	}
	@RequestMapping(value = "/{id}/test04", method = RequestMethod.GET)
	public ResponseEntity<JSONObject> test04(@PathVariable("id")String id,String name){
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name",name);
		System.out.println(id);
		System.out.println(name);
		ResponseEntity<JSONObject> a = new ResponseEntity<JSONObject>(json,HttpStatus.OK);
		return a;
	}

	
}
