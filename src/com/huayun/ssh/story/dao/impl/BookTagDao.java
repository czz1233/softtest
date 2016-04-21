package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.IBookTagDao;
import com.huayun.ssh.story.model.BookTag;

@Component("booktagDao")
public class BookTagDao extends BaseDao<BookTag, String> implements IBookTagDao{

}
