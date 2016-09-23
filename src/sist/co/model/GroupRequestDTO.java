package sist.co.model;

import java.util.Date;

public class GroupRequestDTO {

/*
CREATE TABLE TP3_GROUPJOIN(
J_SEQ NUMBER PRIMARY KEY,
G_SEQ NUMBER NOT NULL,
G_MANAGER VARCHAR2(100) NOT NULL,
M_ID VARCHAR2(100) NOT NULL,
G_ACCEPT NUMBER(1) NOT NULL
)

CREATE SEQUENCE TP3_JOIN_REQ_SEQ
START WITH 1 INCREMENT BY 1
*/
	private int j_seq;
	private int g_seq;
	private String g_manager;
	private String m_id;
	private int g_accept;
	private Date r_date;
	public GroupRequestDTO(){}


	@Override
	public String toString() {
		return "GroupRequestDTO [j_seq=" + j_seq + ", g_seq=" + g_seq + ", g_manager=" + g_manager + ", m_id=" + m_id
				+ ", g_accept=" + g_accept + ", r_date=" + r_date + "]";
	}


	public GroupRequestDTO(int j_seq, int g_seq, String g_manager, String m_id, int g_accept, Date r_date) {
		super();
		this.j_seq = j_seq;
		this.g_seq = g_seq;
		this.g_manager = g_manager;
		this.m_id = m_id;
		this.g_accept = g_accept;
		this.r_date = r_date;
	}


	public Date getR_date() {
		return r_date;
	}


	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}


	public int getJ_seq() {
		return j_seq;
	}

	public void setJ_seq(int j_seq) {
		this.j_seq = j_seq;
	}

	public int getG_seq() {
		return g_seq;
	}

	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}

	public String getG_manager() {
		return g_manager;
	}

	public void setG_manager(String g_manager) {
		this.g_manager = g_manager;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getG_accept() {
		return g_accept;
	}

	public void setG_accept(int g_accept) {
		this.g_accept = g_accept;
	}
	
	
	
}
