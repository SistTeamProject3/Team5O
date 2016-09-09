-- (0908수정할점)모든 DB명, seq 앞에 'TB3_' 붙히기

-- [1] member

DROP TABLE TP3_MEMBER
CASCADE CONSTRAINTS;

SELECT * FROM TP3_MEMBER;

CREATE TABLE TP3_MEMBER(
	M_ID VARCHAR2(64) PRIMARY KEY,
	M_NAME VARCHAR2(20) NOT NULL,
	M_NICKNAME VARCHAR2(20) NOT NULL,
	M_PASSWORD VARCHAR2(12) NOT NULL,
	M_PHONE VARCHAR2(11) NOT NULL,
	M_REGDATE DATE NOT NULL,
	M_BIRTHDAY VARCHAR2(8) NOT NULL,
	M_PROFILE VARCHAR2(1000),
	M_HIGHSCHOOL VARCHAR2(100),
	M_UNIVERSITY VARCHAR2(100),
	M_OFFICE VARCHAR2(100),
	M_MARRIAGE NUMBER(1),
	M_ADDRESS VARCHAR2(100),
	M_DEACTIVATION NUMBER(1) NOT NULL,
	M_ASK NUMBER(1) NOT NULL,
	M_CONTENT VARCHAR2(100),
	M_STOPDATE VARCHAR2(8)
);


insert into TP3_MEMBER
values('qwer', 'qwer', 'qwer', 'qwer', '01012345678', sysdate, '881111',
'', '', '', '', 0, '서울시', 0, 0, 'qwer입니다', '');
insert into TP3_MEMBER
values('asdf', 'asdf', 'asdf', 'asdf', '01056471234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'asdf입니다', '');
insert into TP3_MEMBER
values('kwon', 'kwon', 'kwon', 'kwon', '01001001000', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kwon입니다', '');
insert into TP3_MEMBER
values('kim', 'kim', 'kim', 'kim', '01078945612', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'kim입니다', '');
insert into TP3_MEMBER
values('young', 'young', 'young', 'young', '01088885252', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'young입니다', '');
insert into TP3_MEMBER
values('Ahyo', 'Ahyo', 'Ahyo', 'Ahyo', '01012341234', sysdate, '111111',
'', '', '', '', 0, '서울시', 0,  0, 'Ahyo입니다', '');
insert into TP3_MEMBER
values('nanna', 'nanna', 'nanna', 'nanna', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'nanna입니다', '');
insert into TP3_MEMBER
values('imma', 'imma', 'imma', 'imma', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'imma입니다', '');
insert into TP3_MEMBER
values('yonyon', 'yonyon', 'yonyon', 'yonyon', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'yonyon입니다', '');
insert into TP3_MEMBER
values('asktest1', 'asktest1', 'asktest1', 'asktest1', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest1입니다', '');
insert into TP3_MEMBER
values('asktest2', 'asktest2', 'asktest2', 'asktest2', '01012341234', sysdate, '111111',
'', '', '', '', 0, '경기도', 0,  0, 'asktest2입니다', '');



update TP3_MEMBER set m_profile='1473138776001.jpg'
where m_id='imma';
update TP3_MEMBER set m_profile='IMG_3454.JPG'
where m_id='yonyon';
update TP3_MEMBER set m_profile='1.jpg'
where m_id='asktest1';
update TP3_MEMBER set m_profile='2.jpg'
where m_id='asktest2';
update TP3_MEMBER set m_profile='3.jpg'
where m_id='Ahyo';
update TP3_MEMBER set m_profile='4.jpg'
where m_id='young';


-- [2] friend

DROP TABLE TP3_FRIEND
CASCADE CONSTRAINT;

DROP SEQUENCE TP3_FRIEND_SEQ;

SELECT * FROM TP3_FRIEND;

CREATE TABLE TP3_FRIEND(
	F_SEQ NUMBER PRIMARY KEY,
	M_ID VARCHAR2(20) NOT NULL,
	F_ID VARCHAR2(20) NOT NULL,
	F_ACCEPT NUMBER(1) NOT NULL,
	F_GROUP NUMBER(1) NOT NULL,
	F_BLOCK NUMBER(1) NOT NULL
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

update FRIEND set f_block=1 where m_id='qwer' and f_id='kwon';
update FRIEND set f_block=1 where m_id='qwer' and f_id='Ahyo';

SELECT COUNT(*) FROM TP3_FRIEND
 	WHERE M_ID='qwer'

SELECT * FROM TP3_FRIEND 
 	WHERE M_ID='qwer' AND F_ACCEPT>0 AND F_BLOCK=0
update TP3_FRIEND_SEQ set f_accept=2
where TP3_FRIEND_SEQ=4
update TP3_FRIEND_SEQ SET F_GROUP=0 WHERE M_ID='qwer' AND F_ID='asdf'
