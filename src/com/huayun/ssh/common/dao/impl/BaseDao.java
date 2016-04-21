package com.huayun.ssh.common.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.huayun.ssh.common.dao.IBaseDao;


@SuppressWarnings("all")
public class BaseDao<T, ID extends Serializable> implements IBaseDao<T, ID> {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public T save(T entity) {
		this.getSession().save(entity);
		return entity;
	}

	@Override
	public T update(T entity) {
		this.getSession().saveOrUpdate(entity);
		return entity;
	}

	@Override
	public T getById(Class<T> entity, ID id) {
		return (T) this.getSession().get(entity, id);
	}

	@Override
	public void deleteById(Class<T> entity, ID id) {
		T t = getById(entity, id);
		this.getSession().delete(t);

	}

	@Override
	public void delete(T entity) {
		this.getSession().delete(entity);
	}

	@Override
	public int getTotalCount(Class<T> entityClass) {
		int totalCount = 0;
		String hql = "select count(*) from " + entityClass.getName();
		totalCount = ((Long) this.sessionFactory.getCurrentSession().createQuery(hql).uniqueResult()).intValue();
		// totalCount = ((Long)
		// this.sessionFactory.getCurrentSession().createQuery(HQL).iterate().next()).intValue();
		return totalCount;
	}

	@Override
	public int getTotalCount(String hql) {
		int totalCount = 0;
		totalCount = ((Long) this.sessionFactory.getCurrentSession().createQuery(hql).uniqueResult()).intValue();
		// totalCount = ((Long)
		// this.sessionFactory.getCurrentSession().createQuery(hql).iterate().next()).intValue();
		return totalCount;
	}

	@Override
	public List<?> querySQL(String sql) {
		List<?> list = null;
		List<?> queryList = this.getSession().createSQLQuery(sql).list();
		if (queryList != null && queryList.size() != 0) {
			list = queryList;
		}
		return list;
	}

	@Override
	public List<?> queryHQL(String hql) {
		List<?> list = (List<?>) this.getSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<T> getAll(Class<T> entityClass) {
		return (List<T>) this.getSession().createQuery(" from " + entityClass.getName()).list();
	}

	@Override
	public List<?> getByPage(String hql, int start, int limit) {
		return this.getSession().createQuery(hql).setFirstResult(start).setMaxResults(limit).list();
	}

	@Override
	public List<T> getByPage(String hql, String value, int start, int limit) {
		return this.getSession().createQuery(hql).setParameter(0, value).setFirstResult(start).setMaxResults(limit).list();
	}

	@Override
	public List<?> getByPage(String hql, Object[] values, int start, int limit) {
		List<?> list = null;
		Query query = this.getSession().createQuery(hql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		List<?> result = query.setFirstResult(start).setMaxResults(limit).list();
		if (result != null && result.size() != 0) {
			list = result;
		}
		return list;
	}

	public void Flush() {
		this.getSession().flush();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
