package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class CommonFilter
 */
@WebFilter("/*")
public class CommonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CommonFilter() {
//    	System.out.println("CommonFilter 실행"); //확인
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
//		1. get, post 양쪽에서 모두 사용
//		request.setCharacterEncoding("UTF-8");  //여기에 한 번만 쓰면 request를 받는 서블릿을 더 이상 따로 엔코딩 안 해줘도 됨
		
//		2. post 방식일 때만 진행하게 하고 싶은 경우 //get방식으로 encoding하는 경우에 문제가 생기지는 않음
		HttpServletRequest req = (HttpServletRequest)request; 
		// HttpRequest인 request를 getMethod()를 쓰기 위해 HttpServletRequest로 다운캐스팅
		if(req.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}
		
		
		
		// pass the request along the filter chain (filter chain을 통해 request가 전달 됨)
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
