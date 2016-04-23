package com.huayun.ssh.softtest.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.softtest.dao.ITestPlanTypeDao;
import com.huayun.ssh.softtest.model.TestPlanType;
import com.huayun.ssh.softtest.service.ITestPlanTypeService;

@Component("testplantypeService")
@SuppressWarnings("all")
public class TestPlanTypeService implements ITestPlanTypeService{
	private static final LogUtil LOGGER = LogUtil.getInstances(TestPlanTypeService.class);
	@Autowired
	private ITestPlanTypeDao testplantypeDao;

	@Override
	public TestPlanType getByTestPlanType(String testplantype) {
		TestPlanType value = null;
		try {
			String hql = "FROM TestPlanType WHERE testplantype = '" + testplantype +"' AND status=1";
			List<TestPlanType> list = (List<TestPlanType>) testplantypeDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String testplantype) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM TestPlanType WHERE nickName LIKE '%" + nickName +"%' AND testplantype LIKE '%" + testplantype +"%' AND status=1 ORDER BY createTime DESC"	;
			value = testplantypeDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestPlanType> getTableData(String nickName, String testplantype, int start, int limit) {
		List<TestPlanType> valueList = null;
		try {
			String hql = "FROM TestPlanType WHERE nickName LIKE '%" + nickName +"%' AND testplantype LIKE '%" + testplantype +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<TestPlanType>) testplantypeDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestPlanType>() : valueList;
	}

	@Override
	public TestPlanType save(TestPlanType testplantype) {
		try {
			testplantype = testplantypeDao.save(testplantype);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return testplantype;
	}

	@Override
	public TestPlanType getById(String id) {
		TestPlanType value = null;
		try {
			value = testplantypeDao.getById(TestPlanType.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new TestPlanType() : value;
	}

	@Override
	public TestPlanType edit(TestPlanType testplantype) {
		TestPlanType value = null;
		try {
			String id = testplantype.getId();
			TestPlanType oldTestPlanType = getById(id);
			Assert.isNotNull(oldTestPlanType, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(testplantype, oldTestPlanType, new String[]{"testplantypeRoleList","testplantypeRightList"});
			value = testplantypeDao.update(oldTestPlanType);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public TestPlanType logicDelete(String id) {
		TestPlanType value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			testplantypeDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestPlanType> getTableData() {
		List<TestPlanType> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.softtest.model.TestPlanType A WHERE A.status = 1";
			valueList = (List<TestPlanType>) testplantypeDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestPlanType>() : valueList;
	}

}
