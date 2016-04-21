package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.IStoryDao;
import com.huayun.ssh.story.model.Story;

@Component("storyDao")
public class StoryDao extends BaseDao<Story, String> implements IStoryDao{

}
