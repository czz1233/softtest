package com.huayun.ssh.softtest.dao.impl;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.softtest.dao.ISoftWareDao;
import com.huayun.ssh.softtest.model.SoftWare;

@Component("softwareDao")
public class SoftWareDao extends BaseDao<SoftWare, String> implements ISoftWareDao{

}
