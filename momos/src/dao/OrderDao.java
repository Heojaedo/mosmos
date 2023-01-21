package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import model.Cart;
import model.CartItem;
import model.Member;
import model.Order;

public class OrderDao {
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//장바구니 담기
	public void cartInsert(Cart c) {
		d.getCon();
		
		try {
			String sql = "insert into cart values (null,?,?,?,?,?,?,?,?,?,'장바구니',?)";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, c.getCart_session());
			pstmt.setString(2, c.getUserid());
			pstmt.setInt(3, c.getItem_uid());
			pstmt.setString(4, c.getItem_name());
			pstmt.setString(5, c.getItem_option());
			pstmt.setInt(6, c.getItem_num());
			pstmt.setInt(7, c.getPrice());
			pstmt.setInt(8, c.getTotal());
			pstmt.setInt(9, c.getDelivery());
			pstmt.setString(10, c.getFile1_s());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 리스트
	public List<CartItem> cartList(String session_cart){
		d.getCon();
		
		List<CartItem> list = new LinkedList<CartItem>();
		
		try {
			String sql = "select * from cart left join item on cart.item_uid = item.uid where cart_session=? and order_status='장바구니' ORDER BY cart_uid DESC"; 
			
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, session_cart);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartItem c = new CartItem();
				
				c.setCart_uid(rs.getInt("cart_uid"));
				c.setCart_session(rs.getString("cart_session"));
				c.setUserid(rs.getString("userid"));
				c.setItem_uid(rs.getInt("item_uid"));
				c.setFile1_s(rs.getString("file1_s"));
				c.setItem_name(rs.getString("item_name"));
				c.setItem_option(rs.getString("item_option"));
				c.setPrice(rs.getInt("price"));
				c.setItem_num(rs.getInt("item_num"));
				c.setDelivery(rs.getInt("delivery"));
				c.setTotal(rs.getInt("total"));
				c.setOrder_status(rs.getNString("order_status"));
				
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
	
	//장바구니 상품 수 
	public int getAllOrderList(String session_cart) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from cart where cart_session=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_cart);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	
	//장바구니 삭제
	public void cartListDelete(String[] aaa) {
		d.getCon();
		
		try {
			
			for(int i = 0; i < aaa.length; i++) {
				String sql = "delete from cart where cart_uid=?";
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, aaa[i]);
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 비우기
	public void cartListDeleteAll(String session_cart) {	
		d.getCon();
		
		try {	
			String sql = "delete from cart where cart_session=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_cart);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 전체주문
	public void orderInsertAll(String session_cart) {
		d.getCon();
		
		try {
			String sql = "update cart set order_status='주문' where cart_session=? and order_status='장바구니'";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_cart);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 선택주문
	public void orderInsert(String[] aaa, String session_cart) {
		d.getCon();
		
		try {		
			for(int i = 0; i < aaa.length; i++) {
				String sql = "update cart set order_status='주문' where cart_session=? and cart_uid=?";
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1,session_cart);
				pstmt.setString(2, aaa[i]);
				pstmt.executeUpdate();
			}
					
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//주문....상품리스트... 
	public List<CartItem> cartOrderList(String session_cart){
		d.getCon();
		
		List<CartItem> list = new LinkedList<CartItem>();
		try {
			
			String sql = "select * from cart left join item on cart.item_uid = item.uid where cart_session=? and order_status='주문' ORDER BY cart_uid DESC";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setNString(1, session_cart);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartItem c = new CartItem();
				
				c.setCart_uid(rs.getInt("cart_uid"));
				c.setCart_session(rs.getString("cart_session"));
				c.setUserid(rs.getString("userid"));
				c.setItem_uid(rs.getInt("item_uid"));
				c.setFile1_s(rs.getString("file1_s"));
				c.setItem_name(rs.getString("item_name"));
				c.setItem_option(rs.getString("item_option"));
				c.setPrice(rs.getInt("price"));
				c.setItem_num(rs.getInt("item_num"));
				c.setDelivery(rs.getInt("delivery"));
				c.setTotal(rs.getInt("total"));
				c.setOrder_status(rs.getNString("order_status"));
				
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
	
	//장바구니 다시 보내기 
	public void cartListBack(String[] aaa) {
		d.getCon();
		
		try {
			for(int i = 0; i < aaa.length; i++) {
				String sql = "update cart set order_status='장바구니' where cart_uid=?";
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, aaa[i]);
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//주문하기
	public void orderInsert(Order o) {
		d.getCon();
		try {
			String sql = "insert into order_info values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'입금전')";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, o.getOr_cart_session());
			pstmt.setString(2, o.getDate());
			pstmt.setString(3, o.getUserid());
			pstmt.setString(4, o.getOr_name());
			pstmt.setString(5, o.getOr_zipcode());
			pstmt.setString(6, o.getOr_address());
			pstmt.setString(7, o.getOr_detailaddr());
			pstmt.setString(8, o.getOr_phone1());
			pstmt.setString(9, o.getOr_phone2());
			pstmt.setString(10, o.getOr_phone3());
			pstmt.setString(11, o.getOr_email());
			pstmt.setString(12, o.getRe_name());
			pstmt.setString(13, o.getRe_zipcode());
			pstmt.setString(14, o.getRe_address());
			pstmt.setString(15, o.getRe_detailaddr());
			pstmt.setString(16, o.getRe_phone1());
			pstmt.setString(17, o.getRe_phone2());
			pstmt.setString(18, o.getRe_phone3());
			pstmt.setString(19, o.getShippingmsg());
			pstmt.setString(20, o.getPay_method());
			pstmt.setString(21, o.getPay_name());
			pstmt.setString(22, o.getPay_bank());
			pstmt.setString(23, o.getCash_receipt());
			pstmt.setString(24, o.getTax_request());
			pstmt.setString(25, o.getPurchase_agreement());
			pstmt.setInt(26, o.getPayprice());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//주문자정보 불러오기
	public Member orderInfo(String session_id) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			String sql = "select * from user where userid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setName(rs.getString("name"));
				m.setZipcode(rs.getString("zipcode"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailaddress"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				m.setEmail(rs.getString("email"));
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	//주문상태 바꾸기 
	public void orderStatusChange(String session_id, String session_cart) {
		d.getCon();
		try {
			String sql = "update cart set order_status='입금전' where order_status='주문' and userid=? and cart_session=?";
			
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, session_id);
			pstmt.setString(2, session_cart);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//바로 구매하기
		public void orderNowInsert(Cart c) {
			d.getCon();
			
			try {
				String sql = "insert into cart values (null,?,?,?,?,?,?,?,?,?,'주문',?)";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, c.getCart_session());
				pstmt.setString(2, c.getUserid());
				pstmt.setInt(3, c.getItem_uid());
				pstmt.setString(4, c.getItem_name());
				pstmt.setString(5, c.getItem_option());
				pstmt.setInt(6, c.getItem_num());
				pstmt.setInt(7, c.getPrice());
				pstmt.setInt(8, c.getTotal());
				pstmt.setInt(9, c.getDelivery());
				pstmt.setString(10, c.getFile1_s());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

