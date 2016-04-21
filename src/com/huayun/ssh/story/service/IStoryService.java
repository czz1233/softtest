package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.Story;

public interface IStoryService {
	
	Story getByStory(String story);
	
	int getTableDataCount(String nickName, String story);

	List<Story> getTableData(String nickName, String story, int start, int limit);

	Story save(Story story);

	Story getById(String id);

	Story edit(Story story);

	Story logicDelete(String id);

	List<Story> getTableData();

	List<Story> getTableDataByOrder();

	List<Story> getTableDataByCreat();
	
	

}
