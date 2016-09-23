SELECT * FROM TP3_MAKEGROUP
SELECT * FROM TP3_GROUPMEMBER

CREATE TABLE TP3_GROUPMEMBER(
g_seq NUMBER NOT NULL,
m_id VARCHAR2(100) NOT NULL,
g_auth NUMBER(1) NOT NULL
);
	
CREATE SEQUENCE TP3_NEWSFEED_SEQ
START WITH 1 INCREMENT BY 1

CREATE TABLE TP3_MAKEGROUP(
g_seq NUMBER primary key,
g_name VARCHAR2(100) NOT NULL,
g_photo	VARCHAR2(1000) NOT NULL,
g_type NUMBER(1) NOT NULL,
g_manager VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE TP3_GROUP_SEQ START WITH 1 INCREMENT BY 1;
