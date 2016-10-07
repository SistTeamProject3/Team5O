
CREATE TABLE TP3_MAKEGROUP(
g_seq NUMBER primary key,
g_name VARCHAR2(100) NOT NULL,
g_photo	VARCHAR2(1000),
g_type NUMBER(1) NOT NULL,
g_manager VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE TP3_GROUP_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE TP3_GROUPMEMBER(
g_seq NUMBER NOT NULL,
m_id VARCHAR2(100) NOT NULL,
g_auth NUMBER(1) NOT NULL
);


CREATE TABLE TP3_GROUPJOIN(
J_SEQ NUMBER PRIMARY KEY,
G_SEQ NUMBER NOT NULL,
G_MANAGER VARCHAR2(100) NOT NULL,
M_ID VARCHAR2(100) NOT NULL,
G_ACCEPT NUMBER(1) NOT NULL,
R_DATE DATE
);

CREATE SEQUENCE TP3_JOIN_REQ_SEQ
START WITH 1 INCREMENT BY 1;

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
	
	
CREATE SEQUENCE TP3_VOTE_SEQ
START WITH 1 INCREMENT BY 1

CREATE TABLE TP3_VOTELIST(
N_VOTE_SEQ NUMBER NOT NULL,
V_LIST VARCHAR2(100) NOT NULL,
V_COUNT NUMBER
);

CREATE TABLE TP3_VOTER(
N_VOTE_SEQ NUMBER NOT NULL,
M_ID VARCHAR2(20) NOT NULL,
G_VOTE VARCHAR2(100) NULL
);


CREATE INDEX TP3_NEWSFEED_INDEX	
ON TP3_NEWSFEED (N_WDATE)


/////////////////////////



SELECT * FROM TP3_GROUPJOIN 

CREATE TABLE TP3_MAKEGROUP(
g_seq NUMBER primary key,
g_name VARCHAR2(100) NOT NULL,
g_photo	VARCHAR2(1000) NOT NULL,
g_type NUMBER(1) NOT NULL,
g_manager VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE TP3_GROUP_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE TP3_GROUPMEMBER(
g_seq NUMBER NOT NULL,
m_id VARCHAR2(100) NOT NULL,
g_auth NUMBER(1) NOT NULL,
g_sysdate date NOT NULL
);



CREATE TABLE TP3_GROUPJOIN(
J_SEQ NUMBER PRIMARY KEY,
G_SEQ NUMBER NOT NULL,
G_MANAGER VARCHAR2(100) NOT NULL,
M_ID VARCHAR2(100) NOT NULL,
G_ACCEPT NUMBER(1) NOT NULL,
R_DATE DATE
);

CREATE SEQUENCE TP3_JOIN_REQ_SEQ
START WITH 1 INCREMENT BY 1;

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
	
	
CREATE SEQUENCE TP3_VOTE_SEQ
START WITH 1 INCREMENT BY 1;

CREATE TABLE TP3_VOTELIST(
N_VOTE_SEQ NUMBER NOT NULL,
V_LIST VARCHAR2(100) NOT NULL,
V_COUNT NUMBER
);

CREATE TABLE TP3_VOTER(
N_VOTE_SEQ NUMBER NOT NULL,
M_ID VARCHAR2(20) NOT NULL,
G_VOTE VARCHAR2(100) NULL
);
