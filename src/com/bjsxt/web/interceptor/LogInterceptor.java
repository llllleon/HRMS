package com.bjsxt.web.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bjsxt.pojo.Users;

public class LogInterceptor implements HandlerInterceptor {

	private Logger logger=Logger.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取uri，得到客户端的请求信息
		String uri = request.getRequestURI();
		// 获取session对象中的存储用户信息的对象通过判断是否为空，进行放行和过滤
		Object user = request.getSession().getAttribute("user");
		// 合法请求
		//如果是请求登录页面，转发到登录验证，判断cookie是否存在
		/*if(uri.equals(request.getContextPath()+"/login")){
			request.getRequestDispatcher(request.getContextPath()+"/log/loginPage?ck=ck");
			return false;
		}--------待完善*/
		if(uri.equals(request.getContextPath()+"/login")  || // 登录页面
				uri.equals(request.getContextPath()+"/loginException")  || // 异常页面
				uri.indexOf("/loginException")>0 || // 异常页面
				uri.equals(request.getContextPath()+"/log/logout")  || // 登出请求
				uri.equals(request.getContextPath()+"/log/loginVvalidte")  || // 登录请求
				user != null ){//　如果对象不为空，则证明本次已经登陆成功
			return true;// 放行
		}
		// 非法请求，强制转到登陆页面
		response.sendRedirect(request.getContextPath()+"/loginException");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 日志记录
		Users user = (Users)request.getSession().getAttribute("user");
		logger.info("IP地址:"+request.getRemoteAddr()+"\t\t-登录用户名:"+user.getUname()+"\n");
		logger.info("-资源名称:"+request.getRequestURI()+"\n");
	}

}
