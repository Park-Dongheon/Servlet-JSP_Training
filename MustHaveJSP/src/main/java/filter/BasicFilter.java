package filter;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BasicFilter implements Filter {
	FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		String filterName = filterConfig.getFilterName();
		
		System.out.println("BasicFilter -> init() 호출됨 : " + filterName);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
		System.out.println("BasicFilter -> 초기화 매개변수 : " + filterInitParam);
		
//		HttpServletRequest req = (HttpServletRequest)request;
		
		
//		String method = request.getMehod(); 에러<input type="button" value="Get 방식 전송" onclick="formSubmit(this.form, 1);" /> 발생(형변환 후 호출할 수 있음)
		String method = ((HttpServletRequest)request).getMethod();
		
//		String method = req.getMethod();
//		
//		if (method.equalsIgnoreCase("POST"))) {
//			HttpServletResponse resp = (HttpServletResponse)response;
//			resp.setContentType("text/html; cjarset=utf-8")
//			PrintWriter out = resp.getWriter(); 
//			out.println("<h1>Post is not allowed</h1>")
//			out.close();
//			return;
//		}
		
		System.out.println("BasicFilter -> 전송 방식 : " + method);
		
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("BasicFilter -> destroy() 호출됨");
	}



}
