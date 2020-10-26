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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.WriteDTO;

import dto.MemberDTO;
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

		// ("java:comp/env"): JNDI 서비스에 접근하기 위한 기본 이름(이 자원을 찾겠다.--> web.xml의 <res-ref-name>
	    ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");

	    System.out.println(ds);
	    return ds.getConnection();
		}
		catch(Exception e)
		{
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

	
	
	//------------------------------------------------------------------------------------------------------------------------//
	
	
	
	// 새글 작성 <-- 제목, 내용, 작성자
	public int insert(String board_title, String board_content, int board_viewCnt) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("connection ready");
			conn = getConnection();
			System.out.println("insert(a,b,c) 호출ok");
			
			pstmt = conn.prepareStatement(VO.SQL_WRITE_INSERT);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_viewCnt);
			cnt = pstmt.executeUpdate();
		} 
		catch(Exception e) {
			System.out.println("insert(a,b,c) error");
			e.printStackTrace();
			
		}
		finally { close(); }
		
		return cnt;
		
	} // end insert();

	// 새글작성 <-- DTO
	public int insert(WriteDTO dto) throws SQLException, NamingException {
		System.out.println("insert(WriteDTO dto) 호출ok");

		String board_title = dto.getBoard_title();
		String board_content = dto.getBoard_content();
		int board_viewCnt = dto.getBoard_viewCnt();

		int cnt = this.insert(board_title, board_content, board_viewCnt);
		
		return cnt;
	}
	
	// ResultSet --> DTO 배열로 리턴
		public WriteDTO [] createArray(ResultSet rs) throws SQLException {
			WriteDTO [] arr = null;  // DTO 배열로 리턴
			
			ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
			
			while(rs.next()) {
				int board_no = rs.getInt("board_no");
				String board_title = rs.getString("board_title");
				String board_content = rs.getString("board_content");
				if(board_content == null) board_content = "";
				//String name = rs.getString("wr_name");
				int board_viewCnt = rs.getInt("board_viewCnt");
				
				Date d = rs.getDate("board_regDate");
				Time t = rs.getTime("board_regDate");
				String board_regDate = "";
				if(d != null) {
					board_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
				WriteDTO dto = new WriteDTO(board_no, board_title, board_content, board_viewCnt);
				dto.setboard_regDate(board_regDate);
				list.add(dto);
			} // end while
			
			arr = new WriteDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
			list.toArray(arr);  // 리스트 -> 배열
				
			return arr;
		} // end createArray()
	
	
	
	
	
	
	

}
