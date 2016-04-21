package com.huayun.ssh.common.util;


import java.util.Collection;

/**
 *断言工具
 */
public class Assert {
	/**
	 * 构造方法
	 */
	public Assert() {

	}
	/**
	 * <p>
	 * @param condition 断言条件
	 * @param message 不成立时提示信息
	 * <li>方法描述:断言条件为真></li>
	 * <li>方法名称:isTrue</li>
	 * <li>创建时间:2014-7-28上午11:20:14</li>
	 * </p>
	 */
	public static void isTrue(final boolean condition,final String message){
		if(!condition){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param condition 断言条件
	 * @param message 不满足条件的异常信息
	 * <li>方法描述:断言条件为假</li>
	 * <li>方法名称:isFalse</li>
	 * <li>创建时间:2014-7-28上午11:23:44</li>
	 * </p>
	 */
	public static void isFalse(final boolean condition,final String message){
		isTrue(!condition,message);
	}
	/**
	 * 
	 * <p>
	 * @param value 断言的字符串
	 * @param message 当字符串为empty时的提示信息
	 * <li>方法描述:断言一个字符串不能为空，包括null和空串</li>
	 * <li>方法名称:isNotEmpty</li>
	 * <li>创建时间:2014-7-28上午11:25:49</li>
	 * </p>
	 */
	public static void isNotEmpty(final String value,final String message){
		if(null == value || "".equals(value)){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param value 断言字符串
	 * @param message 当字符不为空时的提示信息
	 * <li>方法描述:</li>
	 * <li>方法名称:isEmpty</li>
	 * <li>创建时间:2014-7-28上午11:27:50</li>
	 * </p>
	 */
	public static void isEmpty(final String value,final String message){
		if(null != value && !"".equals(value)){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param value 
	 * @param message
	 * <li>方法描述:</li>
	 * <li>方法名称:isNotNull</li>
	 * <li>创建时间:2014-7-28上午11:29:43</li>
	 * </p>
	 */
	public static void isNotNull(final Object value,final String message){
		if(null == value){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param value
	 * @param message
	 * <li>方法描述:</li>
	 * <li>方法名称:isNull</li>
	 * <li>创建时间:2014-7-28上午11:30:41</li>
	 * </p>
	 */
	public static void isNull(final Object value,final String message){
		if(null != value){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param value
	 * @param message
	 * <li>方法描述:</li>
	 * <li>方法名称:isNotNull</li>
	 * <li>创建时间:2014-7-28上午11:32:19</li>
	 * </p>
	 */
	public static void isNotNull(final Collection<?> value,final String message){
		if(null == value || 0 == value.size() ){
			throw new AppException(message);
		}
	}
	/**
	 * 
	 * <p>
	 * @param value
	 * @param message
	 * <li>方法描述:</li>
	 * <li>方法名称:isNull</li>
	 * <li>创建时间:2014-7-28上午11:32:16</li>
	 * </p>
	 */
	public static void isNull(final Collection<?> value,final String message){
		if(null != value && 0 < value.size() ){
			throw new AppException(message);
		}
	}

}
