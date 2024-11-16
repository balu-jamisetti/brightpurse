package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import dao.UserDao;
import dto.AccountDto;
import dto.UserDto;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserDao udao = new UserDao();
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            // Connect to database
            Connection c=AccountDao.createConnection();
           
            
            // Check if the email exists
            PreparedStatement ps = c.prepareStatement("select * from USERS where email=?");
            ps.setString(1, email);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                String password1 = set.getString("password");
                
                // Validate password
                if (password1.equals(password)) {
                    // Successful login, set session attributes
                    HttpSession session = req.getSession();
                    session.setAttribute("userEmail", email);

                    // Fetch user details and set UserDto object
                    PreparedStatement ps1 = c.prepareStatement("select * from USERS where email=?");
                    ps1.setString(1, email);
                    ResultSet rset = ps1.executeQuery();

                    if (rset.next()) {
                        UserDto u = new UserDto(
                                rset.getString("FirstName"), 
                                rset.getString("LastName"), 
                                rset.getString("Gender"), 
                                rset.getString("Email"), 
                                rset.getLong("phno"), 
                                rset.getString("Address"), 
                                rset.getString("password")
                        );
                        session.setAttribute("User_Object", u);
                    }

                    // Retrieve and set AccountDto object if account exists
                    AccountDao.create_Account_table();
                    PreparedStatement ps2 = c.prepareStatement("select * from Accounts where ph_no=?");
                    ps2.setLong(1, rset.getLong("phno"));
                    ResultSet r = ps2.executeQuery();
                    if (r.next()) {
                        AccountDto a = new AccountDto(r.getString(1), r.getLong(2), r.getLong(3), r.getString(4), r.getString(5), r.getInt(6), r.getLong(7), r.getInt(8), r.getString(9), r.getString(10));
                        session.setAttribute("Account", a);
                    } else {
                        session.setAttribute("Account", new AccountDto());
                    }

                    // Redirect to home page
                    RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    // Password invalid
                    req.setAttribute("msg2", "Password is invalid");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                // Email invalid
                req.setAttribute("msg1", "Email is invalid");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
