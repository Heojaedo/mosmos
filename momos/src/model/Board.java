package model;

public class Board {

	private int uid;
	private String category;
	private String notice;
	private String userid;
	private String subject;
	private String contents;
	private String name;
	private String signdate;
	private String signdate2;
	private int ref;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public String getSigndate2() {
		return signdate2;
	}
	public void setSigndate2(String signdate2) {
		this.signdate2 = signdate2;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	@Override
	public String toString() {
		return "Board [uid=" + uid + ", category=" + category + ", notice=" + notice + ", userid=" + userid
				+ ", subject=" + subject + ", contents=" + contents + ", name=" + name + ", signdate=" + signdate
				+ ", signdate2=" + signdate2 + ", ref=" + ref + "]";
	}
}
