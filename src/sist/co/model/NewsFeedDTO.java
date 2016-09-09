package sist.co.model;

import java.io.Serializable;

/* 
DROP TABLE TP3_NEWSFEED
CASCADE CONSTRAINT

CREATE TABLE TP3_NEWSFEED(
n_seq	NUMBER PRIMARY KEY,	
g_seq	NUMBER,
form_num	NUMBER(1),	
m_name	VARCHAR2(20)	NOT NULL,
n_content	VARCHAR2(4000)	NOT NULL,
n_tag_firend	VARCHAR2(1000),	
n_tag_where	VARCHAR2(20),	
n_tag_feel	NUMBER(1),	
n_show	NUMBER(1)	NOT NULL,
n_wdate	DATE	NOT NULL,
n_report	NUMBER(1),	
n_ref	NUMBER,
n_step	NUMBER,	
n_depth	NUMBER,
n_del	NUMBER(1),	
n_share	NUMBER(1),	
n_event_n_seq	NUMBER(1),	
n_vote_n_seq	NUMBER(1)	
)

CREATE n_seqUENCE TP3_NEWSFEED_n_seq
START WITH 1 INCREMENT BY 1
*/

public class NewsFeedDTO implements Serializable{
	
	private int n_seq;
	private String name;
	private String content;
	private String filename;
	private String tag_friend;
	private String tag_where;
	private String tag_feel;
	private int show;  //0-전체공개 / 1-친구만 / 2-나만보기
	private String regidate;
	
	public NewsFeedDTO() {}

	public NewsFeedDTO(int n_seq, String name, String content, String filename, String tag_friend, String tag_where,
			String tag_feel, int show, String regidate) {
		super();
		this.n_seq = n_seq;
		this.name = name;
		this.content = content;
		this.filename = filename;
		this.tag_friend = tag_friend;
		this.tag_where = tag_where;
		this.tag_feel = tag_feel;
		this.show = show;
		this.regidate = regidate;
	}

	public int getn_seq() {
		return n_seq;
	}

	public void setn_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getTag_friend() {
		return tag_friend;
	}

	public void setTag_friend(String tag_friend) {
		this.tag_friend = tag_friend;
	}

	public String getTag_where() {
		return tag_where;
	}

	public void setTag_where(String tag_where) {
		this.tag_where = tag_where;
	}

	public String getTag_feel() {
		return tag_feel;
	}

	public void setTag_feel(String tag_feel) {
		this.tag_feel = tag_feel;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	@Override
	public String toString() {
		return "SistPDSDTO [n_seq=" + n_seq + ", name=" + name + ", content=" + content + ", filename=" + filename
				+ ", tag_friend=" + tag_friend + ", tag_where=" + tag_where + ", tag_feel=" + tag_feel + ", show="
				+ show + ", regidate=" + regidate + "]";
	}

	

	
	

}







