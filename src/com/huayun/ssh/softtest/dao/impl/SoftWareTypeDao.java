package com.huayun.ssh.softtest.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.softtest.dao.ISoftWareTypeDao;
import com.huayun.ssh.softtest.model.SoftWareType;

@Component("softwaretypeDao")
public class SoftWareTypeDao extends BaseDao<SoftWareType, String> implements ISoftWareTypeDao{

}
