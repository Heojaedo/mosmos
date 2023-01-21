package model;

public class Qna {

	private int uid;
	private String secret;
	private String userid;
	private int item_uid;
	private String item_category;
	private String item_name;
	private String subject;
	private String contents;
	private String name;
	private String signdate;
	private String signdate2;
	private int ref;
	private int fid;
	private String thread;
	private String review;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getItem_uid() {
		return item_uid;
	}
	public void setItem_uid(int item_uid) {
		this.item_uid = item_uid;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
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
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getThread() {
		return thread;
	}
	public void setThread(String thread) {
		this.thread = thread;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	@Override
	public String toString() {
		return "Qna [uid=" + uid + ", secret=" + secret + ", userid=" + userid + ", item_uid=" + item_uid
				+ ", item_category=" + item_category + ", item_name=" + item_name + ", subject=" + subject
				+ ", contents=" + contents + ", name=" + name + ", signdate=" + signdate + ", signdate2=" + signdate2
				+ ", ref=" + ref + ", fid=" + fid + ", thread=" + thread + ", review=" + review + "]";
	}
	
}
