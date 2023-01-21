package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import model.CartItem;
import model.Item;
import model.Member;
import model.Order;

public class AdminDao {

	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//상품관리 상품 갯수
	public int adminItemCount(String field,String search,String category) {
		d.getCon();
		
		int num = 0;

		try {
			String sql = "";
			
			if(category.equals("")) { //전체
				if(search != null && !search.equals("")) { //전체-검색
					sql = "select count(*) from item where "+field+" like '%"+search+"%'";
				} else { 
					sql = "select count(*) from item";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else if(category.equals("giftset")) { //선물세트
				if(search != null && !search.equals("")) { //카테고리-검색
					sql = "select count(*) from item where gift='on' "+field+" like '%"+search+"%'";
				} else { 
					sql = "select count(*) from item where gift='on'";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} else {
				if(search != null && !search.equals("")) { 
					sql = "select count(*) from item where category1=? "+field+" like '%"+search+"%'";
				} else { 
					sql = "select count(*) from item where category1=?";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
			}
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//상품관리 상품 출력
	public ArrayList<Item> adminItemList(int startRow,int endRow,String field,String search,String category) {
		d.getCon();

		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "";
			
			if(category.equals("")) { //전체
				if(search != null && !search.equals("")) { //검색
					sql = "select * from item where "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				} else {
					sql = "select * from item order by uid desc limit ?,?";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
			} else if(category.equals("giftset")) { //선물세트
				if(search != null && !search.equals("")) { //카테고리-검색
					sql = "select * from item where gift='on' and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				} else { 
					sql = "select * from item where gift='on' order by uid desc limit ?,?";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
			} else { //카테고리
				if(search != null && !search.equals("")) { //검색
					sql = "select * from item where category1=? and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				} else {
					sql = "select * from item where category1=? order by uid desc limit ?,?";
				}
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
			}
			

			
			while(rs.next()) {
				Item i = new Item();
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setCategory2(rs.getString("category2"));
				i.setGift(rs.getString("gift"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setDelivery(rs.getInt("delivery"));
				i.setFile1_s(rs.getString("file1_s"));
				
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품관리 - 상품삭제
	public void itemDelete(String item_uid) {
		d.getCon();
		
		try {
			String sql = "delete from item where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, item_uid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품관리 - 수정페이지
	public Item itemInfo(String item_uid) {
		d.getCon();
		
		Item i = new Item();
		
		try {
			String sql = "select * from item where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setCategory2(rs.getString("category2"));
				i.setGift(rs.getString("gift"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setDelivery(rs.getInt("delivery"));
				i.setFile1(rs.getString("file1"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	//상품관리 - 수정
	public void itemModify(Item i,String item_uid) {
		d.getCon();
		
		try {
			String sql = "update item set category1=?,category2=?,gift=?,name=?,subname=?,price=?,delivery=?,file1=?,file1_s=? where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, i.getCategory1());
			pstmt.setString(2, i.getCategory2());
			pstmt.setString(3, i.getGift());
			pstmt.setString(4, i.getName());
			pstmt.setString(5, i.getSubname());
			pstmt.setInt(6, i.getPrice());
			pstmt.setInt(7, i.getDelivery());
			pstmt.setString(8, i.getFile1());
			pstmt.setString(9, i.getFile1_s());
			pstmt.setString(10, item_uid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원 수
	public int adminMemberCount(String field,String search) {
		d.getCon();
		
		int num = 0;
		
		String sql = "";
		
		try {
			if(search != null && !search.equals("")) { //전체-검색
				sql = "select count(*) from user where "+field+" like '%"+search+"%'";
			} else { 
				sql = "select count(*) from user";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//회원 리스트
	public ArrayList<Member> adminMemberList(int startRow,int endRow,String field,String search) {
		d.getCon();

		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			String sql = "";
			
			if(search != null && !search.equals("")) { //검색
				sql = "select * from user where "+field+" like '%"+search+"%' order by name asc limit ?,?";
			} else {
				sql = "select * from user order by name asc limit ?,?";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				m.setUserid(rs.getString("userid"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				m.setEmail_re(rs.getString("email_re"));
				m.setLevel(rs.getString("level"));
				
				list.add(m);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//주문 관리 수
	public int adminorderCount(String field,String search) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "";
			
			if(search != null && !search.equals("")) { //검색
				sql = "select count(*) from order_info where "+field+" like '%"+search+"%'";
			} else {
				sql = "select count(*) from order_info";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//주문 관리
	public ArrayList<Order> orderList(String field,String search,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Order> list = new ArrayList<Order>();
		
		try {
			String sql = "";
			
			if(search != null && !search.equals("")) { //검색
				sql = "select * from order_info where "+field+" like '%"+search+"%' order by or_uid desc limit ?,?";
			} else {
				sql = "select * from order_info order by or_uid desc limit ?,?";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Order o = new Order();
				o.setOr_uid(rs.getInt("or_uid"));
				o.setOr_cart_session(rs.getString("or_cart_session"));
				o.setDate(rs.getString("date"));
				o.setUserid(rs.getString("userid"));
				o.setOr_name(rs.getString("or_name"));
				o.setOr_zipcode(rs.getString("or_zipcode"));
				o.setOr_address(rs.getString("or_address"));
				o.setOr_detailaddr(rs.getString("or_detailaddr"));
				o.setOr_phone1(rs.getString("or_phone1"));
				o.setOr_phone2(rs.getString("or_phone2"));
				o.setOr_phone3(rs.getString("or_phone3"));
				o.setRe_name(rs.getString("re_name"));
				o.setRe_zipcode(rs.getString("re_zipcode"));
				o.setRe_address(rs.getString("re_address"));
				o.setRe_detailaddr(rs.getString("re_detailaddr"));
				o.setRe_phone1(rs.getString("re_phone1"));
				o.setRe_phone2(rs.getString("re_phone2"));
				o.setRe_phone3(rs.getString("re_phone3"));
				o.setShippingmsg(rs.getString("shippingmsg"));
				o.setPay_method(rs.getString("pay_method"));
				o.setPay_name(rs.getString("pay_name"));
				o.setPay_bank(rs.getString("pay_bank"));
				o.setCash_receipt(rs.getString("cash_receipt"));
				o.setTax_request(rs.getString("tax_request"));
				o.setPurchase_agreement(rs.getString("purchase_agreement"));
				o.setOrder_status(rs.getString("or_status"));
				
				list.add(o);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//주문 상세 페이지
	public Order adminorderView(int uid) {
		d.getCon();
		
		Order o = new Order();
		
		try {
			String sql = "select * from order_info where or_uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				o.setOr_cart_session(rs.getString("or_cart_session"));
				o.setOr_uid(rs.getInt("or_uid"));
				o.setDate(rs.getString("date"));
				o.setOr_name(rs.getString("or_name"));
				/* o.setOrder_status(rs.getString("order_status")); */
				/* o.setTotal(rs.getInt("total")); */
				o.setPay_method(rs.getString("pay_method"));
				o.setPay_name(rs.getString("pay_name"));
				o.setRe_name(rs.getString("re_name"));
				o.setRe_zipcode(rs.getString("re_zipcode"));
				o.setRe_address(rs.getString("re_address"));
				o.setRe_detailaddr(rs.getString("re_detailaddr"));
				o.setRe_phone1(rs.getString("re_phone1"));
				o.setRe_phone2(rs.getString("re_phone2"));
				o.setRe_phone3(rs.getString("re_phone3"));
				o.setShippingmsg(rs.getString("shippingmsg"));
				o.setPay_bank(rs.getString("pay_bank"));
				o.setOr_status(rs.getString("or_status"));
				
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
		
	//주문 상세 페이지 상품 리스트
	
	//주문 상세 페이지 상품 리스트
	public List<CartItem> adminorderItemList(int uid) {
		d.getCon();
		
		List<CartItem> list = new LinkedList<CartItem>();
		
		try {
			String sql = "select * from cart left join order_info on cart_session = or_cart_session where or_uid=? and order_status not in('장바구니','주문')";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setInt(1, uid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartItem c = new CartItem();
				
				c.setFile1_s(rs.getString("file1_s"));
				c.setItem_name(rs.getString("item_name"));
				c.setItem_option(rs.getString("item_option"));
				c.setItem_num(rs.getInt("item_num"));
				c.setPrice(rs.getInt("price"));
				c.setTotal(rs.getInt("total"));
				c.setOrder_status(rs.getString("order_status"));
				c.setCart_uid(rs.getInt("cart_uid"));
				
				list.add(c);
				
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//주문 상세 페이지 수정
	public Order adminorderModify(String cart_session) {
		d.getCon();
		
		Order o = new Order();
		
		try {
			String sql = "select * from cart left join order_info on cart_session = or_cart_session where cart_session=? and order_status not in('장바구니','주문')";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, cart_session);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				o.setOr_cart_session(rs.getString("or_cart_session"));
				o.setDate(rs.getString("date"));
				o.setOr_name(rs.getString("or_name"));
				o.setPay_bank(rs.getString("pay_bank"));
				o.setOrder_status(rs.getString("order_status"));
				o.setRe_name(rs.getString("re_name"));
				o.setRe_zipcode(rs.getString("re_zipcode"));
				o.setRe_address(rs.getString("re_address"));
				o.setRe_detailaddr(rs.getString("re_detailaddr"));
				o.setRe_phone1(rs.getString("re_phone1"));
				o.setRe_phone2(rs.getString("re_phone2"));
				o.setRe_phone3(rs.getString("re_phone3"));
				o.setShippingmsg(rs.getString("shippingmsg"));
				o.setPay_method(rs.getString("pay_method"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	
	//주문 상세 페이지 상품 리스트 (카트 세션)
	public List<CartItem> adminordermodifyItemList(String cart_session) {
		d.getCon();
		
		List<CartItem> list = new LinkedList<CartItem>();
		
		try {
			String sql = "select * from cart left join order_info on cart_session = or_cart_session where cart_session=? and order_status not in('장바구니','주문')";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_session);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartItem c = new CartItem();
				
				c.setFile1_s(rs.getString("file1_s"));
				c.setItem_name(rs.getString("item_name"));
				c.setItem_option(rs.getString("item_option"));
				c.setItem_num(rs.getInt("item_num"));
				c.setPrice(rs.getInt("price"));
				c.setTotal(rs.getInt("total"));
				c.setOrder_status(rs.getString("order_status"));
				c.setCart_uid(rs.getInt("cart_uid"));
				
				list.add(c);
				
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//주문 처리 변경 - 카트 테이블
	public void adminorderModifyInsert1(Order o) {
		d.getCon();

		try {
			String sql = "update cart set order_status=? where cart_session=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, o.getOrder_status());
			pstmt.setString(2, o.getOr_cart_session());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//주문 처리 변경 - 오더 테이블
	public void adminorderModifyInsert2(Order o) {
		d.getCon();
		
		try {
			String sql = "update order_info set re_name=?,re_zipcode=?,re_address=?,re_detailaddr=?,re_phone1=?,re_phone2=?,re_phone3=?,shippingmsg=?,or_status=? where or_cart_session=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, o.getRe_name());
			pstmt.setString(2, o.getRe_zipcode());
			pstmt.setString(3, o.getRe_address());
			pstmt.setString(4, o.getRe_detailaddr());
			pstmt.setString(5, o.getRe_phone1());
			pstmt.setString(6, o.getRe_phone2());
			pstmt.setString(7, o.getRe_phone3());
			pstmt.setString(8, o.getShippingmsg());
			pstmt.setString(9, o.getOr_status());
			pstmt.setString(10, o.getOr_cart_session());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}






















