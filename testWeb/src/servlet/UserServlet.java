package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;

public class UserServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("name");
		//username = new String(username.getBytes("ISO-8859-1"),"utf-8");
		String password = request.getParameter("password");
		int time=Integer.parseInt(request.getParameter("time"));
		User searchUser = new User();
		searchUser.setUsername(username);
		searchUser.setPassword(password);
		UserDao ud = new UserDao();
		User user = ud.searchByUsernameAndPassword(searchUser);
		if (user != null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			
			Cookie cookie=new Cookie("userName", user.getUsername());
			
			if(time==1){
				cookie.setMaxAge(-1);
			}else if(time==2){
				cookie.setMaxAge(30);
			}else if(time==3){
				cookie.setMaxAge(60);
			}
			
			
			
			response.addCookie(cookie);
			
			
			//out.print("登录成功！");
			//response.sendRedirect("success.jsp");//重定向
			
				request.getRequestDispatcher("success.jsp").forward(request,
						response);
			
		} else {
			//out.print("登录失败！");
			//response.sendRedirect("fail.jsp");
			
				request.getRequestDispatcher("fail.jsp").forward(request,
						response);
		}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
public void doPost(HttpServletRequest request,HttpServletResponse response){
		doGet(request, response);
	}


}
