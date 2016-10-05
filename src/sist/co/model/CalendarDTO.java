package sist.co.model;

public class CalendarDTO {
	
	private String	m_id;
	private String	yyyymm;
	
	public CalendarDTO() {}

	public CalendarDTO(String m_id, String yyyymm) {
		this.m_id = m_id;
		this.yyyymm = yyyymm;
	}

	@Override
	public String toString() {
		return "CalendarDTO [m_id=" + m_id + ", yyyymm=" + yyyymm + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getYyyymm() {
		return yyyymm;
	}

	public void setYyyymm(String yyyymm) {
		this.yyyymm = yyyymm;
	}
}