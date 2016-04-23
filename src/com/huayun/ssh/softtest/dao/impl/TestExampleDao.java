package com.huayun.ssh.softtest.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.softtest.dao.ITestExampleDao;
import com.huayun.ssh.softtest.model.TestExample;

@Component("testexampleDao")
public class TestExampleDao extends BaseDao<TestExample, String> implements ITestExampleDao{

}
