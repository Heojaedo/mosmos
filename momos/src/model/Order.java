package model;

public class Order {
	private int cart_uid;
	private int or_uid;
	private int item_uid;
	private String category1;
	private String or_cart_session;
	private String date;
	private String file1_s;
	private String item_name;
	private String item_option;
	private int item_num;
	private int total;
	private String order_status;
	private String userid;
	private String or_name;
	private String or_zipcode;
	private String or_address;
	private String or_detailaddr;
	private String or_phone1;
	private String or_phone2;
	private String or_phone3;
	private String or_email;
	private String re_name;
	private String re_zipcode;
	private String re_address;
	private String re_detailaddr;
	private String re_phone1;
	private String re_phone2;
	private String re_phone3;
	private String shippingmsg;
	private String pay_method;
	private String pay_name;
	private String pay_bank;
	private String cash_receipt;
	private String tax_request;
	private String purchase_agreement;
	private int payprice;
	private String or_status;
	
	
	
	
	
	public String getOr_status() {
		return or_status;
	}
	public void setOr_status(String or_status) {
		this.or_status = or_status;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public int getCart_uid() {
		return cart_uid;
	}
	public void setCart_uid(int cart_uid) {
		this.cart_uid = cart_uid;
	}
	public int getOr_uid() {
		return or_uid;
	}
	public void setOr_uid(int or_uid) {
		this.or_uid = or_uid;
	}
	public int getItem_uid() {
		return item_uid;
	}
	public void setItem_uid(int item_uid) {
		this.item_uid = item_uid;
	}
	public String getOr_cart_session() {
		return or_cart_session;
	}
	public void setOr_cart_session(String or_cart_session) {
		this.or_cart_session = or_cart_session;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFile1_s() {
		return file1_s;
	}
	public void setFile1_s(String file1_s) {
		this.file1_s = file1_s;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOr_name() {
		return or_name;
	}
	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}
	public String getOr_zipcode() {
		return or_zipcode;
	}
	public void setOr_zipcode(String or_zipcode) {
		this.or_zipcode = or_zipcode;
	}
	public String getOr_address() {
		return or_address;
	}
	public void setOr_address(String or_address) {
		this.or_address = or_address;
	}
	public String getOr_detailaddr() {
		return or_detailaddr;
	}
	public void setOr_detailaddr(String or_detailaddr) {
		this.or_detailaddr = or_detailaddr;
	}
	public String getOr_phone1() {
		return or_phone1;
	}
	public void setOr_phone1(String or_phone1) {
		this.or_phone1 = or_phone1;
	}
	public String getOr_phone2() {
		return or_phone2;
	}
	public void setOr_phone2(String or_phone2) {
		this.or_phone2 = or_phone2;
	}
	public String getOr_phone3() {
		return or_phone3;
	}
	public void setOr_phone3(String or_phone3) {
		this.or_phone3 = or_phone3;
	}
	public String getOr_email() {
		return or_email;
	}
	public void setOr_email(String or_email) {
		this.or_email = or_email;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_zipcode() {
		return re_zipcode;
	}
	public void setRe_zipcode(String re_zipcode) {
		this.re_zipcode = re_zipcode;
	}
	public String getRe_address() {
		return re_address;
	}
	public void setRe_address(String re_address) {
		this.re_address = re_address;
	}
	public String getRe_detailaddr() {
		return re_detailaddr;
	}
	public void setRe_detailaddr(String re_detailaddr) {
		this.re_detailaddr = re_detailaddr;
	}
	public String getRe_phone1() {
		return re_phone1;
	}
	public void setRe_phone1(String re_phone1) {
		this.re_phone1 = re_phone1;
	}
	public String getRe_phone2() {
		return re_phone2;
	}
	public void setRe_phone2(String re_phone2) {
		this.re_phone2 = re_phone2;
	}
	public String getRe_phone3() {
		return re_phone3;
	}
	public void setRe_phone3(String re_phone3) {
		this.re_phone3 = re_phone3;
	}
	public String getShippingmsg() {
		return shippingmsg;
	}
	public void setShippingmsg(String shippingmsg) {
		this.shippingmsg = shippingmsg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getPay_bank() {
		return pay_bank;
	}
	public void setPay_bank(String pay_bank) {
		this.pay_bank = pay_bank;
	}
	public String getCash_receipt() {
		return cash_receipt;
	}
	public void setCash_receipt(String cash_receipt) {
		this.cash_receipt = cash_receipt;
	}
	public String getTax_request() {
		return tax_request;
	}
	public void setTax_request(String tax_request) {
		this.tax_request = tax_request;
	}
	public String getPurchase_agreement() {
		return purchase_agreement;
	}
	public void setPurchase_agreement(String purchase_agreement) {
		this.purchase_agreement = purchase_agreement;
	}	


}
