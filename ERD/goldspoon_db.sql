
/* Drop Triggers */

DROP TRIGGER TRI_BOARD_board_no;
DROP TRIGGER TRI_COMMENT_comment_no;
DROP TRIGGER TRI_FILE_file_no;
DROP TRIGGER TRI_MEMBER_member_no;
DROP TRIGGER TRI_TB_BOARD_board_no;
DROP TRIGGER TRI_TB_COMMENT_comment_no;
DROP TRIGGER TRI_TB_FILE_file_no;
DROP TRIGGER TRI_TB_MEMBER_member_no;



/* Drop Tables */

DROP TABLE TB_COMMENT CASCADE CONSTRAINTS;
DROP TABLE TB_FILE CASCADE CONSTRAINTS;
DROP TABLE TB_MEMBER CASCADE CONSTRAINTS;
DROP TABLE TB_BOARD CASCADE CONSTRAINTS;
DROP TABLE TB_CHAMPION CASCADE CONSTRAINTS;
DROP TABLE TB_RECORD CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BOARD_board_no;
DROP SEQUENCE SEQ_COMMENT_comment_no;
DROP SEQUENCE SEQ_FILE_file_no;
DROP SEQUENCE SEQ_MEMBER_member_no;
DROP SEQUENCE SEQ_TB_BOARD_board_no;
DROP SEQUENCE SEQ_TB_COMMENT_comment_no;
DROP SEQUENCE SEQ_TB_FILE_file_no;
DROP SEQUENCE SEQ_TB_MEMBER_member_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_BOARD_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_COMMENT_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_FILE_file_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBER_member_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TB_BOARD_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TB_COMMENT_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TB_FILE_file_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TB_MEMBER_member_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE TB_BOARD
(
   -- 게시판 고유 번호
   board_no number DEFAULT 0 NOT NULL,
   -- 게시판 제목
   board_title varchar2(50) NOT NULL,
   -- 게시판 내용
   board_content varchar2(200),
   -- 게시글 조회수
   board_viewCnt number,
   -- 게시글 작성시간
   board_regdate date DEFAULT sysdate,
   -- 챔피언 고유 번호
   champion_no number NOT NULL,
   PRIMARY KEY (board_no)
);


CREATE TABLE TB_CHAMPION
(
   -- 챔피언 고유 번호
   champion_no number NOT NULL,
   -- 챔피언 이름
   champion_name varchar2(20) NOT NULL UNIQUE,
   -- 챔피언 정보
   champion_info varchar2(200),
   PRIMARY KEY (champion_no)
);


CREATE TABLE TB_COMMENT
(
   -- 댓글 고유 번호
   comment_no number NOT NULL,
   -- 댓글 작성자
   comment_name varchar2(20) UNIQUE,
   -- 댓글 내용
   comment_content varchar2(200),
   -- 댓글 작성 시간
   comment_regdate date DEFAULT sysdate NOT NULL,
   -- 댓글 해당 게시글
   comment_parent varchar2(50),
   -- 게시판 고유 번호
   board_no number NOT NULL,
   -- 회원 고유 번호
   member_no number DEFAULT 0 NOT NULL,
   PRIMARY KEY (comment_no)
);


CREATE TABLE TB_FILE
(
   -- 파일 번호
   file_no number DEFAULT 0 NOT NULL,
   -- 이미지파일 경로
   file_image varchar2(200) UNIQUE,
   -- 비디오파일 경로
   file_video varchar2(200) UNIQUE,
   -- 일반파일 경로
   file_normal varchar2(200) UNIQUE,
   -- 링크 경로
   file_link varchar2(200),
   -- 게시판 고유 번호
   board_no number DEFAULT 0 NOT NULL,
   PRIMARY KEY (file_no)
);


CREATE TABLE TB_MEMBER
(
   -- 회원 고유 번호
   member_no number DEFAULT 0 NOT NULL,
   -- 회원 id
   member_id varchar2(20) NOT NULL UNIQUE,
   -- 회원 비밀번호
   member_pw varchar2(20) NOT NULL,
   -- 회원 실명 이름
   member_name varchar2(20) NOT NULL,
   -- 회원 이메일
   member_email varchar2(30),
   -- 회원 휴대전화 번호
   member_phone varchar2(50),
   -- 회원 프로필 사진
   member_photo varchar2(50),
   -- 게시판 고유 번호
   board_no number DEFAULT 0 NOT NULL,
   PRIMARY KEY (member_no)
);


CREATE TABLE TB_RECORD
(
   -- 이미지 경로
   record_profileImg varchar2(100) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE TB_COMMENT
   ADD FOREIGN KEY (board_no)
   REFERENCES TB_BOARD (board_no)
;


ALTER TABLE TB_FILE
   ADD FOREIGN KEY (board_no)
   REFERENCES TB_BOARD (board_no)
;


ALTER TABLE TB_MEMBER
   ADD FOREIGN KEY (board_no)
   REFERENCES TB_BOARD (board_no)
;


ALTER TABLE TB_BOARD
   ADD FOREIGN KEY (champion_no)
   REFERENCES TB_CHAMPION (champion_no)
;


ALTER TABLE TB_COMMENT
   ADD FOREIGN KEY (member_no)
   REFERENCES TB_MEMBER (member_no)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_BOARD_board_no BEFORE INSERT ON tb_BOARD
FOR EACH ROW
BEGIN
   SELECT SEQ_BOARD_board_no.nextval
   INTO :new.board_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_COMMENT_comment_no BEFORE INSERT ON tb_COMMENT
FOR EACH ROW
BEGIN
   SELECT SEQ_COMMENT_comment_no.nextval
   INTO :new.comment_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_FILE_file_no BEFORE INSERT ON tb_FILE
FOR EACH ROW
BEGIN
   SELECT SEQ_FILE_file_no.nextval
   INTO :new.file_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_MEMBER_member_no BEFORE INSERT ON tb_MEMBER
FOR EACH ROW
BEGIN
   SELECT SEQ_MEMBER_member_no.nextval
   INTO :new.member_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TB_BOARD_board_no BEFORE INSERT ON TB_BOARD
FOR EACH ROW
BEGIN
   SELECT SEQ_TB_BOARD_board_no.nextval
   INTO :new.board_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TB_COMMENT_comment_no BEFORE INSERT ON TB_COMMENT
FOR EACH ROW
BEGIN
   SELECT SEQ_TB_COMMENT_comment_no.nextval
   INTO :new.comment_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TB_FILE_file_no BEFORE INSERT ON TB_FILE
FOR EACH ROW
BEGIN
   SELECT SEQ_TB_FILE_file_no.nextval
   INTO :new.file_no
   FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TB_MEMBER_member_no BEFORE INSERT ON TB_MEMBER
FOR EACH ROW
BEGIN
   SELECT SEQ_TB_MEMBER_member_no.nextval
   INTO :new.member_no
   FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN TB_BOARD.board_no IS '게시판 고유 번호';
COMMENT ON COLUMN TB_BOARD.board_title IS '게시판 제목';
COMMENT ON COLUMN TB_BOARD.board_content IS '게시판 내용';
COMMENT ON COLUMN TB_BOARD.board_viewCnt IS '게시글 조회수';
COMMENT ON COLUMN TB_BOARD.board_regdate IS '게시글 작성시간';
COMMENT ON COLUMN TB_BOARD.champion_no IS '챔피언 고유 번호';
COMMENT ON COLUMN TB_CHAMPION.champion_no IS '챔피언 고유 번호';
COMMENT ON COLUMN TB_CHAMPION.champion_name IS '챔피언 이름';
COMMENT ON COLUMN TB_CHAMPION.champion_info IS '챔피언 정보';
COMMENT ON COLUMN TB_COMMENT.comment_no IS '댓글 고유 번호';
COMMENT ON COLUMN TB_COMMENT.comment_name IS '댓글 작성자';
COMMENT ON COLUMN TB_COMMENT.comment_content IS '댓글 내용';
COMMENT ON COLUMN TB_COMMENT.comment_regdate IS '댓글 작성 시간';
COMMENT ON COLUMN TB_COMMENT.comment_parent IS '댓글 해당 게시글';
COMMENT ON COLUMN TB_COMMENT.board_no IS '게시판 고유 번호';
COMMENT ON COLUMN TB_COMMENT.member_no IS '회원 고유 번호';
COMMENT ON COLUMN TB_FILE.file_no IS '파일 번호';
COMMENT ON COLUMN TB_FILE.file_image IS '이미지파일 경로';
COMMENT ON COLUMN TB_FILE.file_video IS '비디오파일 경로';
COMMENT ON COLUMN TB_FILE.file_normal IS '일반파일 경로';
COMMENT ON COLUMN TB_FILE.file_link IS '링크 경로';
COMMENT ON COLUMN TB_FILE.board_no IS '게시판 고유 번호';
COMMENT ON COLUMN TB_MEMBER.member_no IS '회원 고유 번호';
COMMENT ON COLUMN TB_MEMBER.member_id IS '회원 id';
COMMENT ON COLUMN TB_MEMBER.member_pw IS '회원 비밀번호';
COMMENT ON COLUMN TB_MEMBER.member_name IS '회원 실명 이름';
COMMENT ON COLUMN TB_MEMBER.member_email IS '회원 이메일';
COMMENT ON COLUMN TB_MEMBER.member_phone IS '회원 휴대전화 번호';
COMMENT ON COLUMN TB_MEMBER.member_photo IS '회원 프로필 사진';
COMMENT ON COLUMN TB_MEMBER.board_no IS '게시판 고유 번호';
COMMENT ON COLUMN TB_RECORD.record_profileImg IS '이미지 경로';


SELECT * FROM TB_BOARD ;
