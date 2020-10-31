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
import dto.ReplyDTO;
import dto.UserDTO;
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
		
		return arr;
	} // end createArray()

	public UserDTO[] createUserArray(ResultSet rs) throws SQLException {
		UserDTO[] arr = null;
		
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		while (rs.next()) {
			int user_uid = rs.getInt("user_uid");
			String user_id = rs.getString("user_id");
			String user_pw = rs.getString("user_pw");
			String user_name = rs.getString("user_name");
			String user_email = rs.getString("user_email");
			String user_phone = rs.getString("user_phone");
			String user_profileImage = rs.getString("user_profileImage");
			
			UserDTO dto = new UserDTO(user_uid, user_id, user_pw, user_name, user_email, user_phone, user_profileImage);
			list.add(dto);
		}
		
		arr = new UserDTO[list.size()];
		list.toArray(arr);
		
		return arr;
	}
	
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
			
			// 트랜잭션 처리
			conn = getConnection();
			conn.setAutoCommit(false);
			
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
		} finally {
			close();
		}
		
		return cnt;  
		
	}
	
	public UserDTO[] selectByuser_id(String user_id) throws SQLException {
		UserDTO[] arr = null;
		try {
			conn = getConnection();
		} catch (Exception e) {
			System.out.println("DB 커넥션 오류");
			e.printStackTrace();
		}

		try {
			pstmt = conn.prepareStatement(VO.SQL_MYPAGE_SELECT);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			arr = createUserArray(rs);
			
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByuser_Uid()
	

	public int mypageUpdate(String user_id, String user_pw, String user_email, String user_phone) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			System.out.println("DB 커넥션 오류");
			e.printStackTrace();
		}
		try {
			pstmt = conn.prepareStatement(VO.SQL_MYPAGE_UPDATE);
			pstmt.setString(1, user_pw);
			pstmt.setString(2, user_email);
			pstmt.setString(3, user_phone);
			pstmt.setString(4, user_id);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}	//end try
		return cnt;
	}	//end update()

	public int reply_insert(String reply_writer, String reply_content, int board_id) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_REPLY_INSERT);
			pstmt.setString(1, reply_writer);
			pstmt.setString(2, reply_content);
			pstmt.setInt(3, board_id);
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;  
		
	}
	
	// Write --> ResultSet --> DTO 배열로 리턴
	public ReplyDTO[] reply_createArray(ResultSet rs) throws SQLException {
		ReplyDTO[] arr = null; // DTO 배열로 리턴

		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		while (rs.next()) {
			int reply_id = rs.getInt("reply_id");
			String reply_writer = rs.getString("reply_writer");
			String reply_content = rs.getString("reply_content");
			if (reply_content == null)
				reply_content = "";
			// String name = rs.getString("wr_name");
			Date d = rs.getDate("reply_regDate");
			Time t = rs.getTime("reply_regDate");
			String reply_regDate = "";
			if (d != null) {
				reply_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			int board_id = rs.getInt("board_id");

			ReplyDTO dto = new ReplyDTO(reply_id, reply_writer, reply_content, reply_regDate, board_id);
			dto.setReply_regDate(reply_regDate);
			list.add(dto);
		} // end while

		arr = new ReplyDTO[list.size()]; // 리스트에 담긴 DTO 의 개수만큼의 배열 생성
		list.toArray(arr); // 리스트 -> 배열
		
		return arr;
	} // end createArray()
	
	
	// 전체 SELECT ListComm
	public ReplyDTO[] reply_list(int board_id) throws SQLException {
		ReplyDTO[] arr = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_REPLY_SELECT);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			arr = reply_createArray(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return arr;
	} // end select();
	
	
	//게시글 삭제
	public int reply_delete(int reply_id) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(VO.SQL_REPLY_DELETE);
			pstmt.setInt(1, reply_id);
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;  
		
	}
	
	public int profileImage_upload(String user_profileImage, String user_id) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			System.out.println("커넥션 오류");
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(VO.SQL_PROFILEIMAGE_UPLOAD);
			pstmt.setString(1, user_profileImage);
			pstmt.setString(2, user_id);
			cnt=pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	}
	
	public int user_delete(String user_id) throws SQLException{
		int cnt = 0;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			System.out.println("커넥션 오류");
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(VO.SQL_USER_DELETE);
			pstmt.setString(1, user_id);
			cnt=pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	}
	
}
