package dao;

import java.io.PrintWriter;
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
import javax.xml.ws.Response;

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

	// 새글 작성 <-- 제목, 내용, 조회수, 해당챔피언, 작성자
	public int insert(String board_title, String board_content, int board_champion) throws SQLException {
		int cnt = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(VO.SQL_WRITE_INSERT);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_champion);


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
			int board_champion = dto.getBoard_champion();

			cnt = this.insert(board_title, board_content, board_champion);

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
			int board_id = rs.getInt("board_id");
			String board_writer = rs.getString("board_writer");
			String board_title = rs.getString("board_title");
			String board_content = rs.getString("board_content");
			if (board_content == null)
				board_content = "";
			// String name = rs.getString("wr_name");
			Date d = rs.getDate("board_regDate");
			Time t = rs.getTime("board_regDate");
			String board_regDate = "";
			if (d != null) {
				board_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			int board_viewCnt = rs.getInt("board_viewCnt");
			int board_likeCnt = rs.getInt("board_likeCnt");
			int board_replyCnt = rs.getInt("board_replyCnt");
			int board_champion = rs.getInt("board_champion");

			BoardDTO dto = new BoardDTO(board_id, board_writer, board_title, board_content, board_regDate, board_viewCnt, board_likeCnt, board_replyCnt, board_champion);
			dto.setBoard_regDate(board_regDate);
			list.add(dto);
		} // end while

		arr = new BoardDTO[list.size()]; // 리스트에 담긴 DTO 의 개수만큼의 배열 생성
		list.toArray(arr); // 리스트 -> 배열
		System.out.println(arr);
		return arr;
	} // end createArray()

	
	
	// 전체 SELECT ListComm
	public BoardDTO[] select(int board_champion) throws SQLException {
		BoardDTO[] arr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT);
			pstmt.setInt(1, board_champion);
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

	public BoardDTO[] selectByboard_id(int board_id, int board_champion) throws SQLException {
		BoardDTO[] arr = null;
		try {
			conn = getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT_BY_NO);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, board_champion);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByUid()

	
	// 특정 uid 글 내용 읽기, 조회수 증가
	// viewcnt 도 +1 증가해야 하고, 읽어와야 한다 --> 트랜잭션 처리

	public BoardDTO[] readByboard_id(int board_id, int board_champion) throws SQLException {

		int cnt = 0;
		BoardDTO[] arr = null;
		
		try {
			conn = getConnection();
		} catch (Exception e1) {
			
			e1.printStackTrace();
		}
		
		
		try {
			System.out.println("들어왔니 리드보드");
			// 트랜잭션 처리
			conn = getConnection();
			conn.setAutoCommit(false);
			System.out.println("쿼리들어오기 직전");
			pstmt = conn.prepareStatement(VO.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, board_champion);
			cnt = pstmt.executeUpdate();

			pstmt.close();
			pstmt = conn.prepareStatement(VO.SQL_WRITE_SELECT_BY_NO);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, board_champion);
			rs = pstmt.executeQuery();
			arr = createArray(rs);


			System.out.println("arr : " + arr.toString());


			conn.commit();
		} catch (SQLException e) {
			conn.rollback(); // 예외 발생하면 rollback
			throw e; // 예외를 다시 throw
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		} // end try

		return arr;
	} // end readByUid()
	
	
	//회원가입 DAO 
	public int signUp(String user_id, String user_pw, String user_name, String user_email, String user_phone) throws SQLException {
		int cnt = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(VO.SQL_USER_SIGNUP);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			pstmt.setString(3, user_name);
			pstmt.setString(4, user_email);
			pstmt.setString(5, user_phone);


			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 실패");
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	} 

	//로그인 -->id
	
	public String login(String user_id) throws SQLException {
		
		//쿼리문 결과 password 받을 변수
		String  user_pw = "";
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(VO.SQL_USER_LOGIN);  //id에대한pw값을 알고있음
			pstmt.setString(1, user_id);

			
			rs = pstmt.executeQuery(); //쿼리문 결과
			while(rs.next()) {
				user_pw = rs.getString("user_pw"); // MEMBER_PW 컬럼의 값을 loginPW 변수에 담음
			}
			System.out.println("user_pw : "+user_pw);
			
		} catch (Exception e) {
			System.out.println("로그인 실패");
			e.printStackTrace();
		} finally {
			close();
		}

		return user_pw;

	} 

	// 특정 board_id 의 글 수정(제목, 내용)

	public int update(String board_title, String board_content, int board_id, int board_champion) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstmt = conn.prepareStatement(VO.SQL_WRITE_UPDATE);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_id);
			pstmt.setInt(4, board_champion);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}	//end try
		return cnt;
	}	//end update()


	//게시글 삭제
	public int delete(int board_id, int board_champion) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_WRITE_DELETE);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, board_champion);
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시글 삭제 실패");
			e.printStackTrace();
		}
		
		return cnt;  
		
	}


}
