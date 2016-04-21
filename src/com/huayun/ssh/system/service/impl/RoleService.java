package com.huayun.ssh.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.dao.IRightDao;
import com.huayun.ssh.system.dao.IRoleDao;
import com.huayun.ssh.system.model.Right;
import com.huayun.ssh.system.model.Role;
import com.huayun.ssh.system.model.RoleRight;
import com.huayun.ssh.system.service.IRightService;
import com.huayun.ssh.system.service.IRoleService;

@Component("roleService")
@SuppressWarnings("all")
public class RoleService implements IRoleService{
	private static final LogUtil LOGGER = LogUtil.getInstances(RoleService.class);
	@Autowired
	private IRoleDao roleDao;
	@Autowired
	private IRightDao rightDao;

	@Override
	public Role getByRole(String role) {
		Role value = null;
		try {
			String hql = "FROM Role WHERE role = '" + role +"' AND status=1";
			List<Role> list = (List<Role>) roleDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String role) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM Role WHERE nickName LIKE '%" + nickName +"%' AND role LIKE '%" + role +"%' AND status=1 ORDER BY createTime DESC"	;
			value = roleDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Role> getTableData(String nickName, String role, int start, int limit) {
		List<Role> valueList = null;
		try {
			String hql = "FROM Role WHERE nickName LIKE '%" + nickName +"%' AND role LIKE '%" + role +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<Role>) roleDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Role>() : valueList;
	}

	@Override
	public Role save(Role role) {
		try {
			role = roleDao.save(role);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return role;
	}

	@Override
	public Role getById(String id) {
		Role value = null;
		try {
			value = roleDao.getById(Role.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new Role() : value;
	}

	@Override
	public Role edit(Role role) {
		Role value = null;
		try {
			String id = role.getId();
			Role oldRole = getById(id);
			Assert.isNotNull(oldRole, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(role, oldRole, new String[]{"roleRoleList","roleRightList"});
			value = roleDao.update(oldRole);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public Role logicDelete(String id) {
		Role value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			roleDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Role> getTableData() {
		List<Role> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.system.model.Role A WHERE A.status = 1";
			valueList = (List<Role>) roleDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Role>() : valueList;
	}

	@Override
	public void addRightToRole(String roleId, String[] ringhtsId) {
		try {
			Role role = roleDao.getById(Role.class, roleId);
			role.getRoleRightList().clear();
			List<Right> rightList = rightDao.getRightByIds(ringhtsId);
			RoleRight rr = null;
			if(null != rightList && 0 < rightList.size()){
				for (Right right : rightList) {
					rr = new RoleRight();
					rr.setRight(right);
					rr.setRole(role);
					role.getRoleRightList().add(rr);
				}
			}
			roleDao.update(role);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e,"角色授予权限信息失败");
		}
		
	}

	@Override
	public List<Role> getAll() {
		List<Role> valueList = null;
		try {
			valueList = (List<Role>) rightDao.queryHQL("FROM com.huayun.ssh.system.model.Role A WHERE A.status = 1");
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e,"获取角色信息失败");
		}
		return valueList == null ? new ArrayList<Role>() : valueList;
	}

	@Override
	public List<Role> getByIds(String[] roleIds) {
		List<Role> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.system.model.Role A WHERE A.status = 1";
			hql = hql + " AND(";
			if(null != roleIds && 0 < roleIds.length){
				for (int i = 0;i<roleIds.length;i++) {
					if(i == 0){
						hql = hql + " A.id='" + roleIds[i] +"'";
					}else{
						hql = hql + " OR A.id='" + roleIds[i] +"'";
					}
				}
			}
			hql = hql + " )";
			valueList = (List<Role>) rightDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e,"获取角色信息失败");
		}
		return valueList == null ? new ArrayList<Role>() : valueList;
	}

	@Override
	public List<String> getIdsByAccountId(String accountId) {
		List<String> valueList = null;
		try {
			String hql = "SELECT A.id FROM com.huayun.ssh.system.model.Role A LEFT JOIN A.roleAccountList RA WHERE A.status = 1 AND RA.account.id='" + accountId +"'";
			valueList = (List<String>) roleDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e,"获取角色信息失败");
		}
		return valueList == null ? new ArrayList<String>() : valueList;
	}

}
