package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.ISectionDao;
import com.huayun.ssh.story.model.Section;
import com.huayun.ssh.story.service.ISectionService;

@Component("sectionService")
@SuppressWarnings("all")
public class SectionService implements ISectionService{
	private static final LogUtil LOGGER = LogUtil.getInstances(SectionService.class);
	@Autowired
	private ISectionDao sectionDao;

	@Override
	public Section getBySection(String section) {
		Section value = null;
		try {
			String hql = "FROM Section WHERE section = '" + section +"' AND status=1";
			List<Section> list = (List<Section>) sectionDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String section) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM Section WHERE nickName LIKE '%" + nickName +"%' AND section LIKE '%" + section +"%' AND status=1 ORDER BY createTime DESC"	;
			value = sectionDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Section> getTableData(String nickName, String section, int start, int limit) {
		List<Section> valueList = null;
		try {
			String hql = "FROM Section WHERE nickName LIKE '%" + nickName +"%' AND section LIKE '%" + section +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<Section>) sectionDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Section>() : valueList;
	}

	@Override
	public Section save(Section section) {
		try {
			section = sectionDao.save(section);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return section;
	}

	@Override
	public Section getById(String id) {
		Section value = null;
		try {
			value = sectionDao.getById(Section.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new Section() : value;
	}

	@Override
	public Section edit(Section section) {
		Section value = null;
		try {
			String id = section.getId();
			Section oldSection = getById(id);
			Assert.isNotNull(oldSection, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(section, oldSection, new String[]{"sectionRoleList","sectionRightList"});
			value = sectionDao.update(oldSection);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public Section logicDelete(String id) {
		Section value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			sectionDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Section> getTableData() {
		List<Section> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.Section A WHERE A.status = 1";
			valueList = (List<Section>) sectionDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Section>() : valueList;
	}

}
