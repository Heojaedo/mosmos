package model;

public class Cart {

	private int cart_uid;
	private String cart_session;
	private String userid;
	private int item_uid;
	private String item_name;
	private String item_option;
	private int item_num;
	private int price;
	private int total;
	private int delivery;
	private String order_status;
	private String file1_s; 
	
	public int getCart_uid() {
		return cart_uid;
	}
	public void setCart_uid(int cart_uid) {
		this.cart_uid = cart_uid;
	}
	public String getCart_session() {
		return cart_session;
	}
	public void setCart_session(String cart_session) {
		this.cart_session = cart_session;
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
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_option() {
		return item_option;
	}
	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getFile1_s() {
		return file1_s;
	}
	public void setFile1_s(String file1_s) {
		this.file1_s = file1_s;
	}
	
	@Override
	public String toString() {
		return "Cart [cart_uid=" + cart_uid + ", cart_session=" + cart_session + ", userid=" + userid + ", item_uid="
				+ item_uid + ", item_name=" + item_name + ", item_option=" + item_option + ", item_num=" + item_num
				+ ", price=" + price + ", total=" + total + ", delivery=" + delivery + ", order_status=" + order_status
				+ ", file1_s=" + file1_s + "]";
	}
	
}
