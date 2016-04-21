package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.IBookRackDao;
import com.huayun.ssh.story.model.BookRack;

@Component("bookrackDao")
public class BookRackDao extends BaseDao<BookRack, String> implements IBookRackDao{

}
