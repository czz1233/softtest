package com.huayun.ssh.softtest.service;

import java.util.List;

import com.huayun.ssh.softtest.model.SoftWare;

public interface ISoftWareService {
	
	SoftWare getBySoftWare(String software);
	
	int getTableDataCount(String nickName, String software);

	List<SoftWare> getTableData(String nickName, String software, int start, int limit);

	SoftWare save(SoftWare software);

	SoftWare getById(String id);

	SoftWare edit(SoftWare software);

	SoftWare logicDelete(String id);

	List<SoftWare> getTableData();
	
	

}
