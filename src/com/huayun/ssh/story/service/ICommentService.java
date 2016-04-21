package com.huayun.ssh.story.service;

import java.util.List;

import com.huayun.ssh.story.model.Comment;

public interface ICommentService {
	
	Comment getByComment(String comment);
	
	int getTableDataCount(String nickName, String comment);

	List<Comment> getTableData(String nickName, String comment, int start, int limit);

	Comment save(Comment comment);

	Comment getById(String id);

	Comment edit(Comment comment);

	Comment logicDelete(String id);

	List<Comment> getTableData();
	
	

}
