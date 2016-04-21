package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.IBookRackDao;
import com.huayun.ssh.story.model.BookRack;
import com.huayun.ssh.story.service.IBookRackService;

@Component("bookrackService")
@SuppressWarnings("all")
public class BookRackService implements IBookRackService{
	private static final LogUtil LOGGER = LogUtil.getInstances(BookRackService.class);
	@Autowired
	private IBookRackDao bookrackDao;

	@Override
	public BookRack getByBookRack(String bookrack) {
		BookRack value = null;
		try {
			String hql = "FROM BookRack WHERE bookrack = '" + bookrack +"' AND status=1";
			List<BookRack> list = (List<BookRack>) bookrackDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String bookrack) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM BookRack WHERE nickName LIKE '%" + nickName +"%' AND bookrack LIKE '%" + bookrack +"%' AND status=1 ORDER BY createTime DESC"	;
			value = bookrackDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<BookRack> getTableData(String nickName, String bookrack, int start, int limit) {
		List<BookRack> valueList = null;
		try {
			String hql = "FROM BookRack WHERE nickName LIKE '%" + nickName +"%' AND bookrack LIKE '%" + bookrack +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<BookRack>) bookrackDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<BookRack>() : valueList;
	}

	@Override
	public BookRack save(BookRack bookrack) {
		try {
			bookrack = bookrackDao.save(bookrack);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return bookrack;
	}

	@Override
	public BookRack getById(String id) {
		BookRack value = null;
		try {
			value = bookrackDao.getById(BookRack.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new BookRack() : value;
	}

	@Override
	public BookRack edit(BookRack bookrack) {
		BookRack value = null;
		try {
			String id = bookrack.getId();
			BookRack oldBookRack = getById(id);
			Assert.isNotNull(oldBookRack, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(bookrack, oldBookRack, new String[]{"bookrackRoleList","bookrackRightList"});
			value = bookrackDao.update(oldBookRack);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public BookRack logicDelete(String id) {
		BookRack value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			bookrackDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<BookRack> getTableData(String accountId) {
		List<BookRack> valueList = null;
		try {
			//String hql = "SELECT NEW com.huayun.ssh.story.model.BookRack(A.id) FROM com.huayun.ssh.story.model.BookRack A LEFT JOIN A.account AC WHERE AC.status=1 AND AC.id='" + accountId +"'";
			String hql = "FROM com.huayun.ssh.story.model.BookRack A WHERE A.account.status=1 AND A.account.id='" + accountId +"'";
			valueList = (List<BookRack>) bookrackDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<BookRack>() : valueList;
	}

	@Override
	public void deletebyID(String id) {
		bookrackDao.deleteById(BookRack.class, id);		
	}

}
