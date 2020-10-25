package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vo.ConnectVO;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO TB_BOARD"
			+ "(board_no, board_title, board_content, board_viewCnt, board_regdate, chmapion_no) "
			+ "VALUES"
			+ "(SEQ_TB_BOARD_board_no.nextval, ?, ?, ?, SYSDATE,1)";

	// DAO 객체가 생성될때 Connection도 생성된다.
	public DAO() {
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

	
	// 새글 작성  <-- 제목, 내용, 작성자
	public int insert(String board_title, String board_content, int board_viewCnt) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(SQL_WRITE_INSERT);
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
