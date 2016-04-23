package com.huayun.ssh.softtest.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.softtest.dao.ITestPlanDao;
import com.huayun.ssh.softtest.model.TestPlan;
import com.huayun.ssh.softtest.service.ITestPlanService;

@Component("testplanService")
@SuppressWarnings("all")
public class TestPlanService implements ITestPlanService{
	private static final LogUtil LOGGER = LogUtil.getInstances(TestPlanService.class);
	@Autowired
	private ITestPlanDao testplanDao;

	@Override
	public TestPlan getByTestPlan(String testplan) {
		TestPlan value = null;
		try {
			String hql = "FROM TestPlan WHERE testplan = '" + testplan +"' AND status=1";
			List<TestPlan> list = (List<TestPlan>) testplanDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String testplan) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM TestPlan WHERE nickName LIKE '%" + nickName +"%' AND testplan LIKE '%" + testplan +"%' AND status=1 ORDER BY createTime DESC"	;
			value = testplanDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestPlan> getTableData(String nickName, String testplan, int start, int limit) {
		List<TestPlan> valueList = null;
		try {
			String hql = "FROM TestPlan WHERE nickName LIKE '%" + nickName +"%' AND testplan LIKE '%" + testplan +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<TestPlan>) testplanDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestPlan>() : valueList;
	}

	@Override
	public TestPlan save(TestPlan testplan) {
		try {
			testplan = testplanDao.save(testplan);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return testplan;
	}

	@Override
	public TestPlan getById(String id) {
		TestPlan value = null;
		try {
			value = testplanDao.getById(TestPlan.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new TestPlan() : value;
	}

	@Override
	public TestPlan edit(TestPlan testplan) {
		TestPlan value = null;
		try {
			String id = testplan.getId();
			TestPlan oldTestPlan = getById(id);
			Assert.isNotNull(oldTestPlan, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(testplan, oldTestPlan, new String[]{"testplanRoleList","testplanRightList"});
			value = testplanDao.update(oldTestPlan);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public TestPlan logicDelete(String id) {
		TestPlan value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			testplanDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestPlan> getTableData() {
		List<TestPlan> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.softtest.model.TestPlan A WHERE A.status = 1";
			valueList = (List<TestPlan>) testplanDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestPlan>() : valueList;
	}

}
