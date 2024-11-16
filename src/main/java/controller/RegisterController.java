package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;
@WebServlet("/register")
public class RegisterController extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDao userdao=new UserDao();
	UserDto  user=new UserDto(req.getParameter("firstName"), req.getParameter("lastName"),req.getParameter("gender"), req.getParameter("email"),Long.parseLong(req.getParameter("phone")), req.getParameter("address"), req.getParameter("password"));
	resp.setContentType("text/html");
	try {
		userdao.insert(user);
		System.out.println("Data Registered Successfully");
		RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
		dispatcher.forward(req, resp);
	} catch (Exception e) {
		int c=UserDao.check_Email_Password(req.getParameter("email"),Long.parseLong(req.getParameter("phone")));
		if(c==0)
		req.setAttribute("DuplicateEmail", "email exists");
		else if(c==1)
		req.setAttribute("DuplicatePhone", "phone number exists");
        RequestDispatcher dispatcher1 = req.getRequestDispatcher("registration.jsp");
        dispatcher1.include(req, resp);
        
	}
}
}
