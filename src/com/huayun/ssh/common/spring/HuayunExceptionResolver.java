package com.huayun.ssh.common.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.alibaba.fastjson.JSONObject;
import com.huayun.ssh.common.util.AppException;
import com.huayun.ssh.common.util.LogUtil;
import com.huayun.ssh.common.util.ResponseUtils;


public class HuayunExceptionResolver extends SimpleMappingExceptionResolver {
	
	private static final LogUtil logger = LogUtil.getInstances("root-all", HuayunExceptionResolver.class);
	
	@Override
	protected ModelAndView doResolveException(final HttpServletRequest request,
			final HttpServletResponse response, final Object handler, final Exception ex) {
		ex.printStackTrace();
		 // Expose ModelAndView for chosen error view.  
        String viewName = determineViewName(ex, request);  
      //  User loginUser = (User) request.getSession().getAttribute(SystemContext.LOGIN_USER_POWER_BOUND_SESSION_NAME);
        String loginIP = "";
		if(request.getHeader("x-forwarded-for") == null){
			loginIP = request.getRemoteAddr();
		}else{
			loginIP = request.getHeader("x-forwarded-for");
		}
		String message = "";
      //  = "登录的用户：[" + loginUser.getUserName() + "]";
       message = message + "访问的链接：[" + request.getRequestURL() + "]";
       message = message + "访问客户端IP：[" + loginIP + "]";
       message = message + "错误信息：" + ex.getMessage();
        if (viewName != null) {
        	logger.error(ex.getMessage(),ex);
        	// JSP格式返回  
            if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request  
                    .getHeader("X-Requested-With")!= null && request  
                    .getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {  
                // 如果不是异步请求  
                // Apply HTTP status code for error views, if specified.  
                // Only apply it if we're processing a top-level request.  
                Integer statusCode = determineStatusCode(request, viewName);  
                if (statusCode != null) {  
                    applyStatusCodeIfPossible(request, response, statusCode);  
                }  
                return getModelAndView(viewName, ex, request);  
            } else {// JSON格式返回  
                response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
            	JSONObject json = new JSONObject();
            	//json.put("msg","系统发生错误，稍后请重试，或者联系管理员");
            	//System.out.println(ex instanceof AppException);
            	if(ex instanceof AppException){
            		json.put("msg",ex.getMessage());
            	}else{
            		json.put("msg","系统发生错误，稍后请重试，或者联系管理员");
            	}
            	ResponseUtils.responseJson(response,json.toJSONString());
                return null;  
  
            }  
        } else {  
            return null;  
        }  
	}

}
