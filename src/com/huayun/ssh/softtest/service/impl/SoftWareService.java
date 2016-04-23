package com.huayun.ssh.softtest.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.softtest.dao.ISoftWareDao;
import com.huayun.ssh.softtest.model.SoftWare;
import com.huayun.ssh.softtest.service.ISoftWareService;

@Component("softwareService")
@SuppressWarnings("all")
public class SoftWareService implements ISoftWareService{
	private static final LogUtil LOGGER = LogUtil.getInstances(SoftWareService.class);
	@Autowired
	private ISoftWareDao softwareDao;

	@Override
	public SoftWare getBySoftWare(String software) {
		SoftWare value = null;
		try {
			String hql = "FROM SoftWare WHERE software = '" + software +"' AND status=1";
			List<SoftWare> list = (List<SoftWare>) softwareDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String software) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM SoftWare WHERE nickName LIKE '%" + nickName +"%' AND software LIKE '%" + software +"%' AND status=1 ORDER BY createTime DESC"	;
			value = softwareDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<SoftWare> getTableData(String nickName, String software, int start, int limit) {
		List<SoftWare> valueList = null;
		try {
			String hql = "FROM SoftWare WHERE nickName LIKE '%" + nickName +"%' AND software LIKE '%" + software +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<SoftWare>) softwareDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<SoftWare>() : valueList;
	}

	@Override
	public SoftWare save(SoftWare software) {
		try {
			software = softwareDao.save(software);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return software;
	}

	@Override
	public SoftWare getById(String id) {
		SoftWare value = null;
		try {
			value = softwareDao.getById(SoftWare.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new SoftWare() : value;
	}

	@Override
	public SoftWare edit(SoftWare software) {
		SoftWare value = null;
		try {
			String id = software.getId();
			SoftWare oldSoftWare = getById(id);
			Assert.isNotNull(oldSoftWare, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(software, oldSoftWare, new String[]{"softwareRoleList","softwareRightList"});
			value = softwareDao.update(oldSoftWare);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public SoftWare logicDelete(String id) {
		SoftWare value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			softwareDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<SoftWare> getTableData() {
		List<SoftWare> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.softtest.model.SoftWare A WHERE A.status = 1";
			valueList = (List<SoftWare>) softwareDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<SoftWare>() : valueList;
	}

}
