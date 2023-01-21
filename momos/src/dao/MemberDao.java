package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Member;

public class MemberDao {
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
		
	//회원가입 
	public void insertMember(Member m) {
		d.getCon();
		
		try {
			
			String sql = "insert into user values (?,?,?,?,?,?,?,?,?,?,?,?,?)";          
			pstmt = d.conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserid());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getZipcode());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getDetailaddress());
			pstmt.setString(7, m.getPhone1());
			pstmt.setString(8, m.getPhone2());
			pstmt.setString(9, m.getPhone3());
			pstmt.setString(10, m.getSms());
			pstmt.setString(11, m.getEmail());
			pstmt.setString(12, m.getEmail_re());
			pstmt.setString(13, "1");
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//아이디 존재여부
	public int loginSelect(String userid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from user where userid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
	//아이디 비밀번호 조회
	public Member idPassSelect(String userid, String password) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			
			String sql = "select * from user where userid=? and password=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setUserid(rs.getString("userid"));
				m.setPassword(rs.getString("password"));
				m.setName(rs.getString("name"));
				m.setZipcode(rs.getString("zipcode"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailaddress"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				m.setSms(rs.getString("sms"));
				m.setEmail(rs.getString("email"));
				m.setEmail_re(rs.getString("email_re"));
				m.setLevel(rs.getString("level"));
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	//로그인 회원 정보
	public Member sessionSelect(String userid) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			String sql = "select * from user where userid=?";
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setUserid(rs.getString("userid"));
				m.setPassword(rs.getString("password"));
				m.setName(rs.getString("name"));
				m.setZipcode(rs.getString("zipcode"));
				m.setAddress(rs.getString("address"));
				m.setDetailaddress(rs.getString("detailaddress"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				m.setSms(rs.getString("sms"));
				m.setEmail(rs.getString("email"));
				m.setEmail_re(rs.getString("email_re"));
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	//회원수정
	public void updateMember(Member m) {
		d.getCon();
		
		try {
			
			String sql = "";
			
			/*if(m.getPassword() == null) {
				
				sql= "update user set zipcode=?, address=?, detailaddress=?, phone1=?, phone2=?, phone3=?, sms=?, email=?, email_re=? where userid=?";
				
				pstmt = d.conn.prepareStatement(sql);
			
				pstmt.setString(1, m.getZipcode());
				pstmt.setString(2, m.getAddress());
				pstmt.setString(3, m.getDetailaddress());
				pstmt.setString(4, m.getPhone1());
				pstmt.setString(5, m.getPhone2());
				pstmt.setString(6, m.getPhone3());
				pstmt.setString(7, m.getSms());
				pstmt.setString(8, m.getEmail());
				pstmt.setString(9, m.getEmail_re());
				pstmt.setString(10, m.getUserid());
				pstmt.executeUpdate();
				
			}else {
			} */
			
				sql= "update user set password=?, zipcode=?, address=?, detailaddress=?, phone1=?, phone2=?, phone3=?, sms=?, email=?, email_re=? where userid=?"; 
				
				pstmt = d.conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getPassword());
				pstmt.setString(2, m.getZipcode());
				pstmt.setString(3, m.getAddress());
				pstmt.setString(4, m.getDetailaddress());
				pstmt.setString(5, m.getPhone1());
				pstmt.setString(6, m.getPhone2());
				pstmt.setString(7, m.getPhone3());
				pstmt.setString(8, m.getSms());
				pstmt.setString(9, m.getEmail());
				pstmt.setString(10, m.getEmail_re());
				pstmt.setString(11, m.getUserid());
				pstmt.executeUpdate();
				
				
			 					
			pstmt.close();
			d.conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//아이디 찾기
	public String idSelect(String name, String email) {
		d.getCon();
		
		String userid ="";
		
		try {
			
			String sql = "select * from user where name=? and email=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userid");
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userid;
	}
	
	//비밀번호 찾기
	public String passSelect(String userid, String name, String email) {
		d.getCon();
		
		String password = "";
		
		try {
			String sql = "select * from user where userid=? and name=? and email=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString("password");
			}
			
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return password;
	}
	
	
	//비밀글 비밀번호 확인
	public int secretCheck(String session_id,String pass) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from user where userid=? and password=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
}







