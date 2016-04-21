package com.huayun.ssh.system.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.system.dao.IAccountDao;
import com.huayun.ssh.system.model.Account;

@Component("accountDao")
public class AccountDao extends BaseDao<Account, String> implements IAccountDao{

}
