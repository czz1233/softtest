package com.huayun.ssh.softtest.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.softtest.dao.ITestPlanTypeDao;
import com.huayun.ssh.softtest.model.TestPlanType;

@Component("testplantypeDao")
public class TestPlanTypeDao extends BaseDao<TestPlanType, String> implements ITestPlanTypeDao{

}
