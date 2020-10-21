package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.GoldSpoonQuery;
import dto.UserDTO;


public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public DAO() {
		try {
			Class.forName(GoldSpoonQuery.DRIVER);
			conn = DriverManager.getConnection(GoldSpoonQuery.URL, GoldSpoonQuery.USERID, GoldSpoonQuery.USERPW);
			System.out.println("DAO생성, 데이터베이스 연결!!");
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // end 생성자
	

	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	

}


