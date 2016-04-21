package com.huayun.ssh.system.service;

import java.util.List;

import com.huayun.ssh.system.model.Right;

public interface IRightService {
	/**
	 * 获取指定用户的权限代码
	 * @param accountId 账号ID
	 * @return 该账号下所拥有权限的代码
	 */
	List<String> getRightCodeByAccountId(String accountId);
	/**
	 * 获取指定账号的权限信息
	 * @param accountId 账号ID
	 * @return 权限列表信息
	 */
	List<Right> getRightByAccountId(String accountId);
	
	List<Right> getAllRight();
	
	List<String> getRightsByRoleId(String roleId);

}
