package com.huayun.ssh.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.dao.IRightDao;
import com.huayun.ssh.system.model.Right;
import com.huayun.ssh.system.service.IRightService;

@Component("rightService")
@SuppressWarnings("all")
public class RightService implements IRightService{
	
	private static final LogUtil LOGGER = LogUtil.getInstances(RightService.class);
	@Autowired
	private IRightDao rightDao;

	@Override
	public List<String> getRightCodeByAccountId(String accountId) {
		List<String> valueList = null;
		try {
			valueList = rightDao.getRightCodeByAccountId(accountId);
		} catch (Exception e) {
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<String>() : valueList;
	}

	@Override
	public List<Right> getRightByAccountId(String accountId) {
		 List<Right> valueList = null;
		 try {
			 valueList = rightDao.getRightByAccountId(accountId);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Right>() : valueList;
	}

	@Override
	public List<Right> getAllRight() {
		 List<Right> valueList = null;
		 try {
			 valueList = (List<Right>) rightDao.queryHQL("FROM com.huayun.ssh.system.model.Right A WHERE A.status=1");
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Right>() : valueList;
	}

	@Override
	public List<String> getRightsByRoleId(String roleId) {
		 List<String> valueList = null;
		 try {
			 valueList = (List<String>) rightDao.queryHQL("SELECT A.id FROM com.huayun.ssh.system.model.Right A LEFT JOIN A.rightRoleList RR WHERE A.status=1 AND RR.role.id='" + roleId + "'");
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<String>() : valueList;
	}

}
