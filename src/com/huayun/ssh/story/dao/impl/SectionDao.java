package com.huayun.ssh.story.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.story.dao.ISectionDao;
import com.huayun.ssh.story.model.Section;

@Component("sectionDao")
public class SectionDao extends BaseDao<Section, String> implements ISectionDao{

}
