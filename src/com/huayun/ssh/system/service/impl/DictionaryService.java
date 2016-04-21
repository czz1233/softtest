package com.huayun.ssh.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huayun.ssh.common.util.AppExceptionUtil;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.system.dao.IDictionaryDao;
import com.huayun.ssh.system.model.Dictionary;
import com.huayun.ssh.system.service.IDictionaryService;

@Component("dictionaryService")
@SuppressWarnings("all")
public class DictionaryService implements IDictionaryService{

	private final static LogUtil LOGGER = LogUtil.getInstances(DictionaryService.class);
	@Autowired
	private IDictionaryDao dictionaryDao;
	@Override
	public List<Dictionary> getByType(String dictType) {
		List<Dictionary> valueList = null;
		try {
			String hql = "FROM Dictionary WHERE dictType='" + dictType +"'"	;
			valueList = (List<Dictionary>) dictionaryDao.queryHQL(hql);
		} catch (Exception e) {
			AppExceptionUtil.throwException(LOGGER, e);
		}
		return valueList == null ? new ArrayList<Dictionary>() : valueList;
	}

}
