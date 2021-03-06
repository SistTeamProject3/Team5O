package sist.co.model;

import java.io.Serializable;

/* 
DROP TABLE TP3_NEWSFEED
CASCADE CONSTRAINT

CREATE TABLE TP3_NEWSFEED(
N_SEQ   NUMBER PRIMARY KEY,   
G_SEQ   NUMBER,
FROM_NUM   NUMBER(1),   
M_ID   VARCHAR2(20)   NOT NULL,
N_CONTENT   VARCHAR2(4000)   NOT NULL,
N_TAG_FRIEND   VARCHAR2(1000),   
N_TAG_WHERE   VARCHAR2(20),   
N_TAG_FEEL   NUMBER(1),   
N_SHOW   NUMBER(1)   NOT NULL,
N_WDATE   DATE   NOT NULL,
N_REPORT   NUMBER(1),   
N_REF   NUMBER,
N_STEP   NUMBER,   
N_DEPTH   NUMBER,
N_DEL   NUMBER(1),   
N_SHARE   NUMBER(1),   
N_EVENT_SEQ   NUMBER(1),   
N_VOTE_SEQ   NUMBER(1)   
)

CREATE SEQUENCE TP3_NEWSFEED_SEQ
START WITH 1 INCREMENT BY 1

*/

public class NewsFeedDTO implements Serializable{

	private int n_seq;
	private int g_seq;
	private int n_form_num;
	private String m_id;
	private String n_content;
	private String n_tag_friend;
	private String n_tag_where;
	private String n_tag_feel;// 1-기뻐요/2-슬퍼요/3-피곤해요
	private int n_show; // 1-전체공개 / 2-친구만 / 3-나만보기
	private String n_wdate;
	private int n_report;
	private int n_ref;
	private int n_step;
	private int n_depth;
	private int n_parent;
	private int n_del;
	private int n_share;
	private int n_event_seq;
	private int n_vote_seq;

	private String filename;
	private int n_likecount;

	private String e_start_date;
	private String e_title;

	public NewsFeedDTO() {}

public NewsFeedDTO(int n_seq, int g_seq, int n_form_num, String m_id, String n_content, String n_tag_friend,
		String n_tag_where, String n_tag_feel, int n_show, String n_wdate, int n_report, int n_ref, int n_step,
		int n_depth, int n_parent, int n_del, int n_share, int n_event_seq, int n_vote_seq, String filename,
		int n_likecount, String e_start_date, String e_title) {
	
	this.n_seq = n_seq;
	this.g_seq = g_seq;
	this.n_form_num = n_form_num;
	this.m_id = m_id;
	this.n_content = n_content;
	this.n_tag_friend = n_tag_friend;
	this.n_tag_where = n_tag_where;
	this.n_tag_feel = n_tag_feel;
	this.n_show = n_show;
	this.n_wdate = n_wdate;
	this.n_report = n_report;
	this.n_ref = n_ref;
	this.n_step = n_step;
	this.n_depth = n_depth;
	this.n_parent = n_parent;
	this.n_del = n_del;
	this.n_share = n_share;
	this.n_event_seq = n_event_seq;
	this.n_vote_seq = n_vote_seq;
	this.filename = filename;
	this.n_likecount = n_likecount;
	this.e_start_date = e_start_date;
	this.e_title = e_title;
}

public int getN_seq() {
	return n_seq;
}

public void setN_seq(int n_seq) {
	this.n_seq = n_seq;
}

public int getG_seq() {
	return g_seq;
}

public void setG_seq(int g_seq) {
	this.g_seq = g_seq;
}

public int getN_form_num() {
	return n_form_num;
}

public void setN_form_num(int n_form_num) {
	this.n_form_num = n_form_num;
}

public String getM_id() {
	return m_id;
}

public void setM_id(String m_id) {
	this.m_id = m_id;
}

public String getN_content() {
	return n_content;
}

public void setN_content(String n_content) {
	this.n_content = n_content;
}

public String getN_tag_friend() {
	return n_tag_friend;
}

public void setN_tag_friend(String n_tag_friend) {
	this.n_tag_friend = n_tag_friend;
}

public String getN_tag_where() {
	return n_tag_where;
}

public void setN_tag_where(String n_tag_where) {
	this.n_tag_where = n_tag_where;
}

public String getN_tag_feel() {
	return n_tag_feel;
}

public void setN_tag_feel(String n_tag_feel) {
	this.n_tag_feel = n_tag_feel;
}

public int getN_show() {
	return n_show;
}

public void setN_show(int n_show) {
	this.n_show = n_show;
}

public String getN_wdate() {
	return n_wdate;
}

public void setN_wdate(String n_wdate) {
	this.n_wdate = n_wdate;
}

public int getN_report() {
	return n_report;
}

public void setN_report(int n_report) {
	this.n_report = n_report;
}

public int getN_ref() {
	return n_ref;
}

public void setN_ref(int n_ref) {
	this.n_ref = n_ref;
}

public int getN_step() {
	return n_step;
}

public void setN_step(int n_step) {
	this.n_step = n_step;
}

public int getN_depth() {
	return n_depth;
}

public void setN_depth(int n_depth) {
	this.n_depth = n_depth;
}

public int getN_parent() {
	return n_parent;
}

public void setN_parent(int n_parent) {
	this.n_parent = n_parent;
}

public int getN_del() {
	return n_del;
}

public void setN_del(int n_del) {
	this.n_del = n_del;
}

public int getN_share() {
	return n_share;
}

public void setN_share(int n_share) {
	this.n_share = n_share;
}

public int getN_event_seq() {
	return n_event_seq;
}

public void setN_event_seq(int n_event_seq) {
	this.n_event_seq = n_event_seq;
}

public int getN_vote_seq() {
	return n_vote_seq;
}

public void setN_vote_seq(int n_vote_seq) {
	this.n_vote_seq = n_vote_seq;
}

public String getFilename() {
	return filename;
}

public void setFilename(String filename) {
	this.filename = filename;
}

public int getN_likecount() {
	return n_likecount;
}

public void setN_likecount(int n_likecount) {
	this.n_likecount = n_likecount;
}

public String getE_start_date() {
	return e_start_date;
}

public void setE_start_date(String e_start_date) {
	this.e_start_date = e_start_date;
}

public String getE_title() {
	return e_title;
}

public void setE_title(String e_title) {
	this.e_title = e_title;
}

@Override
public String toString() {
	return "NewsFeedDTO [n_seq=" + n_seq + ", g_seq=" + g_seq + ", n_form_num=" + n_form_num + ", m_id=" + m_id
			+ ", n_content=" + n_content + ", n_tag_friend=" + n_tag_friend + ", n_tag_where=" + n_tag_where
			+ ", n_tag_feel=" + n_tag_feel + ", n_show=" + n_show + ", n_wdate=" + n_wdate + ", n_report=" + n_report
			+ ", n_ref=" + n_ref + ", n_step=" + n_step + ", n_depth=" + n_depth + ", n_parent=" + n_parent + ", n_del="
			+ n_del + ", n_share=" + n_share + ", n_event_seq=" + n_event_seq + ", n_vote_seq=" + n_vote_seq
			+ ", filename=" + filename + ", n_likecount=" + n_likecount + ", e_start_date=" + e_start_date
			+ ", e_title=" + e_title + "]";
}




}






