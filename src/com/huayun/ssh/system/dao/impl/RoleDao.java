package com.huayun.ssh.system.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.system.dao.IRoleDao;
import com.huayun.ssh.system.model.Role;

@Component("roleDao")
public class RoleDao extends BaseDao<Role, String> implements IRoleDao{

}
