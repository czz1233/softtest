package com.huayun.ssh.system.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.system.dao.IDictionaryItemDao;
import com.huayun.ssh.system.model.DictionaryItem;

@Component("dictionaryItemDao")
public class DictionaryItemDao extends BaseDao<DictionaryItem, String> implements IDictionaryItemDao{

}
