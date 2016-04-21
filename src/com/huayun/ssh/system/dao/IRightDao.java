package com.huayun.ssh.system.dao;

import java.util.List;

import com.huayun.ssh.common.dao.IBaseDao;
import com.huayun.ssh.system.model.Right;

public interface IRightDao extends IBaseDao<Right, String>{
	
	/**
	 * @param accountId 账号ID
	 * @return 查询该账号具有的所有权限的代码值
	 */
	List<String> getRightCodeByAccountId(String accountId);
	/**
	 * 获取账号下所有的权限信息
	 * @param accountId 账号ID
	 * @return 该账号具有的权限列表
	 */
	List<Right> getRightByAccountId(String accountId);
	/**
	 * 根据权限ID获取权限信息
	 * @param roleId
	 * @return
	 */
	List<Right> getRightByIds(String[] rightsId);

}
