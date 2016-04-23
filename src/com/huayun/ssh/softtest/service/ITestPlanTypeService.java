package com.huayun.ssh.softtest.service;

import java.util.List;

import com.huayun.ssh.softtest.model.TestPlanType;

public interface ITestPlanTypeService {
	
	TestPlanType getByTestPlanType(String testplantype);
	
	int getTableDataCount(String nickName, String testplantype);

	List<TestPlanType> getTableData(String nickName, String testplantype, int start, int limit);

	TestPlanType save(TestPlanType testplantype);

	TestPlanType getById(String id);

	TestPlanType edit(TestPlanType testplantype);

	TestPlanType logicDelete(String id);

	List<TestPlanType> getTableData();
	
	

}
