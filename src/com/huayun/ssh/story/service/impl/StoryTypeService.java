package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.IStoryTypeDao;
import com.huayun.ssh.story.model.StoryType;
import com.huayun.ssh.story.service.IStoryTypeService;

@Component("storytypeService")
@SuppressWarnings("all")
public class StoryTypeService implements IStoryTypeService{
	private static final LogUtil LOGGER = LogUtil.getInstances(StoryTypeService.class);
	@Autowired
	private IStoryTypeDao storytypeDao;

	@Override
	public StoryType getByStoryType(String storytype) {
		StoryType value = null;
		try {
			String hql = "FROM StoryType WHERE storytype = '" + storytype +"' AND status=1";
			List<StoryType> list = (List<StoryType>) storytypeDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String storytype) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM StoryType WHERE nickName LIKE '%" + nickName +"%' AND storytype LIKE '%" + storytype +"%' AND status=1 ORDER BY createTime DESC"	;
			value = storytypeDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<StoryType> getTableData(String nickName, String storytype, int start, int limit) {
		List<StoryType> valueList = null;
		try {
			String hql = "FROM StoryType WHERE nickName LIKE '%" + nickName +"%' AND storytype LIKE '%" + storytype +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<StoryType>) storytypeDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<StoryType>() : valueList;
	}

	@Override
	public StoryType save(StoryType storytype) {
		try {
			storytype = storytypeDao.save(storytype);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return storytype;
	}

	@Override
	public StoryType getById(String id) {
		StoryType value = null;
		try {
			value = storytypeDao.getById(StoryType.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new StoryType() : value;
	}

	@Override
	public StoryType edit(StoryType storytype) {
		StoryType value = null;
		try {
			String id = storytype.getId();
			StoryType oldStoryType = getById(id);
			Assert.isNotNull(oldStoryType, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(storytype, oldStoryType, new String[]{"storytypeRoleList","storytypeRightList"});
			value = storytypeDao.update(oldStoryType);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public StoryType logicDelete(String id) {
		StoryType value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			storytypeDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<StoryType> getTableData() {
		List<StoryType> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.StoryType A WHERE A.status = 1";
			valueList = (List<StoryType>) storytypeDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<StoryType>() : valueList;
	}

}
