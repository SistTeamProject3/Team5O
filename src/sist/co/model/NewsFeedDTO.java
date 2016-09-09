package sist.co.model;

import java.io.Serializable;

/* 
DROP TABLE TP3_NEWSFEED
CASCADE CONSTRAINT

CREATE TABLE TP3_NEWSFEED(
N_SEQ	NUMBER PRIMARY KEY,	
G_SEQ	NUMBER,
FROM_NUM	NUMBER(1),	
M_ID	VARCHAR2(20)	NOT NULL,
N_CONTENT	VARCHAR2(4000)	NOT NULL,
N_TAG_FRIEND	VARCHAR2(1000),	
N_TAG_WHERE	VARCHAR2(20),	
N_TAG_FEEL	NUMBER(1),	
N_SHOW	NUMBER(1)	NOT NULL,
N_WDATE	DATE	NOT NULL,
N_REPORT	NUMBER(1),	
N_REF	NUMBER,
N_STEP	NUMBER,	
N_DEPTH	NUMBER,
N_DEL	NUMBER(1),	
N_SHARE	NUMBER(1),	
N_EVENT_SEQ	NUMBER(1),	
N_VOTE_SEQ	NUMBER(1)	
)

CREATE SEQUENCE TP3_NEWSFEED_SEQ
START WITH 1 INCREMENT BY 1

*/

public class NewsFeedDTO implements Serializable{
	
	private int n_seq;
	private String id;
	private String content;
	private String filename;
	private String tag_friend;
	private String tag_where;
	private String tag_feel;//1-기뻐요/2-슬퍼요/3-피곤해요
	private int show;  //1-전체공개 / 2-친구만 / 3-나만보기
	private String regidate;
	
	public NewsFeedDTO() {}

	public NewsFeedDTO(int n_seq, String id, String content, String filename, String tag_friend, String tag_where,
			String tag_feel, int show, String regidate) {
		super();
		this.n_seq = n_seq;
		this.id = id;
		this.content = content;
		this.filename = filename;
		this.tag_friend = tag_friend;
		this.tag_where = tag_where;
		this.tag_feel = tag_feel;
		this.show = show;
		this.regidate = regidate;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return "NewsFeedDTO [n_seq=" + n_seq + ", id=" + id + ", content=" + content + ", filename=" + filename
				+ ", tag_friend=" + tag_friend + ", tag_where=" + tag_where + ", tag_feel=" + tag_feel + ", show="
				+ show + ", regidate=" + regidate + "]";
	}

}







