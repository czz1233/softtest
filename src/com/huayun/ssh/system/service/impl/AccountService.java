package com.huayun.ssh.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.dao.IAccountDao;
import com.huayun.ssh.system.model.Account;
import com.huayun.ssh.system.model.AccountRole;
import com.huayun.ssh.system.model.Role;
import com.huayun.ssh.system.service.IAccountService;
import com.huayun.ssh.system.service.IRoleService;

@Component("accountService")
@SuppressWarnings("all")
public class AccountService implements IAccountService{
	private static final LogUtil LOGGER = LogUtil.getInstances(AccountService.class);
	@Autowired
	private IAccountDao accountDao;
	@Autowired
	private IRoleService roleService;

	@Override
	public Account getByAccount(String account) {
		Account value = null;
		try {
			String hql = "FROM Account WHERE account = '" + account +"' AND status=1";
			List<Account> list = (List<Account>) accountDao.queryHQL(hql);
			if(list != null && 0 < list.size()){
				value = list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public int getTableDataCount(String nickName, String account) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM Account WHERE nickName LIKE '%" + nickName +"%' AND account LIKE '%" + account +"%' AND status=1 ORDER BY createTime DESC"	;
			value = accountDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Account> getTableData(String nickName, String account, int start, int limit) {
		List<Account> valueList = null;
		try {
			String hql = "FROM Account WHERE nickName LIKE '%" + nickName +"%' AND account LIKE '%" + account +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<Account>) accountDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Account>() : valueList;
	}

	@Override
	public Account save(Account account,String[] roleIds) {
		try {
			List<Account> valueList = (List<Account>) accountDao.queryHQL("FROM com.huayun.ssh.system.model.Account A WHERE A.account = '" + account.getAccount() +"'");
			Assert.isNull(valueList, "账号已经存在，请选择其他账号信息");
			account = accountDao.save(account);
			account.getAccountRoleList().clear();
			List<Role> roleList = roleService.getByIds(roleIds);
			AccountRole ar = null;
			if(null != roleList && 0 < roleList.size()){
				for (int i = 0; i < roleList.size(); i++) {
					ar = new AccountRole();
					ar.setAccount(account);
					ar.setRole(roleList.get(i));
					account.getAccountRoleList().add(ar);
				}
			}
			accountDao.update(account);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return account;
	}

	@Override
	public Account getById(String id) {
		Account value = null;
		try {
			value = accountDao.getById(Account.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new Account() : value;
	}

	@Override
	public Account edit(Account account,String[] roleIds) {
		Account value = null;
		try {
			String id = account.getId();
			Account oldAccount = getById(id);
			Assert.isNotNull(oldAccount, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(account, oldAccount, new String[]{"accountRoleList","accountRightList"});
			
			oldAccount.getAccountRoleList().clear();
			List<Role> roleList = roleService.getByIds(roleIds);
			AccountRole ar = null;
			if(null != roleList && 0 < roleList.size()){
				for (int i = 0; i < roleList.size(); i++) {
					ar = new AccountRole();
					ar.setAccount(oldAccount);
					ar.setRole(roleList.get(i));
					oldAccount.getAccountRoleList().add(ar);
				}
			}
			value = accountDao.update(oldAccount);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public Account logicDelete(String id) {
		Account value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			accountDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	//bootstrap
	@Override
	public List<Account> getTableData() {
		List<Account> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.system.model.Account A WHERE A.status = 1";
			valueList = (List<Account>) accountDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Account>() : valueList;
	}

	@Override
	public void deleteById(String id) {
		accountDao.deleteById(Account.class, id);
	}

	@Override
	public void updateAccount(Account account) {
		try {
			Account o = accountDao.getById(Account.class, account.getId());
			Assert.isNotNull(o, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(account, o, new String[]{"accountRoleList","accountRightList"});
			accountDao.update(o);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		
	}

}
