
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



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_tb_board_board_no BEFORE INSERT ON tb_board
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_board_board_no.nextval
	INTO :new.board_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_champion_champion_no BEFORE INSERT ON tb_champion
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_champion_champion_no.nextval
	INTO :new.champion_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_comment_comment_no BEFORE INSERT ON tb_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_comment_comment_no.nextval
	INTO :new.comment_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_file_file_no BEFORE INSERT ON tb_file
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_file_file_no.nextval
	INTO :new.file_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_member_member_no BEFORE INSERT ON tb_member
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_member_member_no.nextval
	INTO :new.member_no
	FROM dual;
END;

/




