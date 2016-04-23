package com.huayun.ssh.softtest.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.softtest.dao.ITestPlanDao;
import com.huayun.ssh.softtest.model.TestPlan;

@Component("testplanDao")
public class TestPlanDao extends BaseDao<TestPlan, String> implements ITestPlanDao{

}
