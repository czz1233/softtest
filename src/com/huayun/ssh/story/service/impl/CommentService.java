package com.huayun.ssh.story.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.Assert;
import com.huayun.ssh.common.util.JavaBeanUtils;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.story.dao.ICommentDao;
import com.huayun.ssh.story.model.Comment;
import com.huayun.ssh.story.service.ICommentService;

@Component("commentService")
@SuppressWarnings("all")
public class CommentService implements ICommentService{
	private static final LogUtil LOGGER = LogUtil.getInstances(CommentService.class);
	@Autowired
	private ICommentDao commentDao;

	@Override
	public Comment getByComment(String comment) {
		Comment value = null;
		try {
			String hql = "FROM Comment WHERE comment = '" + comment +"' AND status=1";
			List<Comment> list = (List<Comment>) commentDao.queryHQL(hql);
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
	public int getTableDataCount(String nickName, String comment) {
		int value = 0;
		try {
			String hql = "SELECT COUNT(*) FROM Comment WHERE nickName LIKE '%" + nickName +"%' AND comment LIKE '%" + comment +"%' AND status=1 ORDER BY createTime DESC"	;
			value = commentDao.getTotalCount(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Comment> getTableData(String nickName, String comment, int start, int limit) {
		List<Comment> valueList = null;
		try {
			String hql = "FROM Comment WHERE nickName LIKE '%" + nickName +"%' AND comment LIKE '%" + comment +"%'  AND status=1  ORDER BY createTime DESC"	;
			valueList = (List<Comment>) commentDao.getByPage(hql, start, limit);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Comment>() : valueList;
	}

	@Override
	public Comment save(Comment comment) {
		try {
			comment = commentDao.save(comment);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return comment;
	}

	@Override
	public Comment getById(String id) {
		Comment value = null;
		try {
			value = commentDao.getById(Comment.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value == null ? new Comment() : value;
	}

	@Override
	public Comment edit(Comment comment) {
		Comment value = null;
		try {
			String id = comment.getId();
			Comment oldComment = getById(id);
			Assert.isNotNull(oldComment, "没有找到需要更新的记录，该记录或许已经被删除");
			JavaBeanUtils.copyProperties(comment, oldComment, new String[]{"commentRoleList","commentRightList"});
			value = commentDao.update(oldComment);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public Comment logicDelete(String id) {
		Comment value = null ;
		try {
			value = getById(id);
			Assert.isNotNull(value, "没有找到该记录，该记录或许已经被删除");
			value.setStatus(-1);
			commentDao.update(value);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return value;
	}

	@Override
	public List<Comment> getTableData() {
		List<Comment> valueList = null;
		try {
			String hql = "FROM com.huayun.ssh.story.model.Comment A WHERE A.status = 1";
			valueList = (List<Comment>) commentDao.queryHQL(hql);
		} catch (Exception e) {
			e.printStackTrace();
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Comment>() : valueList;
	}

}
