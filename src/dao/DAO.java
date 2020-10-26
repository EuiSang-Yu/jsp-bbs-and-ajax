package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import dto.BoardDTO;


import vo.VO;


public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO USER_TEST"
			+ "(test_uid, test_title, test_content) "
			+ "VALUES"
			+ "(2,?,?)";

	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM test_write ORDER BY wr_uid DESC";
	
	public static final String SQL_WRITE_SELECT_BY_UID =
			"SELECT * FROM test_write WHERE wr_uid=?";

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
				e.printStackTrace();
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
	public int insert(String board_title, String board_content) throws SQLException {
		int cnt = 0;

		try {

			System.out.println("insert() 호출");
			System.out.println(board_title+" "+board_content);

			pstmt = conn.prepareStatement("INSERT INTO USER_TEST"
					+ "(test_uid, test_title, test_content) "
					+ "VALUES"
					+ "(2,?,?)");

			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			cnt += pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	} // end insert();

	

	// 새글작성 <-- DTO
	public int insert(BoardDTO dto) throws SQLException{
		String test_title = dto.getTest_title();
		String test_content = dto.getTest_content();
		
		int cnt = this.insert(test_title, test_content);
		return cnt;		
	}


	// ResultSet --> DTO 배열로 리턴
	public BoardDTO [] createArray(ResultSet rs) throws SQLException {
		BoardDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		while(rs.next()) {
			int test_uid = rs.getInt("test_uid");
			String test_title = rs.getString("test_subject");
			String test_content = rs.getString("test_content");
			if(test_content == null) test_content = "";
			
			BoardDTO dto = new BoardDTO(test_uid, test_title, test_content);
			list.add(dto);
		} // end while
		
		arr = new BoardDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
	} // end createArray()

	
	// 전체 SELECT
	public BoardDTO [] select() throws SQLException {
		BoardDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		 
		return arr;
	} // end select();
	
	
	// 특정 uid 의 글만 SELECT
	public BoardDTO[] selectByUid(int uid) throws SQLException {
		BoardDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectByUid()
	
}
