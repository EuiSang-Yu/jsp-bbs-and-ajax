
/* Drop Tables */

DROP TABLE tb_board CASCADE CONSTRAINTS;
DROP TABLE tb_champion CASCADE CONSTRAINTS;
DROP TABLE tb_comment CASCADE CONSTRAINTS;
DROP TABLE tb_file CASCADE CONSTRAINTS;
DROP TABLE tb_member CASCADE CONSTRAINTS;
DROP TABLE tb_record CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tb_board_board_no;
DROP SEQUENCE SEQ_tb_champion_champion_no;
DROP SEQUENCE SEQ_tb_comment_comment_no;
DROP SEQUENCE SEQ_tb_file_file_no;
DROP SEQUENCE SEQ_tb_member_member_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_tb_board_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_champion_champion_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_comment_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_file_file_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_member_member_no INCREMENT BY 1 START WITH 1;

/* Sequences nocache */
ALTER SEQUENCE SEQ_tb_board_board_no nocache;
ALTER SEQUENCE SEQ_tb_champion_champion_no nocache;
ALTER SEQUENCE SEQ_tb_comment_comment_no nocache;
ALTER SEQUENCE SEQ_tb_file_file_no nocache;
ALTER SEQUENCE SEQ_tb_member_member_no nocache;


/* Create Tables */

CREATE TABLE tb_board
(
   board_no number DEFAULT 0 NOT NULL,
   board_title varchar2(100) NOT NULL,
   board_content varchar2(200),
   board_viewCnt number,
   board_regDate date DEFAULT SYSDATE,
   PRIMARY KEY (board_no)
);


CREATE TABLE tb_champion
(
   champion_no number DEFAULT 0 NOT NULL,
   champion_name varchar2(30) UNIQUE,
   champion_info varchar2(200),
   PRIMARY KEY (champion_no)
);


CREATE TABLE tb_comment
(
   comment_no number DEFAULT 0 NOT NULL,
   comment_content varchar2(200),
   comment_regDate date DEFAULT SYSDATE,
   PRIMARY KEY (comment_no)
);


CREATE TABLE tb_file
(
   file_no number DEFAULT 0 NOT NULL,
   file_image varchar2(200),
   file_video varchar2(200),
   file_normal varchar2(200),
   file_link varchar2(200),
   PRIMARY KEY (file_no)
);


CREATE TABLE tb_member
(
   member_no number DEFAULT 0 NOT NULL,
   member_id varchar2(20) UNIQUE,
   member_pw varchar2(20),
   member_name varchar2(20),
   member_email varchar2(100),
   member_phone varchar2(100),
   member_photo varchar2(100),
   PRIMARY KEY (member_no)
);


CREATE TABLE tb_record
(
   record_profileImg varchar2(200)
);



SELECT * FROM tb_board ORDER BY board_no DESC;

-- 작성자 칼럼추가
ALTER TABLE TB_BOARD ADD board_memberId varchar2(20);

-- 작성자 칼럼 ( 멤버테이블에 member_id서 외래키 참조)
ALTER TABLE TB_BOARD ADD CONSTRAINT fk_board_id FOREIGN KEY (board_memberId) REFERENCES tb_member (member_id);

-- 외래키 받을 칼럼 게시판 테이블에 추가
ALTER TABLE TB_BOARD ADD champion_no number;

-- 외래키 설정
ALTER TABLE TB_BOARD ADD CONSTRAINT fk_champion_no FOREIGN KEY (champion_no) REFERENCES tb_champion (champion_no);


SELECT * FROM TB_MEMBER;
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git

SELECT * FROM TB_COMMENT ;

<<<<<<< HEAD
SELECT * FROM TB_BOARD;

SELECT * FROM TB_CHAMPION ;

SELECT * FROM tb_board WHERE board_no=1;

INSERT INTO TB_CHAMPION 
(CHAMPION_NO , CHAMPION_NAME , CHAMPION_INFO) 
VALUES
(1,'aaa','bbb');

INSERT INTO TB_MEMBER 
(MEMBER_NO , MEMBER_ID , MEMBER_PW , MEMBER_NAME , MEMBER_EMAIL , MEMBER_PHONE , MEMBER_PHOTO ) 
VALUES
(1,'hyuk','1234', '안신혁', 'hyuk네이버', '12312321', 'sadsada');

INSERT INTO TB_BOARD
(board_no, board_title, board_content, board_viewCnt, board_regdate) 
VALUES
(1, '안녕', '안녕하세요', 0, SYSDATE);

ALTER TABLE TB_BOARD ADD champion_no number;

ALTER TABLE TB_BOARD ADD CONSTRAINT fk_champion_no FOREIGN KEY (champion_no) REFERENCES tb_champion (champion_no);
=======

SELECT * FROM TB_CHAMPION;

SELECT * FROM tb_board WHERE champion_no = 3 ORDER BY board_no DESC;

INSERT INTO TB_CHAMPION (CHAMPION_NO, CHAMPION_NAME, CHAMPION_INFO ) VALUES (1 , '가렌' , '데마시아');

INSERT INTO TB_MEMBER (MEMBER_NO , MEMBER_ID , MEMBER_PW , MEMBER_NAME , MEMBER_EMAIL , MEMBER_PHONE , MEMBER_PHOTO ) 
VALUES (10, 'AAA', 'AAA' , '이지연' , 'ESFSDFSDASDF' , '0105555555' , '5555SDAFSDF');
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git

