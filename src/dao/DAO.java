package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.UserDTO;
import vo.VO;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection도 생성된다.
	public DAO() {
		try {
			Class.forName(VO.DRIVER);
			conn = DriverManager.getConnection(VO.URL, VO.USERID, VO.USERPW);
			System.out.println("DAO생성, 데이터베이스 연결 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패!");
		} finally {
			try {
				close();
			} catch (Exception e) {
			}
		}
	}

	// DB 자원 반납 메소드, 만들어 놓으면 편함.
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close()

	
	
	
	
	// 새글 작성 <-- 제목, 내용, 작성자
	public int insert(String board_title, String board_content, int board_viewCnt) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(VO.SQL_WRITE_INSERT);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_viewCnt);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();

}
