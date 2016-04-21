package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.BookRack;

public interface IBookRackService {
	
	BookRack getByBookRack(String bookrack);
	
	int getTableDataCount(String nickName, String bookrack);

	List<BookRack> getTableData(String nickName, String bookrack, int start, int limit);

	BookRack save(BookRack bookrack);

	BookRack getById(String id);

	BookRack edit(BookRack bookrack);

	BookRack logicDelete(String id);

	List<BookRack> getTableData(String accountId);

	void deletebyID(String id);
	
	

}
