package com.huayun.ssh.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.dao.IDictionaryItemDao;
import com.huayun.ssh.system.model.DictionaryItem;
import com.huayun.ssh.system.service.IDictionaryItemService;

@Component("dictionaryItemService")
@SuppressWarnings("all")
public class DictionaryItemService implements IDictionaryItemService{

	private static final LogUtil LOGGER = LogUtil.getInstances(DictionaryItemService.class);
	@Autowired
	private IDictionaryItemDao dictionaryItemDao;
	
	@Override
	public List<DictionaryItem> getAll() {
		List<DictionaryItem> valueList = null;
		try {
			String hql = "FROM DictionaryItem";
			valueList = (List<DictionaryItem>) dictionaryItemDao.queryHQL(hql);
		} catch (Exception e) {
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<DictionaryItem>() : valueList;
	}

}
