package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.TransactionDto;

public class TransactionDao {
	public static int sucess=1;
	public int trasferAmount(TransactionDto t) throws Exception {
		
		int sendBalance=0;
		int receiverBalance=0;
		long senderAccount;
		Connection con=AccountDao.createConnection();
		
		PreparedStatement ps=con.prepareStatement("select account_number,balance from Accounts where ph_no=?");
		ps.setLong(1, t.getPh_no());
		ResultSet r =  ps.executeQuery();
		if(r.next()) {
			senderAccount = r.getLong("account_number");
			sendBalance = r.getInt("balance");
		}
		else {
			con.close();
			ps.close();
			System.out.println("user does not have a account");
			return 0;
		}
		PreparedStatement ps1=con.prepareStatement("select balance from Accounts where account_number=?");
		ps1.setLong(1, t.getReceiverAccount());
		ResultSet r1 =  ps1.executeQuery();
		if(r1.next()) {
			receiverBalance = r1.getInt("balance");
		}else {
			System.out.println(t.getReceiverAccount());
			con.close();
			ps.close();
			ps1.close();
			return 0;
		}
		if(sendBalance+1<=t.getAmount() || receiverBalance==0) {
			sucess=0;
			con.close();
			ps.close();
			ps1.close();
			return 0;
		}
		else {
			PreparedStatement ps2=con.prepareStatement("update Accounts set balance=? where account_number=?");
			ps2.setDouble(1, sendBalance-t.getAmount());
			ps2.setLong(2, senderAccount);
			PreparedStatement ps3=con.prepareStatement("update Accounts set balance=? where account_number=?");
			ps3.setDouble(1, receiverBalance+t.getAmount());
			ps3.setLong(2, t.getReceiverAccount());
			ps2.execute();
			ps3.execute();
			con.close();
			ps.close();
			ps1.close();
			ps2.close();
			ps3.close();
			return sendBalance-t.getAmount();
		}
	}
}
