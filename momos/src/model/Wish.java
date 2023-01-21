package model;

public class Wish {
	
	private String wi_uid;
	private String userid;
	private String item_uid;
	
	public String getWi_uid() {
		return wi_uid;
	}
	public void setWi_uid(String wi_uid) {
		this.wi_uid = wi_uid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}	
	public String getItem_uid() {
		return item_uid;
	}
	public void setItem_uid(String item_uid) {
		this.item_uid = item_uid;
	}
	
	@Override
	public String toString() {
		return "Wish [wi_uid=" + wi_uid + ", userid=" + userid + ", item_uid=" + item_uid
				+ "]";
	}
	
	
	
	
}
