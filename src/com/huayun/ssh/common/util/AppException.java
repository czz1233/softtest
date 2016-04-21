package com.huayun.ssh.common.util;

/**
 * <p>
 * <li>文件名称:AppException.java</li>
 * <li>文件描述: </li>
 * <li>版权所有:</li>
 * <li>公司: 东华软件(www.dhcc.com.cn)</li>
 * <font color=green>
 * <li>内容摘要1:自定义业务异常</li>
 * </font>
 * <li>其他说明:</li>
 * <li>完成日期:2014-7-28</li>
 * <li>修改记录1:</li>
 * @author 王建军
 * </p>	
 */
public class AppException extends RuntimeException{

	private static final long serialVersionUID = 2945339319853086255L;
	private static LogUtil LOGGER = LogUtil.getInstances(AppException.class);

	public AppException() {
		super();
		//系统错误
		LOGGER.error("\u7CFB\u7EDF\u5F02\u5E38");
	}

	public AppException(final String message, final Throwable cause) {
		super(message, cause);
		LOGGER.error(message + ":" + cause.getMessage());
	}

	public AppException(final String message) {
		super(message);
		LOGGER.error(message);
	}

	public AppException(final Throwable cause) {
		super(cause);
		LOGGER.error(cause.getMessage());
	}
	
	

}
