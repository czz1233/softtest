package com.huayun.ssh.common.hibernate;

import org.hibernate.annotations.common.util.StringHelper;
import org.hibernate.cfg.ImprovedNamingStrategy;

public class HibernateImprovedNamingStrategy extends ImprovedNamingStrategy{

	private static final long serialVersionUID = -8724603731382570435L;
	@Override
	public String classToTableName(String className) {
		return addUnderscores( StringHelper.unqualify(className) ).toUpperCase();
	}
	@Override
	public String propertyToColumnName(String propertyName) {
		return addUnderscores( StringHelper.unqualify(propertyName) ).toUpperCase();
	}
	
	@Override
	public String tableName(String tableName) {
		return addUnderscores(tableName).toUpperCase();
	}
	@Override
	public String columnName(String columnName) {
		return addUnderscores(columnName).toUpperCase();
	}

}
