/* Drop Trigger */

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
DROP SEQUENCE SEQ_tb_like_like_id;
DROP SEQUENCE SEQ_tb_reply_reply_id;
DROP SEQUENCE SEQ_tb_user_user_uid;
DROP SEQUENCE SEQ_tb_attach_attach_id;




/* Create Tables */
/* Create Foreign Keys */

CREATE TABLE tb_user
(
   user_uid number DEFAULT 0 ,
   user_id varchar2(200) UNIQUE,
   user_pw varchar2(200),
   user_name varchar2(200),
   user_email varchar2(200),
   user_phone varchar2(200),
   user_profileImage varchar2(200),
   CONSTRAINT pk_user_user_uid PRIMARY KEY(user_uid)
);


CREATE TABLE tb_board
(
   board_id number DEFAULT 0 ,
   board_writer varchar2(200),
   board_title varchar2(200),
   board_content varchar2(2048),
   board_regDate date DEFAULT sysdate,
   board_viewCnt number,
   board_likeCnt number,
   board_replyCnt number,
   board_champion number,
   CONSTRAINT pk_board_board_id PRIMARY KEY(board_id),
   CONSTRAINT fk_board_board_writer FOREIGN KEY(board_writer) REFERENCES tb_user(user_id) ON DELETE CASCADE
);


CREATE TABLE tb_like
(
   like_id number,
   user_uid number DEFAULT 0 NOT NULL,
   board_id number DEFAULT 0 NOT NULL,
   CONSTRAINT pk_like_like_id PRIMARY KEY(like_id),
   CONSTRAINT fk_like_user_uid FOREIGN KEY(user_uid) REFERENCES tb_user(user_uid) ON DELETE CASCADE,
   CONSTRAINT fk_like_board_id FOREIGN KEY(board_id) REFERENCES tb_board(board_id) ON DELETE CASCADE
);


CREATE TABLE tb_reply
(
   reply_id number DEFAULT 0 ,
   reply_writer varchar2(200),
   reply_content varchar2(1024),
   reply_regDate date DEFAULT sysdate,
   board_id number DEFAULT 0 NOT NULL,
   CONSTRAINT pk_reply_reply_id PRIMARY KEY(reply_id),
   CONSTRAINT fk_reply_reply_writer FOREIGN KEY(reply_writer) REFERENCES tb_user(user_id) ON DELETE CASCADE,
   CONSTRAINT fk_reply_board_id FOREIGN KEY(board_id) REFERENCES tb_board(board_id) ON DELETE CASCADE
);


CREATE TABLE tb_attach
(
   attach_id NUMBER DEFAULT 0 ,
   attach_source varchar2(400),
   board_id number DEFAULT 0 NOT NULL,
   CONSTRAINT pk_attach_attach_id PRIMARY KEY(attach_id),
   CONSTRAINT fk_attach_board_id FOREIGN KEY(board_id) REFERENCES tb_board(board_id) ON DELETE CASCADE
);




/* Create Sequences */

CREATE SEQUENCE SEQ_tb_board_board_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_reply_reply_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_user_user_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_like_like_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_tb_attach_attach_id INCREMENT BY 1 START WITH 1;



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
   attach_id NUMBER DEFAULT 0 NOT NULL,
   fullName varchar2(200) NOT NULL,
   board_id number DEFAULT 0 NOT NULL,
   PRIMARY KEY (attach_id)
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

CREATE OR REPLACE TRIGGER TRI_tb_attach_attach_id BEFORE INSERT ON tb_attach
FOR EACH ROW
BEGIN
   SELECT SEQ_tb_attach_attach_id.nextval
   INTO :new.attach_id
   FROM dual;
END;

/

CREATE SEQUENCE SEQ_tb_board_board_id INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_reply_reply_id INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_user_user_uid INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_like_like_id INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_attach_attach_id INCREMENT BY 1 START WITH 1 NOCACHE;

/* 해당 계정 테이블 목록 확인*/
select * from tab;

select * from tb_user;

SELECT * FROM TB_BOARD ;

/* 해당 계정 테이블 목록 확인*/
select * from tab;

/* 해당 계정 시퀀스 목록 확인*/
SELECT * FROM USER_SEQUENCES;


/* 해당 tb_attach 칼럼 확인 */
SELECT * FROM TB_ATTACH;

