package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.BookTag;

public interface IBookTagService {
	
	BookTag getByBookTag(String booktag);
	
	int getTableDataCount(String nickName, String booktag);

	List<BookTag> getTableData(String nickName, String booktag, int start, int limit);

	BookTag save(BookTag booktag);

	BookTag getById(String id);

	BookTag edit(BookTag booktag);

	BookTag logicDelete(String id);

	List<BookTag> getTableData(String accountId);

	void deleteById(String id);
	
	

}
