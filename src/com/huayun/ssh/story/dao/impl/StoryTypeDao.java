package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.IStoryTypeDao;
import com.huayun.ssh.story.model.StoryType;

@Component("storytypeDao")
public class StoryTypeDao extends BaseDao<StoryType, String> implements IStoryTypeDao{

}
