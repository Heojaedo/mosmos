package model;

public class Item {

	private int uid;
	private String category1;
	private String category2;
	private String gift;
	private String name;
	private String subname;
	private int price;
	private int delivery;
	private String file1;
	private String file1_s;
	
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
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getGift() {
		return gift;
	}
	public void setGift(String gift) {
		this.gift = gift;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile1_s() {
		return file1_s;
	}
	public void setFile1_s(String file1_s) {
		this.file1_s = file1_s;
	}
	
	@Override
	public String toString() {
		return "Item [uid=" + uid + ", category1=" + category1 + ", category2=" + category2 + ", gift=" + gift
				+ ", name=" + name + ", subname=" + subname + ", price=" + price + ", delivery=" + delivery + ", file1="
				+ file1 + ", file1_s=" + file1_s + "]";
	}
	
}
