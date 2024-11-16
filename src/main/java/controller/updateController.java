package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

@WebServlet("/UpdateProfileServlet")
public class updateController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessions = req.getSession(); // Prevents creation of a new session if not already present
        UserDto user = (UserDto) sessions.getAttribute("User_Object");
        
        try {
            UserDto u = new UserDto(
                req.getParameter("firstName"),
                req.getParameter("lastName"),
                req.getParameter("gender"),
                user.getEmail(),
                user.getPhno(),
                req.getParameter("address"),
                user.getPassword()
            );
            sessions.setAttribute("User_Object", u);
            
            // Update details and set result as a request attribute
            int n = UserDao.update_Details(u);
            req.setAttribute("updateStatus", n); // Set 'n' as an attribute
            RequestDispatcher r = req.getRequestDispatcher("update.jsp");
            r.include(req, resp);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
