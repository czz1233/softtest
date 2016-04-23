package com.huayun.ssh.softtest.service;

import java.util.List;

import com.huayun.ssh.softtest.model.TestPlan;

public interface ITestPlanService {
	
	TestPlan getByTestPlan(String testplan);
	
	int getTableDataCount(String nickName, String testplan);

	List<TestPlan> getTableData(String nickName, String testplan, int start, int limit);

	TestPlan save(TestPlan testplan);

	TestPlan getById(String id);

	TestPlan edit(TestPlan testplan);

	TestPlan logicDelete(String id);

	List<TestPlan> getTableData();
	
	

}
