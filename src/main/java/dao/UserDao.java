package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import dto.UserDto;

	public class UserDao {

	    // Constructor that ensures the USERS table is created
	    public UserDao() {
	        try 
	        {
	            createTable();
	        } 
	        catch (Exception e) 
	        {
	            e.printStackTrace();
	        }
	    }
	    
	    public void createTable() throws Exception {
	    	Connection connection=AccountDao.createConnection();
	        PreparedStatement ps1 = connection.prepareStatement("CREATE TABLE IF NOT EXISTS USERS ("
	                + "firstName VARCHAR(45),"
	                + "lastName VARCHAR(45),"
	                + "gender VARCHAR(45),"
	                + "email VARCHAR(45) UNIQUE,"
	                + "phno BIGINT PRIMARY KEY,"
	                + "address VARCHAR(100),"
	                + "password VARCHAR(100)"
	                + ");");
	        ps1.execute();
	        ps1.close();
	        connection.close();
	    }


	    public void insert(UserDto u) throws Exception {
	        createTable(); // Ensure the table is created before insertion
	        Connection c=AccountDao.createConnection();
	        PreparedStatement ps = c.prepareStatement("INSERT INTO USERS (firstName, lastName, gender, email, phno, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)");

	        ps.setString(1, u.getFname());
	        ps.setString(2, u.getLname());
	        ps.setString(3, u.getGender());
	        ps.setString(4, u.getEmail());
	        ps.setLong(5, u.getPhno());
	        ps.setString(6, u.getAddress());
	        ps.setString(7, u.getPassword());
	        ps.execute();
	        ps.close();
	        c.close();
	    }
	    public static int delete(UserDto udto) throws Exception
		{
			PreparedStatement ps=AccountDao.createConnection().prepareStatement("delete * from accounts where email=?");
			ps.setString(1, udto.getEmail());
			int a=ps.executeUpdate();
			return a;
		}

	    public static int update_Details(UserDto u) throws Exception {
	    	Connection c=AccountDao.createConnection();
	        UserDao u1=new UserDao();
	        PreparedStatement ps = null;
			try {
				 ps = c.prepareStatement("update  USERS set firstName=?, lastName=?, gender=?, phno=?, address=? where email=?");
			        ps.setString(1, u.getFname());
			        ps.setString(2, u.getLname());
			        ps.setString(3, u.getGender());
			        ps.setLong(4, u.getPhno());
			        ps.setString(5, u.getAddress());
			        ps.setString(6, u.getEmail());
			        
			        
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ps.executeUpdate();   
	    }
	    public static int check_Email_Password(String email,long ph_No)
	    {	int a;
	    	int b;
	    	PreparedStatement ps;
			try {
				ps = AccountDao.createConnection().prepareStatement("select * from users where email=?");
				ps.setString(1,email);
				ResultSet r = ps.executeQuery();
				if(r.next())
				{
					 return 0;
				}
				ps = AccountDao.createConnection().prepareStatement("select * from users where phno=?");
				ps.setLong(1,ph_No);
				ResultSet r1 = ps.executeQuery();
				if(r1.next())
				{
					 return 1;
				}
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return (Integer) null;
			
	    }
	}

    
