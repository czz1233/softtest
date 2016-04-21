package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.StoryType;

public interface IStoryTypeService {
	
	StoryType getByStoryType(String storytype);
	
	int getTableDataCount(String nickName, String storytype);

	List<StoryType> getTableData(String nickName, String storytype, int start, int limit);

	StoryType save(StoryType storytype);

	StoryType getById(String id);

	StoryType edit(StoryType storytype);

	StoryType logicDelete(String id);

	List<StoryType> getTableData();
	
	

}
