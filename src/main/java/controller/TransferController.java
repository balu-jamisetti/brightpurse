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
import dao.TransactionDao;
import dto.AccountDto;
import dto.TransactionDto;

@WebServlet("/processTransfer")
public class TransferController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TransactionDao t = new TransactionDao();
		HttpSession sessions = req.getSession(); // Prevents creation of a new session if not already present
    	AccountDto user = (AccountDto) sessions.getAttribute("Account");
    	String transfer=null;
    	TransactionDao tr=new TransactionDao();
    	req.setAttribute("transfer", transfer);
    	
		try {
				Connection connection=AccountDao.createConnection();
				PreparedStatement p=connection.prepareStatement("SELECT * FROM Accounts WHERE account_number = ?");
				p.setLong(1, Long.parseLong(req.getParameter("accountNumber")));
				ResultSet resset = p.executeQuery();
				if(resset.next())
				{
					if(resset.getString("ifsc_code").equals(req.getParameter("ifscCode")))
					{
						int balance = t.trasferAmount(new TransactionDto(Long.parseLong(req.getParameter("accountNumber")), req.getParameter("ifscCode"), Integer.parseInt(req.getParameter("amount")), Integer.parseInt(req.getParameter("pin")),user.getPh_No()));
						if(user.getBalance()>=Integer.parseInt(req.getParameter("amount"))) {
							if(user.getPin()==Integer.parseInt(req.getParameter("pin")))
							{
								req.setAttribute("balance", balance);
								transfer="transfered";
								req.setAttribute("transfer", transfer);
								RequestDispatcher dis = req.getRequestDispatcher("transfer.jsp");
								dis.forward(req, resp);
							}
							
							else {
								req.setAttribute("PI", "Inavlid Pin");
								RequestDispatcher dispatcher =req.getRequestDispatcher("transfer.jsp");
								dispatcher.include(req, resp);
							}
						}
						else {
							if(TransactionDao.sucess==0)
							{
							req.setAttribute("IB", "Insufficient Balance");
							RequestDispatcher dispatcher =req.getRequestDispatcher("transfer.jsp");
							dispatcher.include(req, resp);
							}
						}
					}
					else {
						req.setAttribute("IIFSC", "Inavlid IFSC Code");
						RequestDispatcher dispatcher =req.getRequestDispatcher("transfer.jsp");
						dispatcher.include(req, resp);
					}
				}
				else {
					req.setAttribute("IA", "Inavlid Account_Number");
					RequestDispatcher dispatcher =req.getRequestDispatcher("transfer.jsp");
					dispatcher.include(req, resp);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dis = req.getRequestDispatcher("transfer.jsp");
			dis.include(req, resp);
		}
	}
}
