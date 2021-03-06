-- [ 회원 ] --

DROP TABLE TP3_MEMBER
CASCADE CONSTRAINTS;

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

SELECT * FROM TP3_MEMBER
WHERE M_ID = 'qwer';

SELECT * FROM TP3_MEMBER;

DELETE FROM TP3_MEMBER
WHERE M_PHONE != '01012345678';

UPDATE TP3_MEMBER SET
M_ADDRESS = '서울-아무곳'
WHERE M_ADDRESS = '한국-쌍용';

INSERT INTO TP3_MEMBER
VALUES('stevejobs@apple.com', '스티브잡스', '스티브잡스', '12341234', 
'01012341111', SYSDATE, '19500505', 'member_01.jpg', '내가 돌아왔다', '내가 돌아왔다', '내가 돌아왔다', '2', '외국-애플', 0, 0, '내가 돌아왔다', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('bill', '빌게이츠', '빌게이츠', '12341234', 
'01012341112', SYSDATE, '19500505', 'member_02.jpg', '내 핸드폰 아이폰7', '내 핸드폰 아이폰7', '내 핸드폰 아이폰7', '2', '외국-마소', 0, 0, '마소짱', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('gyohwang', '교황', '교황', '12341234', 
'01012341113', SYSDATE, '19500505', 'member_03.jpg', '나무아미타불', '나무아미타불', '나무아미타불', '2', '외국-교황청', 0, 0, '나무아미타불', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('gerk', '마꾸저커버그', '마꾸저커버그', '12341234', 
'01012341114', SYSDATE, '19500505', 'member_04.jpg', '인스타그램 최고', '인스타그램 최고', '인스타그램 최고', '2', '외국-페이스북', 0, 0, '인스타그램 최고', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('obama', '오바마', '오바마', '12341234', 
'01012341115', SYSDATE, '19500505', 'member_05.jpg', '다음 대통령 트럼프', '다음 대통령 트럼프', '다음 대통령 트럼프', '2', '외국-백악관', 0, 0, '다음 대통령 트럼프', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('northkim', '김정은', '김정은', '12341234', 
'01012341116', SYSDATE, '19500505', 'member_06.jpg', '간나 통일하래', '간나 통일하래', '간나 통일하래', '2', '조선-인민공화국', 0, 0, '간나 통일하래', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('ahyoung', '권아영', '권아영', '12341234', 
'01012341117', SYSDATE, '19500505', 'member_07.jpg', '아 와우하고 싶다', '아 와우하고 싶다', '아 와우하고 싶다', '2', '한국-쌍용', 0, 0, '아 와우하고 싶다', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('yongho', '조용호', '조용호', '12341234', 
'01012341118', SYSDATE, '19500505', 'member_08.jpg', '니들 다 백수', '니들 다 백수', '니들 다 백수', '2', '한국-쌍용', 0, 0, '니들 다 백수', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('youngsun', '한영선', '한영선', '12341234', 
'01012341119', SYSDATE, '19500505', 'member_09.jpg', '후라이드 닭똥집 최고♥', '후라이드 닭똥집 최고♥', '후라이드 닭똥집 최고♥', '2', '한국-쌍용', 0, 0, '후라이드 닭똥집 최고♥', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('hongmin', '김홍민', '김홍민', '12341234', 
'01012341120', SYSDATE, '19500505', 'member_10.jpg', '앙 홍만띠 행님들 별풍 100개 감사합니다 행님', '앙 홍만띠 행님들 별풍 100개 감사합니다 행님', '앙 홍만띠 행님들 별풍 100개 감사합니다 행님', '2', '한국-쌍용', 0, 0, '앙 홍만띠 행님들 별풍 100개 감사합니다 행님', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('hyejung', '선혜정', '선혜정', '12341234', 
'01012341121', SYSDATE, '19500505', 'member_11.jpg', '라이어', '라이어', '라이어', '2', '한국-쌍용', 0, 0, '라이어', NULL, 0);
INSERT INTO TP3_MEMBER
VALUES('suji', '수지', '수지', '12341234', 
'01012341122', SYSDATE, '19500505', 'member_12.jpg', '아 덕후 새X들 상대하기 존X 귀찬네', '아 덕후 새X들 상대하기 존X 귀찬네', '아 덕후 새X들 상대하기 존X 귀찬네', '2', '한국-방송국', 0, 0, '아 덕후 새X들 상대하기 존X 귀찬네', NULL, 0);


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

-- 테스트
UPDATE TP3_MEMBER SET
M_ID = 'asd'
WHERE M_ID = 'asd@asd';

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
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asd', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'imma', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'yonyon', 'qwer', 0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest1',  0, 2, 0);
insert into TP3_FRIEND
values(TP3_FRIEND_SEQ.nextval, 'qwer', 'asktest2', 0, 2, 0);

-- 테스트
SELECT * FROM TP3_FRIEND;

-- [뉴스피드] --

DROP TABLE TP3_NEWSFEED
CASCADE CONSTRAINT;

DROP SEQUENCE TP3_NEWSFEED_SEQ;

CREATE TABLE TP3_NEWSFEED(
N_SEQ	NUMBER PRIMARY KEY,	
G_SEQ	NUMBER,
N_FORM_NUM	NUMBER(1),	
M_ID	VARCHAR2(20)	NOT NULL,
N_CONTENT	VARCHAR2(4000),
N_TAG_FRIEND	VARCHAR2(1000),	
N_TAG_WHERE	VARCHAR2(20),	
N_TAG_FEEL	NUMBER(1),	
N_SHOW	NUMBER(1)	NOT NULL,
N_WDATE	DATE	NOT NULL,
N_REPORT	NUMBER(1),	
N_REF	NUMBER,
N_STEP	NUMBER,	
N_DEPTH	NUMBER,
N_PARENT	NUMBER,
N_DEL	NUMBER(1),	
N_SHARE	NUMBER(1),	
N_EVENT_SEQ	NUMBER,	
N_VOTE_SEQ	NUMBER,
N_LIKECOUNT NUMBER
);

CREATE SEQUENCE TP3_NEWSFEED_SEQ
START WITH 1 INCREMENT BY 1;


DROP TABLE TP3_NEWSFEED_FILE
CASCADE CONSTRAINT;

CREATE TABLE TP3_NEWSFEED_FILE(
N_SEQ NUMBER PRIMARY KEY,
N_FORM_NUM NUMBER(1),
NF_PHOTO VARCHAR2(100),
NF_VIDEO VARCHAR2(100),
NF_FILE VARCHAR2(100),
CONSTRAINT FK_N_SEQ FOREIGN KEY(N_SEQ) REFERENCES TP3_NEWSFEED(N_SEQ)
);

drop table TP3_NEWSFEED_LIKE;

CREATE TABLE TP3_NEWSFEED_LIKE(
N_SEQ NUMBER,
NL_LIKE_PEOPLENAME VARCHAR2(20),	
CONSTRAINT FK_NL_SEQ FOREIGN KEY(N_SEQ) REFERENCES TP3_NEWSFEED(N_SEQ)
);

SELECT * FROM TP3_NEWSFEED_LIKE;

-- 컬럼 추가.... --
UPDATE TP3_NEWSFEED SET n_likecount=0
WHERE N_SEQ BETWEEN 1 AND 95;

-- 테스트
SELECT * FROM TP3_NEWSFEED
ORDER BY N_SEQ DESC;

UPDATE TP3_NEWSFEED SET
N_EVENT_SEQ = 1
WHERE N_SEQ = 1;

SELECT * FROM (  SELECT * FROM (SELECT * FROM TP3_NEWSFEED ORDER BY N_SEQ DESC)
WHERE ROWNUM<6 AND N_SEQ<66);

SELECT * FROM TP3_NEWSFEED
WHERE N_EVENT_SEQ = 4
ORDER BY N_SEQ DESC;

SELECT * FROM (SELECT * FROM TP3_NEWSFEED ORDER BY N_SEQ DESC)
	WHERE ROWNUM<5 
	AND N_STEP=0
	AND N_EVENT_SEQ=4;

SELECT * FROM TP3_NEWSFEED A
INNER JOIN TP3_EVENT B
ON A.N_EVENT_SEQ=B.E_SEQ
WHERE ROWNUM < 5
ORDER BY A.N_SEQ DESC;

SELECT * FROM(
SELECT ROWNUM NUM,CC.* FROM(
(SELECT BC.* FROM (
SELECT AC.* FROM (
SELECT A.*, B.E_START_DATE FROM TP3_NEWSFEED A INNER JOIN TP3_EVENT B ON A.N_EVENT_SEQ=B.E_SEQ ORDER BY A.N_SEQ DESC) 
AC) 
BC)
CC)
WHERE (N_STEP = 0 AND N_EVENT_SEQ = 4 ) and N_SEQ < 70 
)WHERE NUM < 6;

SELECT * FROM(
SELECT ROWNUM NUM,CC.* FROM(
(SELECT BC.* FROM (
SELECT AC.* FROM (
SELECT * FROM TP3_NEWSFEED A INNER JOIN TP3_EVENT B ON A.N_EVENT_SEQ=B.E_SEQ ORDER BY A.N_SEQ DESC) 
AC) 
BC)
CC)
WHERE (N_STEP = 0 AND N_EVENT_SEQ = 4 ) 
);

-- [ 이벤트 ] --

DROP TABLE TP3_EVENT
CASCADE CONSTRAINTS;

DROP SEQUENCE TP3_EVENT_SEQ;

CREATE TABLE TP3_EVENT(
	E_SEQ			NUMBER,
	E_TYPE			NUMBER(1)		NOT NULL,
	G_SEQ			NUMBER,
	M_ID			VARCHAR2(100)	NOT NULL,
	M_NAME			VARCHAR2(20),
	E_TITLE			VARCHAR2(200)	NOT NULL,
	E_CONTENT		VARCHAR2(4000)	NOT NULL,
	E_LOCATION		VARCHAR2(100),
	E_START_DATE	VARCHAR2(16)	NOT NULL,
	E_END_DATE		VARCHAR2(16),
	E_WRITE_DATE	DATE			NOT NULL,
	E_IMAGE			VARCHAR2(1000),
	CONSTRAINT TP3_EVENT_PK PRIMARY KEY(E_SEQ)
--	CONSTRAINT TP3_EVENT_FK_1 FOREIGN KEY(G_SEQ) REFERENCES TP3_GROUP(xxx)
--	CONSTRAINT TP3_EVENT_FK_2 FOREIGN KEY(M_NICKNAME) REFERENCES TP3_MEMBER(xxx)
);

CREATE SEQUENCE TP3_EVENT_SEQ
START WITH 1 INCREMENT BY 1;

DROP TABLE TP3_EVENT_INVITE
CASCADE CONSTRAINTS;

CREATE TABLE TP3_EVENT_INVITE(
	E_SEQ			NUMBER,
	M_ID			VARCHAR2(100)	NOT NULL,
	EI_JOIN			NUMBER(1),
	EI_WRITE_DATE	DATE			NOT NULL
--	CONSTRAINT TP3_EVENT_INVITE_PK PRIMARY KEY(EI_SEQ)
--	CONSTRAINT TP3_EVENT_INVITE_FK_1 FOREIGN KEY(E_SEQ) REFERENCES TP3_EVENT(E_SEQ),
--	CONSTRAINT TP3_EVENT_INVITE_FK_2 FOREIGN KEY(M_ID) REFERENCES TP3_MEMBER(M_ID)
);

SELECT * FROM TP3_EVENT
ORDER BY E_SEQ ASC;

SELECT * FROM TP3_EVENT
ORDER BY E_START_DATE ASC;

SELECT * FROM TP3_EVENT_INVITE
ORDER BY E_SEQ ASC;

SELECT * FROM TP3_EVENT_INVITE
WHERE E_SEQ=4
AND M_ID='asdf';

UPDATE TP3_EVENT_INVITE SET
EI_JOIN=0
WHERE E_SEQ=4
AND M_ID='asdf';

-- 테스트
INSERT ALL
INTO TP3_EVENT_INVITE(E_SEQ, M_ID, EI_JOIN)
VALUES('2', 'a', 0)
INTO TP3_EVENT_INVITE(EI_SEQ, E_SEQ, M_ID, EI_JOIN)
VALUES('3', 'aa', 0)
SELECT * FROM DUAL;
--
--SELECT * FROM TP3_EVENT
--WHERE SUBSTR(E_START_DATE, 1, 7)='2016-10'
--AND M_ID='qwer'
--OR (SELECT * FROM TP3_EVENT_INVITE WHERE M_ID='asd')
--ORDER BY E_SEQ ASC;

SELECT * FROM TP3_EVENT A INNER JOIN 
(SELECT * FROM TP3_EVENT_INVITE
WHERE M_ID = 'asd') B
ON A.E_SEQ = B.E_SEQ
WHERE SUBSTR(E_START_DATE, 1, 10)='2016-10-07';


SELECT * FROM TP3_MEMBER A INNER JOIN 
(SELECT * FROM TP3_EVENT_INVITE
WHERE M_ID = 'asd') B
ON A.M_ID = B.M_ID
WHERE E_SEQ = 4;

SELECT * FROM TP3_EVENT_INVITE
WHERE E_SEQ = 5;

SELECT * FROM TP3_EVENT_INVITE
WHERE E_SEQ = 4
AND M_ID = 'asd';

SELECT * FROM TP3_MEMBER A
LEFT JOIN (SELECT * FROM TP3_EVENT_INVITE WHERE E_SEQ = 5) B
ON A.M_ID = B.M_ID
WHERE A.M_ID = 'qwer';



SELECT * FROM TP3_FRIEND 
WHERE M_ID='qwer' AND F_ACCEPT>0 AND F_BLOCK=0;

SELECT F_ID FROM TP3_FRIEND
WHERE M_ID='qwer' AND F_ACCEPT=1 AND F_BLOCK=0 AND F_GROUP=1;


SELECT * FROM TP3_EVENT
	WHERE SUBSTR(E_WRITE_DATE, 1, 10)='16/10/07'
	AND M_ID='asd';

-- [ 그룹 ] --
SELECT * FROM TP3_MAKEGROUP; 

DROP TABLE TP3_MAKEGROUP;

CREATE TABLE TP3_MAKEGROUP(
g_seq NUMBER primary key,
g_name VARCHAR2(100) NOT NULL,
g_photo   VARCHAR2(1000),
g_type NUMBER(1) NOT NULL,
g_manager VARCHAR2(100) NOT NULL
);

DROP SEQUENCE TP3_GROUP_SEQ;

CREATE SEQUENCE TP3_GROUP_SEQ START WITH 1 INCREMENT BY 1;

DROP TABLE TP3_GROUPMEMBER;

CREATE TABLE TP3_GROUPMEMBER(
g_seq NUMBER NOT NULL,
m_id VARCHAR2(100) NOT NULL,
g_auth NUMBER(1) NOT NULL
);


DROP table TP3_GROUPJOIN;

CREATE TABLE TP3_GROUPJOIN(
J_SEQ NUMBER PRIMARY KEY,
G_SEQ NUMBER NOT NULL,
G_MANAGER VARCHAR2(100) NOT NULL,
M_ID VARCHAR2(100) NOT NULL,
G_ACCEPT NUMBER(1) NOT NULL,
R_DATE DATE
);

DROP SEQUENCE TP3_JOIN_REQ_SEQ;

CREATE SEQUENCE TP3_JOIN_REQ_SEQ
START WITH 1 INCREMENT BY 1;


DROP TABLE TP3_VOTE;

CREATE TABLE TP3_VOTE(
G_SEQ NUMBER NOT NULL,
N_VOTE_SEQ NUMBER PRIMARY KEY,
VOTE1 VARCHAR2(100) NULL,
VOTE2 VARCHAR2(100) NULL,
VOTE3 VARCHAR2(100) NULL,
VOTE4 VARCHAR2(100) NULL,
VOTE5 VARCHAR2(100) NULL,
VOTE6 VARCHAR2(100) NULL,
VOTE7 VARCHAR2(100) NULL,
VOTE8 VARCHAR2(100) NULL,
VOTE9 VARCHAR2(100) NULL,
VOTE10 VARCHAR2(100) NULL,
N_CONTENT VARCHAR2(4000),
M_ID VARCHAR2(20) NOT NULL,
S_DATE DATE NOT NULL,
M_DATE DATE NOT NULL
);
   

DROP SEQUENCE TP3_VOTE_SEQ;
   
CREATE SEQUENCE TP3_VOTE_SEQ
START WITH 1 INCREMENT BY 1;

DROP TABLE TP3_VOTELIST;

CREATE TABLE TP3_VOTELIST(
N_VOTE_SEQ NUMBER NOT NULL,
V_LIST VARCHAR2(100) NOT NULL,
V_COUNT NUMBER
);

DROP TABLE TP3_VOTER;

CREATE TABLE TP3_VOTER(
N_VOTE_SEQ NUMBER NOT NULL,
M_ID VARCHAR2(20) NOT NULL,
G_VOTE VARCHAR2(100) NULL
);


select * from TP3_member
