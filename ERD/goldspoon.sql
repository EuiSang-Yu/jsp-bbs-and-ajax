
/* Drop Triggers */

DROP TRIGGER TRI_tb_board_board_no;
DROP TRIGGER TRI_tb_champion_champion_no;
DROP TRIGGER TRI_tb_comment_comment_no;
DROP TRIGGER TRI_tb_file_file_no;
DROP TRIGGER TRI_tb_member_member_no;



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

-- 외래키 받을 칼럼 게시판 테이블에 추가
ALTER TABLE TB_BOARD ADD champion_no number;

-- 외래키 설정
ALTER TABLE TB_BOARD ADD CONSTRAINT fk_champion_no FOREIGN KEY (champion_no) REFERENCES tb_champion (champion_no);

SELECT * FROM TB_CHAMPION ;

