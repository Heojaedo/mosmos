package dao;

import java.sql.*;

public class DAO {

	Connection conn;
	
	public void getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/momos";
			String user = "root";
			String password = "1111";
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
