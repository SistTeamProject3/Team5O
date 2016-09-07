CREATE TABLE table_name(
column1 DATE_TYPE1 PRIMARY KEY,
column2 DATE_TYPE2,
column3 DATE_TYPE3,
column4 DATE_TYPE4
)

CREATE TABLE TP_SISTMEMBER(
m_id VARCHAR2(64) PRIMARY KEY,	
m_name VARCHAR2(20) NOT NULL,
m_nickname VARCHAR2(20) NOT NULL,
m_password VARCHAR2(12) NOT NULL,
m_phone VARCHAR2(11) NOT NULL,
m_regdate DATE NOT NULL,
m_birthday VARCHAR2(8) NOT NULL,
m_profile VARCHAR2(1000),
m_highschool VARCHAR2(100),
m_university VARCHAR2(100),
m_office VARCHAR2(100),
m_marriage NUMBER(1),
m_address VARCHAR2(100),
m_deactivation NUMBER(1) NOT NULL,
m_ask NUMBER(1) NOT NULL,
m_content VARCHAR2(100),
m_stopdate VARCHAR2(8)
);
		INSERT INTO TP_SISTMEMBER(m_id, m_name, m_nickname, m_password, m_phone,m_regdate,m_birthday,m_profile
		,m_highschool,m_university,m_office,m_marriage,m_address,m_deactivation,m_ask,m_content,m_stopdate)
		VALUES('', #{m_name}, #{m_nickname}, #{m_password},#{m_phone}, SYSDATE,
		 #{m_birthday}, #{m_profile},#{m_highschool}, #{m_university}, #{m_office}, #{m_marriage},
		 #{m_address}, #{m_deactivation}, #{m_ask},#{m_content}, #{m_stopdate})	

select * from TP_SISTMEMBER
