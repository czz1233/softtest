package com.huayun.ssh.softtest.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.softtest.dao.ISoftWareTypeDao;
import com.huayun.ssh.softtest.model.SoftWareType;
import com.huayun.ssh.softtest.service.ISoftWareTypeService;

@Component("softwaretypeService")
@SuppressWarnings("all")
public class SoftWareTypeService implements ISoftWareTypeService{
	private static final LogUtil LOGGER = LogUtil.getInstances(SoftWareTypeService.class);
	@Autowired
	private ISoftWareTypeDao softwaretypeDao;

	@Override
	public SoftWareType getBySoftWareType(String softwaretype) {
		SoftWareType value = null;
		try {
			String hql = "FROM SoftWareType WHERE softwaretype = '" + softwaretype +"' AND status=1";
			List<SoftWareType> list = (List<SoftWareType>) softwaretypeDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String softwaretype) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM SoftWareType WHERE nickName LIKE '%" + nickName +"%' AND softwaretype LIKE '%" + softwaretype +"%' AND status=1 ORDER BY createTime DESC"	;
			value = softwaretypeDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<SoftWareType> getTableData(String nickName, String softwaretype, int start, int limit) {
		List<SoftWareType> valueList = null;
		try {
			String hql = "FROM SoftWareType WHERE nickName LIKE '%" + nickName +"%' AND softwaretype LIKE '%" + softwaretype +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<SoftWareType>) softwaretypeDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<SoftWareType>() : valueList;
	}

	@Override
	public SoftWareType save(SoftWareType softwaretype) {
		try {
			softwaretype = softwaretypeDao.save(softwaretype);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return softwaretype;
	}

	@Override
	public SoftWareType getById(String id) {
		SoftWareType value = null;
		try {
			value = softwaretypeDao.getById(SoftWareType.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new SoftWareType() : value;
	}

	@Override
	public SoftWareType edit(SoftWareType softwaretype) {
		SoftWareType value = null;
		try {
			String id = softwaretype.getId();
			SoftWareType oldSoftWareType = getById(id);
			Assert.isNotNull(oldSoftWareType, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(softwaretype, oldSoftWareType, new String[]{"softwaretypeRoleList","softwaretypeRightList"});
			value = softwaretypeDao.update(oldSoftWareType);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public SoftWareType logicDelete(String id) {
		SoftWareType value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			softwaretypeDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<SoftWareType> getTableData() {
		List<SoftWareType> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.softtest.model.SoftWareType A WHERE A.status = 1";
			valueList = (List<SoftWareType>) softwaretypeDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<SoftWareType>() : valueList;
	}

}
