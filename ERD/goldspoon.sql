<<<<<<< HEAD
=======
<<<<<<< HEAD
/* Drop Triggers */

DROP TRIGGER TRI_tb_board_board_id;
DROP TRIGGER TRI_tb_like_like_id;
DROP TRIGGER TRI_tb_reply_reply_id;
DROP TRIGGER TRI_tb_user_user_uid;



/* Drop Tables */

DROP TABLE tb_attach CASCADE CONSTRAINTS;
DROP TABLE tb_like CASCADE CONSTRAINTS;
DROP TABLE tb_reply CASCADE CONSTRAINTS;
DROP TABLE tb_board CASCADE CONSTRAINTS;
DROP TABLE tb_user CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tb_board_board_id;
DROP SEQUENCE SEQ_tb_member_member_no;
DROP SEQUENCE SEQ_tb_reply_reply_id;
DROP SEQUENCE SEQ_tb_user_user_uid;




/* Create Sequences */

CREATE SEQUENCE SEQ_tb_board_board_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_member_member_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_reply_reply_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_user_user_uid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE tb_user
(
	user_uid number DEFAULT 0 NOT NULL,
	user_id varchar2(200) UNIQUE,
	user_pw varchar2(200),
	user_name varchar2(200),
	user_email varchar2(200),
	user_phone varchar2(200),
	user_profileImage varchar2(200),
	PRIMARY KEY (user_uid)
);


CREATE TABLE tb_board
(
	board_id number DEFAULT 0 NOT NULL,
	board_writer varchar2(200),
	board_title varchar2(200),
	board_content varchar2(2048),
	board_regDate date DEFAULT sysdate,
	board_viewCnt number,
	board_likeCnt number,
	board_replyCnt number,
	board_champion number,
	PRIMARY KEY (board_id)
);


CREATE TABLE tb_attach
(
	-- 전체경로
	fullName varchar2(200) NOT NULL,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (fullName)
);


CREATE TABLE tb_like
(
	like_id number NOT NULL,
	user_uid number DEFAULT 0 NOT NULL,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (like_id)
);


CREATE TABLE tb_reply
(
	reply_id number DEFAULT 0 NOT NULL,
	reply_writer varchar2(200),
	reply_content varchar2(1024),
	reply_regDate date DEFAULT sysdate,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (reply_id)
);






/* Create Foreign Keys */

ALTER TABLE tb_attach
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_like
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_reply
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_like
	ADD FOREIGN KEY (user_uid)
	REFERENCES tb_user (user_uid)
;

ALTER TABLE tb_board
	ADD FOREIGN KEY (board_writer)
	REFERENCES tb_user (user_id)
;

ALTER TABLE tb_reply
	ADD FOREIGN KEY (reply_writer)
	REFERENCES tb_user (user_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_tb_board_board_id BEFORE INSERT ON tb_board
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_board_board_id.nextval
	INTO :new.board_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_reply_reply_id BEFORE INSERT ON tb_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_reply_reply_id.nextval
	INTO :new.reply_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_like_like_id BEFORE INSERT ON tb_like
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_like_like_id.nextval
	INTO :new.like_id
	FROM dual;
END;

/


CREATE OR REPLACE TRIGGER TRI_tb_user_user_uid BEFORE INSERT ON tb_user
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_user_user_uid.nextval
	INTO :new.user_uid
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN tb_attach.fullName IS '전체경로';


=======

>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
/* Drop Triggers */

DROP TRIGGER TRI_tb_board_board_id;
DROP TRIGGER TRI_tb_like_like_id;
DROP TRIGGER TRI_tb_reply_reply_id;
DROP TRIGGER TRI_tb_user_user_uid;



/* Drop Tables */

DROP TABLE tb_attach CASCADE CONSTRAINTS;
DROP TABLE tb_like CASCADE CONSTRAINTS;
DROP TABLE tb_reply CASCADE CONSTRAINTS;
DROP TABLE tb_board CASCADE CONSTRAINTS;
DROP TABLE tb_user CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tb_board_board_id;
DROP SEQUENCE SEQ_tb_member_member_no;
DROP SEQUENCE SEQ_tb_reply_reply_id;
DROP SEQUENCE SEQ_tb_user_user_uid;




/* Create Sequences */

CREATE SEQUENCE SEQ_tb_board_board_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_member_member_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_reply_reply_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_user_user_uid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE tb_user
(
	user_uid number DEFAULT 0 NOT NULL,
	user_id varchar2(200) UNIQUE,
	user_pw varchar2(200),
	user_name varchar2(200),
	user_email varchar2(200),
	user_phone varchar2(200),
	user_profileImage varchar2(200),
	PRIMARY KEY (user_uid)
);


CREATE TABLE tb_board
(
	board_id number DEFAULT 0 NOT NULL,
	board_writer varchar2(200),
	board_title varchar2(200),
	board_content varchar2(2048),
	board_regDate date DEFAULT sysdate,
	board_viewCnt number,
	board_likeCnt number,
	board_replyCnt number,
	board_champion number,
	PRIMARY KEY (board_id)
);


CREATE TABLE tb_attach
(
	-- 전체경로
	fullName varchar2(200) NOT NULL,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (fullName)
);


CREATE TABLE tb_like
(
	like_id number NOT NULL,
	user_uid number DEFAULT 0 NOT NULL,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (like_id)
);


CREATE TABLE tb_reply
(
	reply_id number DEFAULT 0 NOT NULL,
	reply_writer varchar2(200),
	reply_content varchar2(1024),
	reply_regDate date DEFAULT sysdate,
	board_id number DEFAULT 0 NOT NULL,
	PRIMARY KEY (reply_id)
);






/* Create Foreign Keys */

ALTER TABLE tb_attach
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_like
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_reply
	ADD FOREIGN KEY (board_id)
	REFERENCES tb_board (board_id)
;


ALTER TABLE tb_like
	ADD FOREIGN KEY (user_uid)
	REFERENCES tb_user (user_uid)
;

ALTER TABLE tb_board
	ADD FOREIGN KEY (board_writer)
	REFERENCES tb_user (user_id)
;

ALTER TABLE tb_reply
	ADD FOREIGN KEY (reply_writer)
	REFERENCES tb_user (user_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_tb_board_board_id BEFORE INSERT ON tb_board
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_board_board_id.nextval
	INTO :new.board_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_reply_reply_id BEFORE INSERT ON tb_reply
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_reply_reply_id.nextval
	INTO :new.reply_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_tb_like_like_id BEFORE INSERT ON tb_like
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_like_like_id.nextval
	INTO :new.like_id
	FROM dual;
END;

/


CREATE OR REPLACE TRIGGER TRI_tb_user_user_uid BEFORE INSERT ON tb_user
FOR EACH ROW
BEGIN
	SELECT SEQ_tb_user_user_uid.nextval
	INTO :new.user_uid
	FROM dual;
END;

/

<<<<<<< HEAD



/* Comments */

COMMENT ON COLUMN tb_attach.fullName IS '전체경로';


select * from tab;


=======
SELECT * FROM TB_BOARD ;


/* Comments */

COMMENT ON COLUMN tb_attach.fullName IS '전체경로';


select * from dba_tables;

DROP TABLE TB_BOARD CASCADE CONSTRAINTS;
DROP TABLE TB_CHAMPION CASCADE CONSTRAINTS;
DROP TABLE TB_COMMENT CASCADE CONSTRAINTS;
DROP TABLE TB_FILE CASCADE CONSTRAINTS;
DROP TABLE TB_MEMBER CASCADE CONSTRAINTS;
DROP TABLE TB_RECORD CASCADE CONSTRAINTS;
DROP TABLE USER_TEST CASCADE CONSTRAINTS;

SELECT * FROM USER_SEQUENCES;

DROP SEQUENCE SEQ_TB_BOARD_BOARD_ID;
DROP SEQUENCE SEQ_TB_BOARD_BOARD_NO;
DROP SEQUENCE SEQ_TB_CHAMPION_CHAMPION_NO;
DROP SEQUENCE SEQ_TB_COMMENT_COMMENT_NO;
DROP SEQUENCE SEQ_TB_FILE_FILE_NO;
DROP SEQUENCE SEQ_TB_MEMBER_MEMBER_NO;

>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
