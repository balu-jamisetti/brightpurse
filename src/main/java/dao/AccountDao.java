
package dao;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import dto.AccountDto;

public class AccountDao {
	
	public static Connection createConnection() throws Exception {
	    // Load the JDBC driver
	    Class.forName("com.mysql.cj.jdbc.Driver");

	    // Load properties from dbconfig.properties
	    InputStream inputStream = AccountDao.class.getClassLoader().getResourceAsStream("dbconfig.properties");
	    if (inputStream == null) {
	        throw new FileNotFoundException("dbconfig.properties file not found in resources");
	    }

	    Properties properties = new Properties();
	    properties.load(inputStream);

	    // Get properties from the file
	    String dbUrl = properties.getProperty("db.url");
	    String dbUser = properties.getProperty("db.user");
	    String dbPassword = properties.getProperty("db.password");

	    // Establish the connection
	    Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	    return con;
	}

    public static void create_Account_table() throws SQLException, Exception
    {
    	PreparedStatement ps2 = createConnection().prepareStatement("CREATE TABLE IF NOT EXISTS Accounts (\r\n"
                + "    name VARCHAR(45),                   -- Account holder's name\r\n"
                + "    ph_no BIGINT PRIMARY KEY,                       -- Phone number\r\n"
                + "    account_number BIGINT UNIQUE,  -- Account number as primary key\r\n"
                + "    ifsc_code VARCHAR(11),              -- IFSC code\r\n"
                + "    Account_Type VARCHAR(45),              -- IFSC code\r\n"
                + "    pin INT,                            -- PIN for account access\r\n"
                + "    Aadhar_No BIGINT,              -- Aadhar_No\r\n"
                + "    balance BIGINT,             -- Account balance\r\n"
                + "    nominee_name VARCHAR(45),           -- Nominee's name\r\n"
                + "    relation_with_nominee VARCHAR(45)   -- Relation with nominee\r\n"
                + ");");	
    	ps2.execute();
    }
    public static void createAccount(AccountDto a) throws SQLException, Exception {
    	create_Account_table();
        // Update the number of parameters to match the account table structure
        PreparedStatement ps = createConnection().prepareStatement("INSERT INTO Accounts VALUES (?,?, ?, ?, ?, ?, ?, ?, ?,?)");
        ps.setString(1, a.getName());
        ps.setLong(2, a.getPh_No());
        ps.setLong(3, a.getAccount_Number());
        ps.setString(4, a.getIfsc_Code());
        ps.setString(5, a.getAccount_Type());
        ps.setInt(6, a.getPin());
        ps.setLong(7, a.getAadhar_No());
        ps.setLong(8, a.getBalance());
        ps.setString(9, a.getNominee_Name());
        ps.setString(10, a.getRelation_With_Nominee());
        ps.execute();
    }


}
