package com.bjsxt.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.buf.UEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bjsxt.mapper.InfoMapper;
import com.bjsxt.mapper.LogMapper;
import com.bjsxt.pojo.Login;
import com.bjsxt.pojo.Users;
import com.bjsxt.service.LogService;
import com.bjsxt.util.PageUtil;
import com.bjsxt.vo.MsgVo;
@Service
public class LogServiceImpl implements LogService {
	@Autowired
	private LogMapper logMapper;
	@Autowired
	private InfoMapper infoMapper;
	/**
	 * 导航栏个数
	 */
	@Value("${page.navCount}")
	private Integer navCount;

	/**
	 * 每页展示数据
	 */
	@Value("${page.pageMaxCount}")
	private Integer pageMaxCount;

	/**
	 * 数据总行数
	 */
	private Integer dataCount;

	/**
	 * 验证登陆，添加登录信息，产生cookie
	 */
	@Override
	public MsgVo login(Users users,HttpServletRequest request,HttpServletResponse response) {
		MsgVo msgVo=new MsgVo("0", "");
		Users user = logMapper.selectUsersForLog(users);
		if(null != user){
			if(null != user.getUname() && !"".equals(user.getUname())){
				// session中绑定用户信息
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				try {
					// 设置cookie
					Cookie cookie1=new Cookie("uname", URLEncoder.encode(user.getUname(), "utf-8"));
					Cookie cookie2=new Cookie("pwd", URLEncoder.encode(user.getPwd(), "utf-8"));
					// 有效期10天
					cookie1.setMaxAge(60*60*24*10);
					cookie2.setMaxAge(60*60*24*10);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
//设置照片-----------------------				
				
				String photo=infoMapper.selectPhotoByInfoname(user.getRealname());
			if (photo != null && !"".equals(photo)) {
				File  file = new File(photo);//本地拿取文件 d/upload/rphoto/
				ServletContext sc = request.getServletContext();
				String originalFilename=null;
				try {
					FileInputStream input = new FileInputStream(file);
					MultipartFile multipartFile = new MockMultipartFile("file", file.getName(), "text/plain", IOUtils.toByteArray(input));
					originalFilename = multipartFile.getOriginalFilename();
					String pathPhoto = sc.getRealPath("/img/"+originalFilename);//新的路径/img/
					File  filePathNew = new File(pathPhoto);
					multipartFile.transferTo(filePathNew);
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 登录成功
				msgVo=new MsgVo("1", originalFilename);
			} else {
				msgVo=new MsgVo("1", "");
			}
//-----------------------

				// 添加数据库，登录信息
				Date date=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String format = sdf.format(date);
				Login login=new Login(format, request.getRemoteAddr(),user.getUname());
				logMapper.insertLoginInfo(login);
			}
			
		}
		return msgVo;
	}
	/**
	 * 退出登录
	 */
	@Override
	public void logout(HttpServletRequest request) {
		// 对象解绑
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("menuMap");
		// session失效
		request.getSession().invalidate();
	}
	/**
	 * 上次登陆日志显示
	 */
	@Override
	public Login findLogInfo() {
		return logMapper.selectLogInfo();
	}
	/**
	 * 登陆日志查询
	 */
	@Override
	public Integer findLogList() {
		return logMapper.selectLogList();
	}
	/**
	 * 登陆日志查询，分页
	 */
	@Override
	public PageUtil findLogListByPage(String currPage) {
		// 查询数据总数--避免每次查询
		if(dataCount == null){
			dataCount  = logMapper.selectLogList();
		}
		// 创建分页工具的实现
		PageUtil pageUtil=new PageUtil(dataCount, pageMaxCount, Integer.valueOf(currPage), navCount);
		int startrow = pageUtil.getStartrow();
		// 查询数据
		List<Map<String,Object>> listByPage = logMapper.selectLogListByPage(startrow, pageMaxCount);
		// 封装分页对象
		pageUtil.setPageData(listByPage);
		return pageUtil;
	}

	/**
	 * 模糊查询+分页查询
	 */
	@Override
	public PageUtil findLogByConditionWithPage(String logname, String beginTime, String endTime,String currPage) {
		// 模糊查询数据总数
		dataCount = logMapper.selectLogByCondition(logname, beginTime, endTime);
		// 创建分页工具的实现
		PageUtil pageUtil=new PageUtil(dataCount, pageMaxCount, Integer.valueOf(currPage), navCount);
		int startrow = pageUtil.getStartrow();
		// 查询数据
		List<Map<String,Object>> listByPage = logMapper.selectLogByConditionWithPage(logname, beginTime, endTime, startrow, pageMaxCount);
		// 封装分页对象
		pageUtil.setPageData(listByPage);
		return pageUtil;
	}
	/**
	 * 菜单权限查询
	 */
	@Override
	public List<Map<String,Object>> findUserRoleMenu(Users users) {
		return logMapper.selectUserRoleMenu(users);
	}
	/**
	 * 用户cookie处理----待完善
	 */
	@Override
	public void loginCookie(HttpServletRequest request, HttpServletResponse response) {
		// TODO
		Users user=new Users();
		Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies){
			System.out.println(c.getName()+"---"+c.getValue());
			if("name".equals(c.getName())){
				user.setUname(c.getValue());
			}
			if("pwd".equals(c.getName())){
				user.setPwd(c.getValue());
			}
		}
		if(user != null && user.getPwd() != null && user.getUname() != null){
			try {
				request.setAttribute("uname", user.getUname());
				request.setAttribute("pwd", user.getPwd());
				request.getRequestDispatcher(request.getContextPath()+"/login?c=1").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
