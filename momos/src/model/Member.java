package model;

public class Member {

	private String userid;
	private String password;
	private String name;
	private String zipcode;
	private String address;
	private String detailaddress;
	private String phone1;
	private String phone2;
	private String phone3;
	private String sms;
	private String email;
	private String email_re;
	private String level;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_re() {
		return email_re;
	}
	public void setEmail_re(String email_re) {
		this.email_re = email_re;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	@Override
	public String toString() {
		return "Member [userid=" + userid + ", password=" + password + ", name=" + name + ", zipcode=" + zipcode
				+ ", address=" + address + ", detailaddress=" + detailaddress + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + ", sms=" + sms + ", email=" + email + ", email_re=" + email_re
				+ ", level=" + level + "]";
	}
		
}
