package sist.co.model;

public class MemberDTO {

	private String m_id;
	private String m_name;
	private String m_nickname;
	private String m_password;
	private int m_p_number;
	private String m_r_date;//? date? string?
	private String m_birthday;//?date? string?
	private String m_profile;
	private String m_highschool;
	private String m_university;
	private String m_office;
	private String m_marriage;
	private String m_address;
	private int m_deactivation;
	private int m_ask;
	private String m_content;
	private String m_stopdate;//??date? string?
	
	public MemberDTO() {
		
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public int getM_p_number() {
		return m_p_number;
	}

	public void setM_p_number(int m_p_number) {
		this.m_p_number = m_p_number;
	}

	public String getM_r_date() {
		return m_r_date;
	}

	public void setM_r_date(String m_r_date) {
		this.m_r_date = m_r_date;
	}

	public String getM_birthday() {
		return m_birthday;
	}

	public void setM_birthday(String m_birthday) {
		this.m_birthday = m_birthday;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public String getM_highschool() {
		return m_highschool;
	}

	public void setM_highschool(String m_highschool) {
		this.m_highschool = m_highschool;
	}

	public String getM_university() {
		return m_university;
	}

	public void setM_university(String m_university) {
		this.m_university = m_university;
	}

	public String getM_office() {
		return m_office;
	}

	public void setM_office(String m_office) {
		this.m_office = m_office;
	}

	public String getM_marriage() {
		return m_marriage;
	}

	public void setM_marriage(String m_marriage) {
		this.m_marriage = m_marriage;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public int getM_deactivation() {
		return m_deactivation;
	}

	public void setM_deactivation(int m_deactivation) {
		this.m_deactivation = m_deactivation;
	}

	public int getM_ask() {
		return m_ask;
	}

	public void setM_ask(int m_ask) {
		this.m_ask = m_ask;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public String getM_stopdate() {
		return m_stopdate;
	}

	public void setM_stopdate(String m_stopdate) {
		this.m_stopdate = m_stopdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_nickname=" + m_nickname + ", m_password="
				+ m_password + ", m_p_number=" + m_p_number + ", m_r_date=" + m_r_date + ", m_birthday=" + m_birthday
				+ ", m_profile=" + m_profile + ", m_highschool=" + m_highschool + ", m_university=" + m_university
				+ ", m_office=" + m_office + ", m_marriage=" + m_marriage + ", m_address=" + m_address
				+ ", m_deactivation=" + m_deactivation + ", m_ask=" + m_ask + ", m_content=" + m_content
				+ ", m_stopdate=" + m_stopdate + "]";
	}
	
	
	
}
