package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.IBookTagDao;
import com.huayun.ssh.story.model.BookTag;
import com.huayun.ssh.story.service.IBookTagService;

@Component("booktagService")
@SuppressWarnings("all")
public class BookTagService implements IBookTagService{
	private static final LogUtil LOGGER = LogUtil.getInstances(BookTagService.class);
	@Autowired
	private IBookTagDao booktagDao;

	@Override
	public BookTag getByBookTag(String booktag) {
		BookTag value = null;
		try {
			String hql = "FROM BookTag WHERE booktag = '" + booktag +"' AND status=1";
			List<BookTag> list = (List<BookTag>) booktagDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String booktag) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM BookTag WHERE nickName LIKE '%" + nickName +"%' AND booktag LIKE '%" + booktag +"%' AND status=1 ORDER BY createTime DESC"	;
			value = booktagDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<BookTag> getTableData(String nickName, String booktag, int start, int limit) {
		List<BookTag> valueList = null;
		try {
			String hql = "FROM BookTag WHERE nickName LIKE '%" + nickName +"%' AND booktag LIKE '%" + booktag +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<BookTag>) booktagDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<BookTag>() : valueList;
	}

	@Override
	public BookTag save(BookTag booktag) {
		try {
			booktag = booktagDao.save(booktag);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return booktag;
	}

	@Override
	public BookTag getById(String id) {
		BookTag value = null;
		try {
			value = booktagDao.getById(BookTag.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new BookTag() : value;
	}

	@Override
	public BookTag edit(BookTag booktag) {
		BookTag value = null;
		try {
			String id = booktag.getId();
			BookTag oldBookTag = getById(id);
			Assert.isNotNull(oldBookTag, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(booktag, oldBookTag, new String[]{"booktagRoleList","booktagRightList"});
			value = booktagDao.update(oldBookTag);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public BookTag logicDelete(String id) {
		BookTag value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			booktagDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<BookTag> getTableData(String accountID) {
		List<BookTag> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.BookTag A WHERE A.account.status=1 AND A.account.id='" + accountID +"'";
			valueList = (List<BookTag>) booktagDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<BookTag>() : valueList;
	}

	@Override
	public void deleteById(String id) {
		booktagDao.deleteById(BookTag.class, id);
		
	}

}
