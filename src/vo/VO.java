package vo;

public class VO {

	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "goldspoon";
	public static final String USERPW = "1234";

	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO TB_BOARD"
			+ "(board_no, board_title, board_content, board_viewCnt, board_regdate) " 
			+ "VALUES"
			+ "(SEQ_tb_board_board_no.NEXTVAL, ?, ?, ?, SYSDATE)";
	
}
