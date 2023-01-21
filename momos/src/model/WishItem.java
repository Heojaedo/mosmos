package model;

public class WishItem {
	
	private int wi_uid;
	private String file1_s;
	private String name;
	private String price;
	private String delivery;	
	private String category1;
	private int uid;
	
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public int getWi_uid() {
		return wi_uid;
	}
	public void setWi_uid(int wi_uid) {
		this.wi_uid = wi_uid;
	}
	public String getFile1_s() {
		return file1_s;
	}
	public void setFile1_s(String file1_s) {
		this.file1_s = file1_s;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	@Override
	public String toString() {
		return "WishItem [wi_uid=" + wi_uid + ", file1_s=" + file1_s + ", name=" + name + ", price=" + price
				+ ", delivery=" + delivery + ", category1=" + category1 + ", uid=" + uid + ", getUid()=" + getUid()
				+ ", getCategory1()=" + getCategory1() + ", getWi_uid()=" + getWi_uid() + ", getFile1_s()="
				+ getFile1_s() + ", getName()=" + getName() + ", getPrice()=" + getPrice() + ", getDelivery()="
				+ getDelivery() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

}
