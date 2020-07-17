package com.anneagram.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class Language implements Filter {

   
    public Language() {
    }

	
	public void destroy() {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		System.out.println("한글처리 필터 실행");
		response.setContentType("text/html; charset=UTF-8");
		chain.doFilter(request, response);
		//response.setContentType("text/html; charset=UTF-8");
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
