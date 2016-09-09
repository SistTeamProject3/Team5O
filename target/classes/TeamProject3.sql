-- [ 회원 ] --

DROP TABLE TP3_MEMBER
CASCADE CONSTRAINTS;

SELECT * FROM TP3_MEMBER;

CREATE TABLE TP3_MEMBER(
	M_ID			VARCHAR2(64)	PRIMARY KEY,
	M_NAME			VARCHAR2(20)	NOT NULL,
	M_NICKNAME		VARCHAR2(20)	NOT NULL,
	M_PASSWORD		VARCHAR2(12)	NOT NULL,
	M_PHONE			VARCHAR2(11)	NOT NULL,
	M_REGDATE		DATE			NOT NULL,
	M_BIRTHDAY		VARCHAR2(8)		NOT NULL,
	M_PROFILE		VARCHAR2(1000),
	M_HIGHSCHOOL	VARCHAR2(100),
	M_UNIVERSITY	VARCHAR2(100),
	M_OFFICE		VARCHAR2(100),
	M_MARRIAGE		NUMBER(1),
	M_ADDRESS		VARCHAR2(100),
	M_DEACTIVATION	NUMBER(1)		NOT NULL,
	M_ASK			NUMBER(1)		NOT NULL,
	M_CONTENT		VARCHAR2(100),
	M_STOPDATE		VARCHAR2(8),
	M_GENDER		NUMBER(1)		NOT NULL
);


insert into TP3_MEMBER
values('qwer', 'qwer', 'qwer', 'qwer', '01012345678', sysdate, '881111',
'', '', '', '', 0, '서울시', 0, 0, 'qwer입니다', '',1);
insert into TP3_MEMBER
values('asdf', 'asdf', 'asdf', 'asdf', '01056471234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'asdf입니다', '',2);
insert into TP3_MEMBER
values('kwon', 'kwon', 'kwon', 'kwon', '01001001000', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kwon입니다', '',1);
insert into TP3_MEMBER
values('kim', 'kim', 'kim', 'kim', '01078945612', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kim입니다', '',1);
insert into TP3_MEMBER
values('young', 'young', 'young', 'young', '01088885252', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'young입니다', '',1);
insert into TP3_MEMBER
values('Ahyo', 'Ahyo', 'Ahyo', 'Ahyo', '01012341234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'Ahyo입니다', '',1);
insert into TP3_MEMBER
values('nanna', 'nanna', 'nanna', 'nanna', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'nanna입니다', '',1);
insert into TP3_MEMBER
values('imma', 'imma', 'imma', 'imma', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'imma입니다', '',1);
insert into TP3_MEMBER
values('yonyon', 'yonyon', 'yonyon', 'yonyon', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'yonyon입니다', '',1);
insert into TP3_MEMBER
values('asktest1', 'asktest1', 'asktest1', 'asktest1', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest1입니다', '',1);
insert into TP3_MEMBER
values('asktest2', 'asktest2', 'asktest2', 'asktest2', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest2입니다', '',1);


-- [ 친구 ] --

DROP TABLE TP3_FRIEND
CASCADE CONSTRAINT;

DROP SEQUENCE TP3_FRIEND_SEQ;

SELECT * FROM TP3_FRIEND;

CREATE TABLE TP3_FRIEND(
	F_SEQ		NUMBER			PRIMARY KEY,
	M_ID		VARCHAR2(20)	NOT NULL,
	F_ID		VARCHAR2(20)	NOT NULL,
	F_ACCEPT	NUMBER(1)		NOT NULL,
	F_GROUP		NUMBER(1)		NOT NULL,
	F_BLOCK		NUMBER(1)		NOT NULL
);

CREATE SEQUENCE TP3_FRIEND_SEQ
START WITH 1 INCREMENT BY 1;

ALTER TABLE TP3_FRIEND 
ADD CONSTRAINT FK_FRIEND_M_ID FOREIGN KEY(M_ID)
REFERENCES TP3_MEMBER(M_ID);

ALTER TABLE TP3_FRIEND 
ADD CONSTRAINT FK_FRIEND_F_ID FOREIGN KEY(F_ID)
REFERENCES TP3_MEMBER(M_ID);


insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asdf', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'asdf', 'qwer', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'kwon', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'kim', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'young', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'Ahyo', 1, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'nanna', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'imma', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'yonyon', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest1',  0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest2', 0, 2, 0);


-- [ 이벤트 ] --

DROP TABLE TP3_EVENT
CASCADE CONSTRAINTS;

DROP SEQUENCE TP3_EVENT_SEQ;

CREATE TABLE TP3_EVENT(
	E_SEQ			NUMBER,
	E_TYPE			NUMBER(1)		NOT NULL,
	G_SEQ			NUMBER,
	M_NICKNAME		VARCHAR2(20),
	E_TITLE			VARCHAR2(100)	NOT NULL,
	E_CONTENT		VARCHAR2(4000)	NOT NULL,
	E_LOCATION		VARCHAR2(100),
	E_START_DATE	VARCHAR2(8)		NOT NULL,
	E_END_DATE		VARCHAR2(8),
	E_WRITE_DATE	DATE			NOT NULL,
	E_IMAGE			VARCHAR2(1000),
	CONSTRAINT TP3_EVENT_PK PRIMARY KEY(E_SEQ)
--	CONSTRAINT TP3_EVENT_FK_1 FOREIGN KEY(G_SEQ) REFERENCES TP3_GROUP(xxx)
--	CONSTRAINT TP3_EVENT_FK_2 FOREIGN KEY(M_NICKNAME) REFERENCES TP3_MEMBER(xxx)
);

CREATE SEQUENCE TP3_EVENT_SEQ
START WITH 1 INCREMENT BY 1;

-- [ 그룹 ] --

CREATE TABLE TP3_MAKEGROUP(
g_seq NUMBER PRIMARY KEY,
g_name VARCHAR2(100) NOT NULL,
g_photo	VARCHAR2(1000),
g_type NUMBER(1) NOT NULL,
g_manager VARCHAR2(100) NOT NULL
);

CREATE TABLE TP3_GROUPMEMBER(
g_seq NUMBER NOT NULL,
m_id VARCHAR2(100) NOT NULL,
g_auth NUMBER(1) NOT NULL
);

CREATE SEQUENCE TP3_GROUP_SEQ START WITH 1 INCREMENT BY 1;


