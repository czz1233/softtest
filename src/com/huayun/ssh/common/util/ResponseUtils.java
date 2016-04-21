package com.huayun.ssh.common.util;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sun.jersey.api.client.ClientResponse;

public class ResponseUtils {
	

	private static LogUtil logger = LogUtil.getInstances(ResponseUtils.class);
	
	/**
	 * 
	* @Title: responseJson
	* @Description: JSON 格式 响应
	* @param @param response
	* @param @param res    响应字符串
	* @return void    返回类型
	* @throws
	 */
	public static void responseJson(final HttpServletResponse response,final String res) {
		try {
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(res);
			out.flush();
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}
	
	/**
	 * 
	* @Title: responseScript
	* @Description: JSON 格式 响应
	* @param @param response
	* @param @param res    响应字符串
	* @return void    返回类型
	* @throws
	 */
	public static void responseScript(final HttpServletResponse response,final String res) {
		try {
			response.setContentType("text/javascript;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(res);
			out.flush();
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}
	
	/**
	 * 
	* @Title: responseHtml
	* @Description: text/html 格式 响应
	* @param @param response
	* @param @param res    响应字符串
	* @return void    返回类型
	* @throws
	 */
	public static void responseHtml(final HttpServletResponse response,final String res) {
		try {
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(res);
			out.flush();
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}

	public static ResponseEntity<ObjectNode> getServerErrorResponse(final Throwable e){
		ObjectNode error = JsonUtil.getObjectNode();
		error.put("code", 500);
		error.put("message", "系统错误[" + e.getMessage() + "]");
		return new ResponseEntity<ObjectNode>(error,HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	public static ResponseEntity<ObjectNode> getServerErrorResponse(final String errorMsg){
		ObjectNode error = JsonUtil.getObjectNode();
		error.put("ok", false);
		error.put("code", 500);
		error.put("message", "系统错误[" + errorMsg + "]");
		return new ResponseEntity<ObjectNode>(error,HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	public static ObjectNode getErrorResponse(final ClientResponse cr){
		if (null == cr) {
			JsonUtil.getErrorObjectNode("API 返回无结果");
		}
		return JsonUtil.getErrorObjectNode(cr.getEntity(String.class));
	}
	
	public static ResponseEntity<ObjectNode> getResponse(final ClientResponse cr) {
		if (null == cr) {
			return getServerErrorResponse(new NullPointerException("API 没有返回结果"));
		}
		String result = cr.getEntity(String.class);
		return new ResponseEntity<ObjectNode>(JsonUtil.getObjectNode(result),HttpStatus.valueOf(cr.getStatus()));
	}


}
