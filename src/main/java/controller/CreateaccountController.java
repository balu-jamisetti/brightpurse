
package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import dto.AccountDto;
import dto.UserDto;



@WebServlet("/AccountCreationServlet")
public class CreateaccountController extends HttpServlet {
    private Map<String, String> bankCodes;
    @Override
    public void init() throws ServletException {
        bankCodes = new HashMap<>();
        bankCodes.put("HITECH City", "HIT12676268");
        bankCodes.put("KPHB", "KPH12676268");
        bankCodes.put("LB Nagar", "LBN12676268");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Check if User_Object is available in session
//        HttpSession session = req.getSession(false); // Prevents creation of a new session if not already present
//        User user = (User) session.getAttribute("User_Object");
//
//        if (user == null) {
//            // Redirect to login if session is not found
//            resp.sendRedirect("home.jsp");
//            return;
//        }

        Random random = new Random();
        long accountNumber = 1000000000L + (Math.abs(random.nextLong()) % 9000000000L);
        String branchName = req.getParameter("branch");
        String ifscCode = bankCodes.getOrDefault(branchName, "XXXX00000000");

        try {
        	HttpSession session = req.getSession(); // Prevents creation of a new session if not already present
        	UserDto user = (UserDto) session.getAttribute("User_Object");
            AccountDto ba = new AccountDto(
                user.getFname()+ " " + user.getLname(), user.getPhno(), accountNumber, ifscCode,req.getParameter("type"),
                Integer.parseInt(req.getParameter("pin")), Long.parseLong(req.getParameter("aadhar")),
                Integer.parseInt(req.getParameter("balance")), req.getParameter("nominee_name"),
                req.getParameter("relation_with_nominee")
            );
            AccountDao.createAccount(ba);
            session.setAttribute("Account", ba);

            // Forward to home.jsp after successful account creation
            RequestDispatcher rd = req.getRequestDispatcher("CreateAccount.jsp");
            rd.include(req, resp);
        } catch (Exception e) {
        	req.setAttribute("Account_Exists", "Account  Already Exists");
	        RequestDispatcher dispatcher1 = req.getRequestDispatcher("CreateAccount.jsp");
	        dispatcher1.include(req, resp);
        }
    }
}