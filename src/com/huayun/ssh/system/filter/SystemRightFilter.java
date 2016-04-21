package com.huayun.ssh.system.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.huayun.ssh.system.model.Account;


/**
 *权限拦截器
 */
@Component("systemRightFilter")
public class SystemRightFilter implements Filter{
	
	private String sessiontimeoutURL;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain china) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		
		String requestURL = request.getRequestURI();
		System.out.println("requestURL:" + requestURL);
		
		if(requestURL.indexOf("login") != -1 || requestURL.indexOf(sessiontimeoutURL) != -1|| requestURL.equals("/ssh/")) {
			china.doFilter(request, response);
			return;
		}
		
		Account account = (Account) session.getAttribute("LOGINER");
		//session过期
		if(null == account){			
			request.getRequestDispatcher(sessiontimeoutURL).forward(request, response);
			System.out.println("============================filter");
			return;
		}
		china.doFilter(request, response);
		return;
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.sessiontimeoutURL = filterConfig.getInitParameter("sessiontimeoutURL");
		if (sessiontimeoutURL.charAt(0) != '/') {
			this.sessiontimeoutURL = "/" + this.sessiontimeoutURL;
		}
		
	}

}
