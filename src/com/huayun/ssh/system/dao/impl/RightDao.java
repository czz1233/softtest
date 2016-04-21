package com.huayun.ssh.system.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.huayun.ssh.common.dao.impl.BaseDao;
import com.huayun.ssh.system.dao.IRightDao;
import com.huayun.ssh.system.model.Right;

@Component("rightDao")
@SuppressWarnings("all")
public class RightDao extends BaseDao<Right, String> implements IRightDao{

	@Override
	public List<String> getRightCodeByAccountId(String accountId) {
		String hql = "SELECT DISTINCT r.code FROM Right r LEFT JOIN r.rightRoleList rr LEFT JOIN rr.role rol LEFT JOIN rol.roleAccountList ral LEFT JOIN ral.account ac LEFT JOIN r.ringhtAccountList ra LEFT JOIN ra.account ac2 WHERE ac.id='" + accountId +"' OR ac2.id='" + accountId +"' AND r.status=1";
		List<String> valueList = (List<String>) queryHQL(hql);
		return valueList;
	}

	@Override
	public List<Right> getRightByAccountId(String accountId) {
		String hql = "SELECT DISTINCT NEW com.huayun.ssh.system.model.Right(r.id,r.parentId,r.name,r.code,r.type,r.url,r.icon,r.iconCls,r.imgUrl,r.sortBy,r.describle,r.status,r.createTime,r.creator) FROM Right r LEFT JOIN r.rightRoleList rr LEFT JOIN rr.role rol LEFT JOIN rol.roleAccountList ral LEFT JOIN ral.account ac LEFT JOIN r.ringhtAccountList ra LEFT JOIN ra.account ac2 WHERE ac.id='" + accountId +"' OR ac2.id='" + accountId +"'  AND r.status=1 ORDER BY r.sortBy ASC";
		List<Right> valueList = (List<Right>) queryHQL(hql);
		return valueList;
	}

	@Override
	public List<Right> getRightByIds(String[] rightsId) {
		List<Right> valueList = null;
		String hql = "SELECT DISTINCT NEW com.huayun.ssh.system.model.Right(r.id,r.parentId,r.name,r.code,r.type,r.url,r.icon,r.iconCls,r.imgUrl,r.sortBy,r.describle,r.status,r.createTime,r.creator) FROM Right r ";
		hql = hql + "WHERE 1=1 AND(";
		if(null != rightsId && 0 < rightsId.length){
			for (int i = 0; i < rightsId.length; i++) {
				if(i == 0){
					hql = hql + " r.id='" + rightsId[i] + "'";
				}else{
					hql = hql + " OR r.id='" + rightsId[i] + "'";
				}
			}
		}
		hql = hql + " )";
		valueList = (List<Right>) queryHQL(hql); 
		return valueList == null ? new ArrayList<Right>():valueList;
	};

}
