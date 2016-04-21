package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.Section;

public interface ISectionService {
	
	Section getBySection(String section);
	
	int getTableDataCount(String nickName, String section);

	List<Section> getTableData(String nickName, String section, int start, int limit);

	Section save(Section section);

	Section getById(String id);

	Section edit(Section section);

	Section logicDelete(String id);

	List<Section> getTableData();
	
	

}
