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
import model.Qna;
import model.WishItem;
import sun.security.action.GetIntegerAction;



public class MyShopDao {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//위시리스트
	public List<WishItem> wishList(String session_id, int startRow, int endRow) {
		d.getCon();
		
		List<WishItem> list = new LinkedList<WishItem>();
		
		try {
			
			String sql = "select * from wish left join item on wish.item_uid = item.uid where userid=? order by wi_uid asc limit ?,?";
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				WishItem w = new WishItem();
				
				w.setWi_uid(rs.getInt("wi_uid"));
				w.setFile1_s(rs.getString("file1_s"));
				w.setName(rs.getString("name"));
				w.setPrice(rs.getString("price"));
				w.setDelivery(rs.getString("delivery"));
				w.setCategory1(rs.getString("category1"));
				w.setUid(rs.getInt("uid"));
				
				list.add(w);
				
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;		
	}
	
	//위시리스트 수
	public int getAllWishList(String session_id) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from wish where userid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_id);
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
	
	//위시리스트 삭제 
	public void wishListDelete(String[] aaa) {
		d.getCon();
		
		try {	
			
			for(int i = 0; i < aaa.length; i++) {
				String sql = "delete from wish where wi_uid in (?)";
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
	
	//주문 리스트
	public List<Order> orderList(String session_id, int startRow, int endRow){
		d.getCon();
		
		List<Order> list = new LinkedList<Order>();
		
		try {
			String sql = "select *,(select item.category1 from item where cart.item_uid = item.uid) as category1 from order_info left join cart on or_cart_session = cart_session where cart.userid=? and order_status not in('장바구니','주문') order by or_uid DESC limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Order o = new Order();
				
				o.setDate(rs.getString("date"));
				o.setOr_uid(rs.getInt("or_uid"));
				o.setFile1_s(rs.getString("file1_s"));
				o.setItem_name(rs.getString("item_name"));
				o.setItem_option(rs.getString("item_option"));
				o.setItem_num(rs.getInt("item_num"));
				o.setTotal(rs.getInt("total"));
				o.setOrder_status(rs.getString("order_status"));
				o.setCart_uid(rs.getInt("cart_uid"));
				o.setItem_uid(rs.getInt("item_uid"));
				o.setCategory1(rs.getString("category1"));
				o.setOr_cart_session(rs.getString("cart_session"));
				
				list.add(o);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
		
	//총 주문 수 
	public int getAllOrderCount(String session_id) {
		d.getCon();
		
		int num = 0;
		try {
			String sql = "select count(*) from cart where order_status not in ('장바구니','주문') and userid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_id);
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
	
	//주문 상세 페이지
	public Order orderView(int uid) {
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
				o.setPayprice(rs.getInt("payprice"));
				
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	
	//주문 상세 페이지 주문상태 
	public Order orderStatus(int cart_uid) {
		d.getCon();
		
		Order s = new Order();
		
		try {
			String sql = "select * from cart where cart_uid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, cart_uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				s.setOrder_status(rs.getString("order_status"));
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return s;
	}

	
	//주문 상세 페이지 상품 리스트
	public List<CartItem> orderItemList(int uid) {
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
				c.setCart_session(rs.getString("cart_session"));
				
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
	
	
	//내가 쓴 글 
	public List<Qna> myAllPost(String session_id, int startRow, int endRow, String field, String search, String code) {
		d.getCon();
		System.out.println("======code====:"+code);
		List<Qna> list = new LinkedList<Qna>();
		
		try {
			
			String sql = "";
			
			if(search != null ) {
				if(code.contentEquals("Y")) { //review
					sql = "select * from qna where userid=? and review = 'N' and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				}else if(code.contentEquals("N")) { //qna
					sql = "select * from qna where userid=? and review = 'Y' and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				}else { //전체
					sql = "select * from qna where userid=? and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
				}
			}else {
				if(code.contentEquals("Y")) { //review
					sql = "select * from qna where userid=? and review = 'N' order by uid desc limit ?,?";
				}else if(code.contentEquals("N")) { //qna
					sql = "select * from qna where userid=? and review = 'Y' order by uid desc limit ?,?";
				}else { //전체
					sql = "select * from qna where userid=? order by uid desc limit ?,?";
				}				
			}
			
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				
				q.setUid(rs.getInt("uid"));
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setItem_name(rs.getString("item_name"));
				q.setSubject(rs.getString("subject"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setReview(rs.getString("review"));
				q.setRef(rs.getInt("ref"));
				
				list.add(q);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	//총 게시글 수 
	public int getAllPostCount(String field, String search, String session_id, String code) {
		d.getCon();
		
		int num = 0;
		try {
			String sql = "";
			
			if(search != null ) {
				if(code.contentEquals("Y")) { //review
					sql = "select count(*) from qna where userid=? and review = 'N' and "+field+" like '%"+search+"%'";
				}else if(code.contentEquals("N")) { //qna
					sql = "select count(*) from qna where userid=? and review = 'Y' and "+field+" like '%"+search+"%'";
				}else { //전체
					sql = "select count(*) from qna where userid=? and "+field+" like '%"+search+"%'";
				}
			}else {
				if(code.contentEquals("Y")) { //review
					sql = "select count(*) from qna where userid=? and review = 'N'";
				}else if(code.contentEquals("N")) { //qna
					sql = "select count(*) from qna where userid=? and review = 'Y'";
				}else { //전체
					sql = "select count(*) from qna where userid=?";
				}				
			}
			pstmt = d.conn.prepareStatement(sql);

			pstmt.setString(1, session_id);
			
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
	
	
	
	//주문 취소
	public void orderCancel(int uid) {
		d.getCon();
		try {
			String sql = "update cart left join order_info on cart_session = or_cart_session set order_status='취소' where or_uid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
			
}
