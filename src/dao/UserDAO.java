package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vo.ConnectVO;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection도 생성된다.
	public UserDAO() {
		try {
			Class.forName(ConnectVO.DRIVER);
			conn = DriverManager.getConnection(ConnectVO.URL, ConnectVO.USERID, ConnectVO.USERPW);
			System.out.println("DAO생성, 데이터베이스 연결!!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패!");
		} finally {
			try {
				close();
			} catch (SQLException e) {
			}
		}
	} // end 생성자

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}

	
	
	/*
	// 로그인 처리 부분
	public int loginProc(String userID, String userPass) {

		String query = "select userID, userPass from sibarUser where userID = ? and userPass = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPass);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				try {
					pstmt.close();
					rs.close();
					conn.close();
				} catch (SQLException e) {
				}
				return 1;
			}
		} catch (SQLException e) {
			System.err.println("로그인 sql 오류");
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
			}
		}

		return -1;
	}
	*/

	
	
	
	
}
