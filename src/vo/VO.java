package vo;

public class VO {

	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "goldspoon";
	public static final String USERPW = "1234";

	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO TB_BOARD"
			+ "(board_no, board_title, board_content, board_viewCnt, board_regdate, champion_no) " 
			+ "VALUES"
			+ "(SEQ_tb_board_board_no.NEXTVAL, ?, ?, ?, SYSDATE,?)";	//챔피언 넘버 추가
	
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM tb_board WHERE champion_no = ? ORDER BY board_no DESC";	//챔피언 넘버 추가
	
	
	public static final String SQL_WRITE_SELECT_BY_NO = 
			"SELECT * FROM tb_board WHERE board_no=? ";	//챔피언 넘버 추가

	
	public static final String SQL_WRITE_INC_VIEWCNT = 
			"UPDATE tb_board SET board_viewCnt = board_viewCnt + 1 WHERE board_no = ?";	//챔피언 넘버 추가
	
	public static final String SQL_USER_SIGNUP = 
			"INSERT INTO TB_MEMBER"
			+ "(member_no, member_id, member_pw, member_name, member_email, member_phone) " 
			+ "VALUES"
			+ "(SEQ_tb_member_member_no.NEXTVAL, ?, ?, ?, ?, ?)";



	public static final String SQL_WRITE_UPDATE = 
			"UPDATE TB_BOARD SET board_title = ?, board_content = ? WHERE board_no = ?";	//챔피언 넘버 추가


	public static final String SQL_USER_LOGIN = 
			"SELECT MEMBER_PW FROM TB_MEMBER WHERE MEMBER_ID=?";  //로그인 id를 입력했을때 pw select



	public static final String SQL_WRITE_DELETE =
			"DELECT FROM TB_BOARD WHERE board_no=?";	//챔피언 넘버 추가



}
