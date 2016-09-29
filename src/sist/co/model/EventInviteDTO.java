package sist.co.model;

import java.io.Serializable;
import java.util.List;

public class EventInviteDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int		e_seq;
	private String	m_id;
	
	public EventInviteDTO() {}

	public EventInviteDTO(int e_seq, String m_id) {
		this.e_seq = e_seq;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "EventInviteDTO [e_seq=" + e_seq + ", m_id=" + m_id + "]";
	}

	public int getE_seq() {
		return e_seq;
	}

	public void setE_seq(int e_seq) {
		this.e_seq = e_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	/*private int eventSeq;
	private List<String> memberList;
	
	

	public EventInviteDTO(int eventSeq, List<String> memberList) {
		this.eventSeq = eventSeq;
		this.memberList = memberList;
	}

	@Override
	public String toString() {
		return "EventInviteDTO [eventSeq=" + eventSeq + ", memberList=" + memberList + "]";
	}

	public int getEventSeq() {
		return eventSeq;
	}

	public void setEventSeq(int eventSeq) {
		this.eventSeq = eventSeq;
	}

	public List<String> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<String> memberList) {
		this.memberList = memberList;
	}
	*/
}