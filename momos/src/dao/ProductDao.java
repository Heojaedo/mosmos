package dao;

import java.sql.*;
import java.util.ArrayList;

import model.Item;

public class ProductDao {

	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//상품 등록
	public void productRegist(String cate1,Item i) {
		d.getCon();

		try {
			String sql = "insert into item values (null,?,?,?,?,?,?,?,?,?)";
			
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
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품 전체 개수
	public int itemAllCount() {
		d.getCon();
		
		int count = 0;
		try {
			String sql = "select count(*) from item";
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//상품 전체 출력
	public ArrayList<Item> itemAllSelect(int startRow,int endRow,String field,String search) {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "select * from item order by uid desc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
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
	
	//상품 개수 출력
	public int productCount(String category) {
		d.getCon();
		
		int count = 0;
		try {
			String sql = "select count(*) from item where category1=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//상품 리스트 출력
	public ArrayList<Item> productList(String category,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "select * from item where category1=? order by uid desc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setFile1(rs.getString("file1"));
				
				list.add(i);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 리스트 정렬
	public ArrayList<Item> categorysortList(String category,String sort,int startRow,int endRow) {
		d.getCon();
		
		String sql = "";
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			if(sort.equals("1")) {
				sql = "select * from item where category1=? order by name asc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("2")) {
				sql = "select * from item where category1=? order by price asc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("3")) {
				sql = "select * from item where category1=? order by price desc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			}
					
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//선물세트 리스트 상품 개수
	public int productgiftsetCount() {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from item where gift='on'";
			
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
	
	//선물세트 리스트
	public ArrayList<Item> productgiftsetList() {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "select * from item where gift='on' order by uid desc";
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setFile1(rs.getString("file1"));
				
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//선물세트 리스트 정렬
	public ArrayList<Item> giftsetsortList(String sort) {
		d.getCon();
		
		String sql = "";
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			if(sort.equals("1")) {
				sql = "select * from item where gift='on' order by name asc";
				
				pstmt = d.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("2")) {
				sql = "select * from item where gift='on' order by price asc";
				
				pstmt = d.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("3")) {
				sql = "select * from item where gift='on' order by price desc";
				
				pstmt = d.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			}
					
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//원두-하위 카테고리 상품 개수 출력
	public int beanscategoryCount(String category) {
		d.getCon();
		
		int count = 0;
		try {
			String sql = "select count(*) from item where category2=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//원두-하위 카테고리 상품 리스트 출력
	public ArrayList<Item> beanscategoryList(String category,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "select * from item where category2=? order by uid desc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setFile1(rs.getString("file1"));
				
				list.add(i);
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//원두-하위 카테고리 상품 리스트 정렬
	public ArrayList<Item> beanscategorysortList(String category,String sort,int startRow,int endRow) {
		d.getCon();
		
		String sql = "";
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			if(sort.equals("1")) {
				sql = "select * from item where category2=? order by name asc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2,startRow);
				pstmt.setInt(3,endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("2")) {
				sql = "select * from item where category2=? order by price asc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2,startRow);
				pstmt.setInt(3,endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			} else if(sort.equals("3")) {
				sql = "select * from item where category2=? order by price desc limit ?,?";
				
				pstmt = d.conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2,startRow);
				pstmt.setInt(3,endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Item i = new Item();
					
					i.setUid(rs.getInt("uid"));
					i.setCategory1(rs.getString("category1"));
					i.setName(rs.getString("name"));
					i.setSubname(rs.getString("subname"));
					i.setPrice(rs.getInt("price"));
					i.setFile1(rs.getString("file1"));
					
					list.add(i);
				}
			}
					
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 뷰 페이지
	public Item productView(int item_uid) {
		d.getCon();
		
		Item i = new Item();
		
		try {
			String sql = "select * from item where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setName(rs.getString("name"));
				i.setPrice(rs.getInt("price"));
				i.setDelivery(rs.getInt("delivery"));
				i.setFile1(rs.getString("file1"));
				i.setFile1_s(rs.getString("file1_s"));
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	//위시리스트 중복 확인
	public int wishCheck(int item_uid,String userid) {
		d.getCon();
		
		int num = 0;
		try {
			String sql = "select count(*) from wish where userid=? and item_uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//위시리스트 추가
	public void wishInsert(int item_uid,String userid,String file_s) {
		d.getCon();
		
		Item i = new Item();
		
		try {
			String sql = "insert into wish values (null,?,?,?)";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, item_uid);
			pstmt.setString(3, file_s);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//썸네일 출력
	public String thumbnail(int item_uid) {
		d.getCon();
		
		String file_s = "";
		
		try {
			String sql = "select * from item where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				file_s = rs.getString("file1_s");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_s;
	}
	
	//썸네일명 불러오기
	public Item filenameSelect(String item_uid) {
		d.getCon();
		
		Item i = new Item();
		
		try {
			String sql = "select * from item where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				i.setFile1(rs.getString("file1"));
				i.setFile1_s(rs.getString("file1_s"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	//메인페이지 슬라이드 상품 이미지
	public ArrayList<Item> mainpageItemList() {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		try {
			String sql = "select * from item where file1 != '' order by uid desc limit 0,10";
			
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setFile1(rs.getString("file1"));
				i.setFile1_s(rs.getString("file1_s"));
				
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 검색 갯수
	public int searchItemCount(String category,String field,String search,String minprice,String maxprice,String sort) {
		d.getCon();
		
		int count = 0;
		
		String cate_sql = "";
		String search_sql = "";
		String minprice_sql = "";
		String maxprice_sql = "";
		String sort_sql = "";
		
		if(!category.equals("")) {
			cate_sql = " and category1='"+category+"'";
		}
		if(!search.equals("")) {
			search_sql = " and "+field+" like '%"+search+"%'";
		}
		if(!minprice.equals("")) {
			minprice_sql = " and price>="+minprice+"";
		}
		if(!maxprice.equals("")) {
			maxprice_sql = " and price<="+maxprice+"";
		}
		if(!sort.equals("")) {
			if(sort.equals("sort_method1")) {
				sort_sql = " order by name asc";
			} else if (sort.equals("sort_method2")) {
				sort_sql = " order by price asc";
			} else if (sort.equals("sort_method3")) {
				sort_sql = " order by price desc";
			} else {
				sort_sql = " order by uid desc";
			}
		}
		
		try {
			String sql = "select count(*) from item where 1=1"+cate_sql+search_sql+minprice_sql+maxprice_sql+sort_sql;
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//상품 검색
	public ArrayList<Item> searchItem(String category,String field,String search,String minprice,String maxprice,String sort,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Item> list = new ArrayList<Item>();
		
		String cate_sql = "";
		String search_sql = "";
		String minprice_sql = "";
		String maxprice_sql = "";
		String sort_sql = "";
		
		if(!category.equals("")) {
			cate_sql = " and category1='"+category+"'";
		}
		if(!search.equals("")) {
			search_sql = " and "+field+" like '%"+search+"%'";
		}
		if(!minprice.equals("")) {
			minprice_sql = " and price>="+minprice+"";
		}
		if(!maxprice.equals("")) {
			maxprice_sql = " and price<="+maxprice+"";
		}
		if(!sort.equals("")) {
			if(sort.equals("sort_method1")) {
				sort_sql = " order by name asc";
			} else if (sort.equals("sort_method2")) {
				sort_sql = " order by price asc";
			} else if (sort.equals("sort_method3")) {
				sort_sql = " order by price desc";
			} else {
				sort_sql = " order by uid desc";
			}
		}
		
		try {
			String sql = "select * from item where 1=1"+cate_sql+search_sql+minprice_sql+maxprice_sql+sort_sql+" limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				i.setUid(rs.getInt("uid"));
				i.setCategory1(rs.getString("category1"));
				i.setName(rs.getString("name"));
				i.setSubname(rs.getString("subname"));
				i.setPrice(rs.getInt("price"));
				i.setFile1(rs.getString("file1"));
				
				list.add(i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

















