package com.huayun.ssh.common.entity;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * <p>
 * <li>文件名称:com.dhcc.idc.common.mapper.BaseEntity.java</li>
 * <li>文件描述:所有vo,entity,model等实体类的基类，原则上一切实体类均需要继承此类</li>
 * <li>版权所有:</li>
 * <li>公司:东华软件</li>
 * <font color=green>
 * <li>内容摘要1:覆盖了Object的toString,hashCode,equals等方法</li>
 * </font>
 * <li>其他说明:</li>
 * <li>完成日期:2014-7-8</li>
 * <li>修改记录1: </li>
 * @author 王建军
 * </p>	
 */
public class BaseEntity implements Cloneable, Serializable {

	private static final long serialVersionUID = -8271897875447773103L;
	
	/*
	 * 构造函数
	 */
	public BaseEntity() {

	}

	/**
	 * copy属性
	 * @param in
	 */
	public BaseEntity(final Object in) {
		try {
			BeanUtils.copyProperties(in, this);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Object copyInstance(final Class<?> descClass) {
		Object o = null;
		try {
			o = descClass.newInstance();
			BeanUtils.copyProperties(this, o);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
		return o;
	}

	/**
	 * 自动列出本BEAN的所有属性
	 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	/**
	 * 覆盖Object的HashCode方法
	 */
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

	/**
	 * 覆盖Object的equals方法
	 */
	@Override
	public boolean equals(final Object o) {
		return EqualsBuilder.reflectionEquals(this, o);
	}

	/**
	 * 该类的覆盖方法
	 */
	@Override
	public Object clone() throws CloneNotSupportedException {
		try {
			return BeanUtils.cloneBean(this);
		} catch (final Exception e) {
			return super.clone();
		}
	}
	
	
	

}
