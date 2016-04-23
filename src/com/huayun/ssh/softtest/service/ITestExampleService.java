package com.huayun.ssh.softtest.service;

import java.util.List;

import com.huayun.ssh.softtest.model.TestExample;

public interface ITestExampleService {
	
	TestExample getByTestExample(String testexample);
	
	int getTableDataCount(String nickName, String testexample);

	List<TestExample> getTableData(String nickName, String testexample, int start, int limit);

	TestExample save(TestExample testexample);

	TestExample getById(String id);

	TestExample edit(TestExample testexample);

	TestExample logicDelete(String id);

	List<TestExample> getTableData();
	
	

}
