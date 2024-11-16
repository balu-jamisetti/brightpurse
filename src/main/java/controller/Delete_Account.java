package controller;

import java.io.IOException;
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
import dto.AccountDto;
import dto.UserDto;


@WebServlet("/delete")
public class Delete_Account extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession hs=req.getSession();
		UserDto  udto1=(UserDto)hs.getAttribute("User_Object");
		AccountDto ad=(AccountDto)hs.getAttribute("Account");
		PreparedStatement ps;
		
		
		
		try {
			int bal=balanceCheck(Integer.parseInt(req.getParameter("pin")), ad.getPh_No());
			if(Integer.parseInt(req.getParameter("pin"))==ad.getPin())
			{
				if(bal<=1)
				{
					if(udto1.getPhno()==ad.getPh_No())
					{
					ps = AccountDao.createConnection().prepareStatement("delete from Accounts where pin=? and ph_no=?");
					int pin1=Integer.parseInt(req.getParameter("pin"));
					ps.setInt(1, pin1);
						
					ps.setLong(2, ad.getPh_No());
					ps.execute();
					AccountDto b=new AccountDto();
					hs.setAttribute("Account", b);
					RequestDispatcher r1=req.getRequestDispatcher("delete.jsp");
					r1.include(req, resp);
					}
				}
				else {
					req.setAttribute("Amount_Is_There","Please Transfer All The Amount "+bal+".Rs "+" In Your Account");
					RequestDispatcher dispatcher =req.getRequestDispatcher("delete.jsp");
					dispatcher.include(req, resp);
				}
				
			}
			else {
				req.setAttribute("Account_Delete_Pin","pin is invalid");
				RequestDispatcher dispatcher =req.getRequestDispatcher("delete.jsp");
				dispatcher.include(req, resp);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static int balanceCheck(int pin,long ph_no) throws SQLException, Exception
	{
		PreparedStatement ps;
		ps = AccountDao.createConnection().prepareStatement("select * from Accounts where pin=? and ph_no=?");
		ps.setInt(1, pin);
		ps.setLong(2, ph_no);
		ResultSet r = ps.executeQuery();
		
		int balance_Amount = 0;
		if(r.next()) {
		 balance_Amount=r.getInt("balance");
		}
		return balance_Amount;
	}

}