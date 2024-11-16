package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
@WebServlet("/Balance")
public class balanceController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession hs=req.getSession();
		UserDto  udto1=(UserDto)hs.getAttribute("User_Object");
		AccountDto ad=(AccountDto)hs.getAttribute("Account");
	
		PreparedStatement ps;
		try {
			
			
			ps = AccountDao.createConnection().prepareStatement("select * from Accounts where pin=? and ph_no=?");
			int pin=Integer.parseInt(req.getParameter("pin"));
			ps.setInt(1, pin);
			ps.setLong(2, ad.getPh_No());
			ResultSet r = ps.executeQuery();
			
			int balance_Amount = 0;
			if(r.next()) {
			 balance_Amount=r.getInt("balance");
			 req.setAttribute("Balance", balance_Amount);
			 RequestDispatcher rd=req.getRequestDispatcher("balance.jsp");
			 rd.forward(req, resp);
			}
			else {
				req.setAttribute("Invalid_Pin", "pin is invalid");
                RequestDispatcher dispatcher = req.getRequestDispatcher("balance.jsp");
                dispatcher.include(req, resp);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
