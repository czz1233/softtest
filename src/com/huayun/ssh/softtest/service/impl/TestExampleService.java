package com.huayun.ssh.softtest.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.softtest.dao.ITestExampleDao;
import com.huayun.ssh.softtest.model.TestExample;
import com.huayun.ssh.softtest.service.ITestExampleService;

@Component("testexampleService")
@SuppressWarnings("all")
public class TestExampleService implements ITestExampleService{
	private static final LogUtil LOGGER = LogUtil.getInstances(TestExampleService.class);
	@Autowired
	private ITestExampleDao testexampleDao;

	@Override
	public TestExample getByTestExample(String testexample) {
		TestExample value = null;
		try {
			String hql = "FROM TestExample WHERE testexample = '" + testexample +"' AND status=1";
			List<TestExample> list = (List<TestExample>) testexampleDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String testexample) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM TestExample WHERE nickName LIKE '%" + nickName +"%' AND testexample LIKE '%" + testexample +"%' AND status=1 ORDER BY createTime DESC"	;
			value = testexampleDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestExample> getTableData(String nickName, String testexample, int start, int limit) {
		List<TestExample> valueList = null;
		try {
			String hql = "FROM TestExample WHERE nickName LIKE '%" + nickName +"%' AND testexample LIKE '%" + testexample +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<TestExample>) testexampleDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestExample>() : valueList;
	}

	@Override
	public TestExample save(TestExample testexample) {
		try {
			testexample = testexampleDao.save(testexample);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return testexample;
	}

	@Override
	public TestExample getById(String id) {
		TestExample value = null;
		try {
			value = testexampleDao.getById(TestExample.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new TestExample() : value;
	}

	@Override
	public TestExample edit(TestExample testexample) {
		TestExample value = null;
		try {
			String id = testexample.getId();
			TestExample oldTestExample = getById(id);
			Assert.isNotNull(oldTestExample, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(testexample, oldTestExample, new String[]{"testexampleRoleList","testexampleRightList"});
			value = testexampleDao.update(oldTestExample);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public TestExample logicDelete(String id) {
		TestExample value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			testexampleDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<TestExample> getTableData() {
		List<TestExample> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.softtest.model.TestExample A WHERE A.status = 1";
			valueList = (List<TestExample>) testexampleDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<TestExample>() : valueList;
	}

}
