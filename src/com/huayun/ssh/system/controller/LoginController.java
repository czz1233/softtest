package com.huayun.ssh.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.entity.BaseEntity;
import com.huayun.ssh.common.util.AppException;
import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.common.util.Md5EncoderUtil;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.system.model.Right;
import com.huayun.ssh.system.service.IAccountService;
import com.huayun.ssh.system.service.IRightService;

@RestController
@RequestMapping("common/login")
public class LoginController extends BaseEntity{

	private static final long serialVersionUID = 9219944945149688047L;
	private LogUtil LOGGER = LogUtil.getInstances(LoginController.class);
	@Autowired
	private IAccountService accountService;
	@Autowired
	private IRightService rightService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public JSONObject index(HttpServletRequest request,String account,String password,String browser){
		JSONObject json = new JSONObject();
		try {
			Account loginer = accountService.getByAccount(account);
			if(null == loginer){
				throw new AppException("用户不存在,请核对用户信息");
			}else if(!loginer.getEnable()){
				throw new AppException("该用户已经被禁用");
			}else{
				String rightPassword = loginer.getPassword();
				String loginPassword = Md5EncoderUtil.encode(password);
				if(!rightPassword.equals(loginPassword)){
					throw new AppException("密码不正确");
				}
			}
			//日志信息
			String loginIP = "";
			if(request.getHeader("x-forwarded-for") == null){
				loginIP = request.getRemoteAddr();
			}else{
				loginIP = request.getHeader("x-forwarded-for");
			}
			System.out.println("===========================loginIP:" + loginIP);
			System.out.println("===========================browser:" + browser);
			
			//存放session信息
			//存放账号信息
			Account loginer2 = new Account();
			JavaBeanUtils.copyProperties(loginer, loginer2, new String[]{"accountRoleList","accountRightList"});
			request.getSession().setAttribute("LOGINER", loginer2);
			//该账号所具有的权限代码
			List<String> rightCodeList = rightService.getRightCodeByAccountId(loginer.getId());
			request.getSession().setAttribute("RIGHTS", rightCodeList);
			//查询所有该账号具有的权限菜单
			List<Right> rightList = rightService.getRightByAccountId(loginer.getId());
			//如果有需要，查询所有没有的权限，放入session，再进行拦截，此处不进行该操作
			request.getSession().setAttribute("menuList", rightList);
		} catch (Exception e) {
			AppExceptionUtil.throwException(LOGGER, e);
		}
		
		json.put("ok", true);
		return json;
	}
	@RequestMapping(value = "exit", method = RequestMethod.GET)
	public @ResponseBody JSONObject exit(HttpServletRequest request){
		JSONObject json = new JSONObject();
		request.getSession().removeAttribute("LOGINER");
		request.getSession().removeAttribute("RIGHTS");
		request.getSession().removeAttribute("menuList");
		json.put("ok", true);
		return json;
	}

}
