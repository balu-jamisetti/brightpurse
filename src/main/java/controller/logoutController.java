package controller;

import java.io.IOException;
import java.lang.System.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logoutController  extends HttpServlet{
	

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Invalidate the session to log out the user
        HttpSession session = req.getSession(false);
        if (session != null) {

            session.invalidate();  // Ends the session
        }

        // Redirect to login page after logout
        resp.sendRedirect("login.jsp"); // Change to "login.jsp" if that's the correct login page
    }

   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doPost(req, resp);
}
	}


