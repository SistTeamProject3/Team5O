package sist.co.model;

import java.io.Serializable;

public class VoterDTO implements Serializable{
	/*
		CREATE TABLE TP3_VOTER(
		N_VOTE_SEQ NUMBER NOT NULL,
		M_ID VARCHAR2(20) NOT NULL
		)
	 */

	public VoterDTO() {
	}

	private int n_vote_seq;
	private String m_id;

	public VoterDTO(int n_vote_seq, String m_id) {
		super();
		this.n_vote_seq = n_vote_seq;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "VoterDTO [n_vote_seq=" + n_vote_seq + ", m_id=" + m_id + "]";
	}

	public int getN_vote_seq() {
		return n_vote_seq;
	}

	public void setN_vote_seq(int n_vote_seq) {
		this.n_vote_seq = n_vote_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

}
