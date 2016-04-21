package com.huayun.ssh.system.service;

import java.util.List;

import com.huayun.ssh.system.model.Account;

public interface IAccountService {
	
	Account getByAccount(String account);
	
	int getTableDataCount(String nickName, String account);

	List<Account> getTableData(String nickName, String account, int start, int limit);

	Account save(Account account,String[] roleIds);

	Account getById(String id);

	Account edit(Account account,String[] roleIds);

	Account logicDelete(String id);
	
	//bootstrap
	List<Account> getTableData();

	void deleteById(String id);
	
	void updateAccount(Account account);
	
	

}
