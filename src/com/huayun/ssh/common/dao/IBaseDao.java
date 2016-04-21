package com.huayun.ssh.common.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public interface IBaseDao<T, ID extends Serializable> {
    /**
     * 保存实体
     * 
     * @param entity 实体
     * @return 保存后的实体
     */
    public T save( T entity );
    
    /**
     * 更新实体
     * 
     * @param entity 实体
     * @return 实体
     */
    public T update( T entity );
    
    /**
     * 根据实体组键id获取实体
     * 
     * @param entity 实体
     * @param id 实体id
     * @return 实体
     */
    public T getById( Class<T> entity, ID id );
    
    /**
     * 根据实体id删除实体
     * 
     * @param entity 实体
     * @param id 实体id
     */
    public void deleteById( Class<T> entity, ID id );
    
    /**
     * 根据实体删除
     * 
     * @param entity 实体
     */
    public void delete( T entity );
    
    /**
     * 获取实体总记录数
     * 
     * @param entityClass 实体类型
     * @return 总记录数
     */
    public int getTotalCount( Class<T> entityClass );
    
    /**
     * 根据hql获取实体记录数
     * 
     * @param hql
     * @return 满足hql的实体记录数
     */
    public int getTotalCount( String hql );
    
    /**
     * 根据sql获取实体集合
     * 
     * @param sql
     * @return 满足sql的实体集合
     */
    public List<?> querySQL( String sql );
    
    /**
     * 根据hql获取实体集合
     * 
     * @param hql
     * @return 满足sql的实体集合
     */
    public List<?> queryHQL( String hql );
    
    /**
     * 获取某个实体的所有结果集合
     * 
     * @param entityClass
     * @return 该实体所有记录集合数
     */
    public List<T> getAll( Class<T> entityClass );
    
    /**
     * 根据hql获取分页信息
     * 
     * @param hql
     * @param start 开始记录
     * @param limit 记录总数
     * @return
     */
    public List<?> getByPage( String hql, int start, int limit );
    
    /**
     * 获取防止sql注入条件分页实体信息集合
     * 
     * @param hql
     * @param value
     * @param start
     * @param limit
     * @return 实体信息集合
     */
    public List<T> getByPage( String hql, String value, int start, int limit );
    
    /**
     * 获取防止sql注入条件分页实体信息集合
     * 
     * @param hql
     * @param values
     * @param start
     * @param limit
     * @return 实体信息集合
     */
    public List<?> getByPage( String hql, Object[] values, int start, int limit );
    
    /**
     * 返回hibernate session
     * @return Session
     */
   public Session getSession();

}
