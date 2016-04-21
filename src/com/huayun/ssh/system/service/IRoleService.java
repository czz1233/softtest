package com.huayun.ssh.system.service;

import java.util.List;

import com.huayun.ssh.system.model.Role;

public interface IRoleService {
	
	Role getByRole(String role);
	
	int getTableDataCount(String nickName, String role);

	List<Role> getTableData(String nickName, String role, int start, int limit);

	Role save(Role role);

	Role getById(String id);

	Role edit(Role role);

	Role logicDelete(String id);

	List<Role> getTableData();

	void addRightToRole(String roleId, String[] ringhtsId);

	List<Role> getAll();

	List<Role> getByIds(String[] roleIds);

	List<String> getIdsByAccountId(String accountId);
	
	

}
