package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	
	public static Connection connectAsAdmin() {
		Connection conn = null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/mundofunko?serverTimezone=UTC", "root", "root");
		
		}catch(ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		}
		return conn;
	}

}
