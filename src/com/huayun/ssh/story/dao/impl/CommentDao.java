package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.ICommentDao;
import com.huayun.ssh.story.model.Comment;

@Component("commentDao")
public class CommentDao extends BaseDao<Comment, String> implements ICommentDao{

}
