package vo;

public class VO {

   public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
   public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
   public static final String USERID = "goldspoon";
   public static final String USERPW = "1234";

   
   public static final String SQL_WRITE_INSERT = 
         "INSERT INTO tb_board"
         + "(board_id, board_title, board_content, board_regDate, board_viewCnt, board_likeCnt, board_replyCnt, board_champion) " 
         + "VALUES"
         + "(SEQ_tb_board_board_id.NEXTVAL, ?, ?, SYSDATE, 0, 0, 0, ?)";   //챔피언 넘버 추가
   
   
   public static final String SQL_WRITE_SELECT = 
         "SELECT * FROM tb_board WHERE board_champion = ? ORDER BY board_id DESC";   //챔피언 넘버 추가
   
   
   public static final String SQL_WRITE_SELECT_BY_NO = 

         "SELECT * FROM tb_board WHERE board_id=? and board_champion=?";   //챔피언 넘버 추가

   public static final String SQL_WRITE_INC_VIEWCNT = 
         "UPDATE tb_board SET board_viewCnt = board_viewCnt + 1 WHERE board_id = ? and board_champion=?";   //챔피언 넘버 추가
   
   
   public static final String SQL_USER_SIGNUP = 
         "INSERT INTO TB_USER"
         + "(user_uid, user_id, user_pw, user_name, user_email, user_phone) " 
         + "VALUES"
         + "(SEQ_tb_user_user_uid.NEXTVAL, ?, ?, ?, ?, ?)";



   public static final String SQL_WRITE_UPDATE = 
         "UPDATE TB_BOARD SET board_title = ?, board_content = ? WHERE board_id = ? and board_champion=?";   //챔피언 넘버 추가


   public static final String SQL_USER_LOGIN = 

         "SELECT user_pw FROM TB_USER WHERE user_id=?";  //로그인 id를 입력했을때 pw select


   public static final String SQL_WRITE_DELETE =

         "DELETE FROM TB_BOARD WHERE board_id=? and board_champion = ?";   //챔피언 넘버 추가



   
   public static final String SQL_REPLY_INSERT = 
            "INSERT INTO tb_reply"
            + "(reply_id, reply_writer, reply_content, reply_regDate, board_id) " 
            + "VALUES"
            + "(SEQ_tb_reply_reply_id.NEXTVAL, ?, ?, SYSDATE, ?)";

   public static final String SQL_MYPAGE_SELECT = 
         "SELECT * FROM TB_USER WHERE USER_ID=?";   // 마이페이지 열었을때 회원가입정보 가져오기
   
   public static final String SQL_MYPAGE_UPDATE = 

            "UPDATE TB_USER SET USER_PW = ?, USER_EMAIL = ?, USER_PHONE = ? WHERE USER_UID = ?";   //챔피언 넘버 추가


   public static final String SQL_REPLY_SELECT = 
            "SELECT * FROM tb_reply WHERE board_id = ? ORDER BY reply_regDate DESC";


   public static final String SQL_REPLY_DELETE =

         "DELETE FROM tb_reply WHERE reply_id=?";
   
   
   public static final String SQL_REPLY_UPDATE = 
            "UPDATE tb_reply SET  reply_content = ? WHERE reply_id = ?";
}