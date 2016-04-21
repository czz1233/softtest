package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.IStoryDao;
import com.huayun.ssh.story.model.Story;
import com.huayun.ssh.story.service.IStoryService;

@Component("storyService")
@SuppressWarnings("all")
public class StoryService implements IStoryService{
	private static final LogUtil LOGGER = LogUtil.getInstances(StoryService.class);
	@Autowired
	private IStoryDao storyDao;

	@Override
	public Story getByStory(String story) {
		Story value = null;
		try {
			String hql = "FROM Story WHERE story = '" + story +"' AND status=1";
			List<Story> list = (List<Story>) storyDao.queryHQL(hql);
			if(list != null && 0 < list.size()){
				value = list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public int getTableDataCount(String nickName, String story) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM Story WHERE nickName LIKE '%" + nickName +"%' AND story LIKE '%" + story +"%' AND status=1 ORDER BY createTime DESC"	;
			value = storyDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Story> getTableData(String nickName, String story, int start, int limit) {
		List<Story> valueList = null;
		try {
			String hql = "FROM Story WHERE nickName LIKE '%" + nickName +"%' AND story LIKE '%" + story +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<Story>) storyDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Story>() : valueList;
	}

	@Override
	public Story save(Story story) {
		try {
			story = storyDao.save(story);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return story;
	}

	@Override
	public Story getById(String id) {
		Story value = null;
		try {
			value = storyDao.getById(Story.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new Story() : value;
	}

	@Override
	public Story edit(Story story) {
		Story value = null;
		try {
			String id = story.getId();
			Story oldStory = getById(id);
			Assert.isNotNull(oldStory, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(story, oldStory, new String[]{"storyRoleList","storyRightList"});
			value = storyDao.update(oldStory);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public Story logicDelete(String id) {
		Story value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			storyDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Story> getTableData() {
		List<Story> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.Story A WHERE A.status = 1";
			valueList = (List<Story>) storyDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Story>() : valueList;
	}

	@Override
	public List<Story> getTableDataByOrder() {
		List<Story> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.Story A WHERE A.status = 1 ORDER BY A.readCount DESC";
			valueList = (List<Story>) storyDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Story>() : valueList;
	}

	@Override
	public List<Story> getTableDataByCreat() {
		List<Story> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.Story A WHERE A.status = 1 ORDER BY A.createTime DESC";
			valueList = (List<Story>) storyDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Story>() : valueList;
	}

}
