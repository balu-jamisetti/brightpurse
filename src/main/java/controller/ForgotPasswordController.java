 package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.UserDao;

@WebServlet("/ResetPasswordServlet")
public class ForgotPasswordController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection c=AccountDao.createConnection();
			UserDao u=new UserDao();
			PreparedStatement p=c.prepareStatement("select * from USERS where email=?");
			p.setString(1, req.getParameter("email"));
			ResultSet r=p.executeQuery();
			if(r.next())
			{
				
						PreparedStatement p1=c.prepareStatement("update  USERS set password=? where(email=?)");
						p1.setString(1, req.getParameter("newPassword"));
						p1.setString(2, req.getParameter("email"));
						p1.execute();
						RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
						dispatcher.forward(req, resp);		
			}
			else {
					req.setAttribute("Wrongemail", "email is Wrong");
					RequestDispatcher dispatcher=req.getRequestDispatcher("forgot.jsp");
					dispatcher.include(req, resp);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
