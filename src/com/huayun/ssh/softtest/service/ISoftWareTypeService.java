package com.huayun.ssh.softtest.service;

import java.util.List;

import com.huayun.ssh.softtest.model.SoftWareType;

public interface ISoftWareTypeService {
	
	SoftWareType getBySoftWareType(String softwaretype);
	
	int getTableDataCount(String nickName, String softwaretype);

	List<SoftWareType> getTableData(String nickName, String softwaretype, int start, int limit);

	SoftWareType save(SoftWareType softwaretype);

	SoftWareType getById(String id);

	SoftWareType edit(SoftWareType softwaretype);

	SoftWareType logicDelete(String id);

	List<SoftWareType> getTableData();
	
	

}
