package com.huayun.ssh.common.util;

public class AppExceptionUtil {
	/**
			 * <p>
			 *	@param logger log4j工具
			 *	@param msg 抛出的异常信息
			 * <li>方法描述:抛出appexecption，并且记录日志</li>
			 * <li>方法名称:throwException</li>
			 * <li>创建时间:2015-2-11 上午10:21:17</li>
			 * </p>
	 */
	public static void throwException(final LogUtil logger,final Exception e,final String msg){
		if(e != null && e instanceof AppException){
			e.printStackTrace();
			logger.error(e);
			throw new AppException(e.getMessage());
		}else{
			throw new AppException(msg);
		}
	
	}
		/**
		 * <p>
		 *	@param logger log4j工具
		 * <li>方法描述:抛出appexecption，并且记录日志</li>
		 * <li>方法名称:throwException</li>
		 * <li>创建时间:2015-2-11 上午10:21:17</li>
		 * </p>
	*/
	public static void throwException(final LogUtil logger,final Exception e){
		throwException(logger, e, "操作失败，稍后请重试，或者联系管理员");
	}
}
