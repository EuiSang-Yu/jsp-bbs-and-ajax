package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BoardDTO;

import vo.VO;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection도 생성된다.
	public DAO() {
	}

	// Connection Pool 용 리소스 가져오기
	public static Connection getConnection() throws Exception {

		DataSource ds = null;

		try {
			Context context = new InitialContext();

			// ("java:comp/env"): JNDI 서비스에 접근하기 위한 기본 이름(이 자원을 찾겠다.--> web.xml의
			// <res-ref-name>
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

			System.out.println(ds);
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ds.getConnection();

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

	// ------------------------------------------------------------------------------------------------------------------------//

	// 새글 작성 <-- 제목, 내용, 작성자
	public int insert(String board_title, String board_content, int board_viewCnt) throws SQLException {
		int cnt = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(VO.SQL_WRITE_INSERT);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_viewCnt);

			cnt = pstmt.executeUpdate();// 여기서에러
		} catch (Exception e) {
			System.out.println("pstmt.set~~ error");
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	} // end insert();

	// 새글작성 <-- DTO
	public int insert(BoardDTO dto) throws SQLException, NamingException {

		int cnt = 0;
		try {
			String board_title = dto.getBoard_title();
			String board_content = dto.getBoard_content();
			int board_viewCnt = dto.getBoard_viewCnt();

			cnt = this.insert(board_title, board_content, board_viewCnt);

		} catch (Exception e) {
			System.out.println("새글작성 DTO 에러");
			e.printStackTrace();
		}

		return cnt;
	}

	// Write --> ResultSet --> DTO 배열로 리턴
	public BoardDTO[] createArray(ResultSet rs) throws SQLException {
		BoardDTO[] arr = null; // DTO 배열로 리턴

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		while (rs.next()) {
			int board_no = rs.getInt("board_no");
			String board_title = rs.getString("board_title");
			String board_content = rs.getString("board_content");
			if (board_content == null)
				board_content = "";
			// String name = rs.getString("wr_name");
			int board_viewCnt = rs.getInt("board_viewCnt");
			int champion_no = rs.getInt("champion_no");
			String board_memberId = rs.getString("board_memberId");

			Date d = rs.getDate("board_regDate");
			Time t = rs.getTime("board_regDate");
			String board_regDate = "";
			if (d != null) {
				board_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}

			BoardDTO dto = new BoardDTO(board_no, board_title, board_content, board_viewCnt, champion_no, board_memberId);
			dto.setBoard_regDate(board_regDate);
			list.add(dto);
		} // end while

		arr = new BoardDTO[list.size()]; // 리스트에 담긴 DTO 의 개수만큼의 배열 생성
		list.toArray(arr); // 리스트 -> 배열

		return arr;
	} // end createArray()

	
	
	// 전체 SELECT ListComm
	public BoardDTO[] select() throws SQLException {
		BoardDTO[] arr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} catch (Exception e) {
			System.out.println("SELECT 에러");
			e.printStackTrace();
		} finally {
			close();
		}

		return arr;
	} // end select();
	
	
	// 특정 uid 의 글만 SELECT
	public BoardDTO[] selectByUid(int uid) throws SQLException {
		BoardDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByUid()

	
	// 특정 uid 글 내용 읽기, 조회수 증가
	// viewcnt 도 +1 증가해야 하고, 읽어와야 한다 --> 트랜잭션 처리
	public BoardDTO[] readByUid(int uid) throws SQLException {
		int cnt = 0;
		BoardDTO[] arr = null;

		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(VO.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();

			pstmt.close();
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs);
			conn.commit();
		} catch (SQLException e) {
			conn.rollback(); // 예외 발생하면 rollback
			throw e; // 예외를 다시 throw
		} finally {
			close();
		} // end try

		return arr;
	} // end readByUid()
	
	
	
	
	
	

}
