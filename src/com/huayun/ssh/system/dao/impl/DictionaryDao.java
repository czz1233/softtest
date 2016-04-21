package com.huayun.ssh.system.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.system.dao.IDictionaryDao;
import com.huayun.ssh.system.model.Dictionary;

@Component("dictionaryDao")
public class DictionaryDao extends BaseDao<Dictionary, String> implements IDictionaryDao{

}
