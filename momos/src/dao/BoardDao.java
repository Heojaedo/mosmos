package dao;

import java.sql.*;
import java.util.ArrayList;

import model.Board;
import model.Qna;

public class BoardDao {

	Statement stmt;
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	ResultSet rs;
	ResultSet rs2;
	
	DAO d = new DAO();
	
	//게시판 글쓰기
	public void insertPost(Board b) {
		d.getCon();
		
		try {
			String sql = "select * from user where userid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, b.getUserid());
			rs = pstmt.executeQuery();
			
			if(rs.next( )) {
				
			}
			
			String sql2 = "insert into board values (null,?,?,?,?,?,?,?,?,1)";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setString(1, b.getCategory());
			pstmt2.setString(2, b.getNotice());
			pstmt2.setString(3, b.getUserid());
			pstmt2.setString(4, b.getSubject());
			pstmt2.setString(5, b.getContents());
			pstmt2.setString(6, b.getName());
			pstmt2.setString(7, b.getSigndate());
			pstmt2.setString(8, b.getSigndate2());
			pstmt2.executeUpdate();
			
			pstmt2.close();
			rs.close();
			pstmt.close();
			d.conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시판 글 수
	public int postCount(String field,String search,String category) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "";
			
			if(search != null && !search.equals("")) { //검색어가 있다면
				sql = "select count(*) from board where category=? and notice='' and "+field+" like '%"+search+"%'";
			} else {
				sql = "select count(*) from board where category=? and notice=''";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
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
	
	//게시판 공지 출력
	public ArrayList<Board> boardnoticeList(String category) {
		d.getCon();
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			String sql = "select * from board where category=? and notice='on' order by uid desc";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board b = new Board();
				b.setUid(rs.getInt("uid"));
				b.setName(rs.getString("name"));
				b.setSubject(rs.getString("subject"));
				b.setSigndate(rs.getString("signdate"));
				b.setRef(rs.getInt("ref"));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//게시판 글 출력
	public ArrayList<Board> boardList(int startRow,int endRow,String field,String search,String category) {
		d.getCon();
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			String sql = "";
			
			if(search != null && !search.equals("")) { //검색
				sql = "select * from board where category=? and notice='' and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
			} else {
				sql = "select * from board where category=? and notice='' order by uid desc limit ?,?";
			}
			 
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board b = new Board();
				b.setUid(rs.getInt("uid"));
				b.setName(rs.getString("name"));
				b.setSubject(rs.getString("subject"));
				b.setSigndate(rs.getString("signdate"));
				b.setRef(rs.getInt("ref"));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//조회수 +1
	public void viewrefplus(String category,String uid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select * from board where category=? and uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("ref");
				num += 1;
			}
			
			String sql2 = "update board set ref=? where category=? and uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, category);
			pstmt2.setString(3, uid);
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 view
	public Board viewPost(String category,String uid) {
		d.getCon();
		
		Board b = new Board();
		
		try {
			String sql = "select * from board where category=? and uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b.setUid(rs.getInt("uid"));
				b.setCategory(rs.getString("category"));
				b.setSubject(rs.getString("subject"));
				b.setNotice(rs.getString("notice"));
				b.setName(rs.getString("name"));
				b.setSigndate(rs.getString("signdate"));
				b.setRef(rs.getInt("ref"));
				b.setContents(rs.getString("contents"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//이전글
	public Board viewprePost(String category,String uid) {
		d.getCon();
		
		int num = 0;
		
		Board b = new Board();
		
		try {
			String sql = "select max(uid) from board where notice='' and category=? and uid < ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from board where notice='' and category=? and uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setString(1, category);
			pstmt2.setInt(2, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				b.setUid(rs2.getInt("uid"));
				b.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//공지-이전글
	public Board noticeprePost(String category,String uid) {
		d.getCon();
		
		int num = 0;
		
		Board b = new Board();
		
		try {
			String sql = "select max(uid) from board where notice='on' and category=? and uid < ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from board where notice='on' and category=? and uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setString(1, category);
			pstmt2.setInt(2, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				b.setUid(rs2.getInt("uid"));
				b.setNotice(rs2.getString("notice"));
				b.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//다음글
	public Board viewnextPost(String category,String uid) {
		d.getCon();
		
		int num = 0;
		
		Board b = new Board();
		
		try {
			String sql = "select min(uid) from board where notice='' and category=? and uid > ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from board where notice='' and category=? and uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setString(1, category);
			pstmt2.setInt(2, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				b.setUid(rs2.getInt("uid"));
				b.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//공지-다음글
	public Board noticenextPost(String category,String uid) {
		d.getCon();
		
		int num = 0;
		
		Board b = new Board();
		
		try {
			String sql = "select min(uid) from board where notice='on' and category=? and uid > ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from board where notice='on' and category=? and uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setString(1, category);
			pstmt2.setInt(2, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				b.setUid(rs2.getInt("uid"));
				b.setNotice(rs2.getString("notice"));
				b.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//Qna 글 수
	public int qnapostCount(String field,String search) {
		d.getCon();
		
		int num = 0;
		
		String sql = "";
		
		try {
			if(search != null && !search.equals("")) {
				sql = "select count(*) from qna where review='N' and "+field+" like '%"+search+"%'";
			} else {
				sql = "select count(*) from qna where review='N'";
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
	
	//fid 설정
	public int fidSet() {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select max(fid) from qna where review='N'";
			
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
	
	//thread 설정
	public String threadset(int fid,String thread) {
		d.getCon();
		
		String o_thread = "";
		String r_thread = "";
		String thread_head = "";
		String new_thread = "";
		char thread_foot = 'a';
		
		try {
			String sql = "select thread,right(thread,1) as thread_right from qna where fid = "+fid+" AND length(thread) = length('"+thread+"')+1 AND locate('"+thread+"',thread) = 1 ORDER BY thread DESC limit 1";
			pstmt = d.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				o_thread = rs.getString("thread");

				//끝자리 +1 처리

				r_thread = rs.getString("thread_right");
				thread_foot = (char)(r_thread.charAt(0) + 1);

				//out.print(thread_foot);
			}
			if(o_thread != null && o_thread != ""){
				thread_head = o_thread.substring(0,o_thread.length()-1);
				new_thread = thread_head + thread_foot;
			}else{
				new_thread = thread+"A";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new_thread;
	}
	
	//Qna 답변
	public void qnaReply(Qna q) {
		d.getCon();

		try {
			String sql = "insert into qna values (null,?,?,?,'','',?,?,?,?,?,?,?,?,'N')";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, q.getSecret());
			pstmt.setString(2, q.getUserid());
			pstmt.setInt(3, q.getItem_uid());
			pstmt.setString(4, q.getSubject());
			pstmt.setString(5, q.getContents());
			pstmt.setString(6, q.getName());
			pstmt.setString(7, q.getSigndate());
			pstmt.setString(8, q.getSigndate2());
			pstmt.setInt(9, q.getRef());
			pstmt.setInt(10, q.getFid());
			pstmt.setString(11, q.getThread());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Qna 게시판에서 글쓰기
	public void qnaWrite(Qna q) {
		d.getCon();
		
		try {
			String sql = "insert into qna values (null,?,?,0,'','',?,?,?,?,?,?,?,?,'N')";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, q.getSecret());
			pstmt.setString(2, q.getUserid());
			pstmt.setString(3, q.getSubject());
			pstmt.setString(4, q.getContents());
			pstmt.setString(5, q.getName());
			pstmt.setString(6, q.getSigndate());
			pstmt.setString(7, q.getSigndate2());
			pstmt.setInt(8, q.getRef());
			pstmt.setInt(9, q.getFid());
			pstmt.setString(10, q.getThread());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Qna 비밀글 작성자 찾기
	public String qnawrite_id(String qna_uid) {
		d.getCon();
		
		String qna_id = "";
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, qna_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna_id = rs.getString("userid");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qna_id;
	}
	
	//Qna 비밀답변 첫 작성자 찾기
	public String qnareplyfirstfid(String qna_uid) {
		d.getCon();
		
		String firstfid_id = "";
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, qna_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
			}
			
			String sql2 = "select * from qna where fid=? limit 0,1";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, rs.getInt("fid"));
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				firstfid_id = rs2.getString("userid");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return firstfid_id;
	}
	
	//상품 view 페이지에서 Qna 글쓰기
	public void qnaviewWrite(Qna q) {
		d.getCon();
		
		int count = 0;
		
		int fid = q.getFid();
		
		try {
			String sql = "insert into qna values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,'N')";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, q.getSecret());
			pstmt.setString(2, q.getUserid());
			pstmt.setInt(3, q.getItem_uid());
			pstmt.setString(4, q.getItem_category());
			pstmt.setString(5, q.getItem_name());
			pstmt.setString(6, q.getSubject());
			pstmt.setString(7, q.getContents());
			pstmt.setString(8, q.getName());
			pstmt.setString(9, q.getSigndate());
			pstmt.setString(10, q.getSigndate2());
			pstmt.setInt(11, q.getRef());
			pstmt.setInt(12, fid);
			pstmt.setString(13, q.getThread());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//상품 view 페이지 Qna 수
	public int productqnaCount(int item_uid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from qna where item_uid=? and review='N'";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//상품 view 페이지 Qna 출력
	public ArrayList<Qna> productqnaView(int startRow,int endRow,int uid) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		try {
			String sql = "select * from qna where item_uid=? and review='N' order by fid desc,thread asc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				q.setThread(rs.getString("thread"));
				
				list.add(q);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Qna 리스트
	public ArrayList<Qna> qnaList(int startRow,int endRow,String field,String search) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String sql = "";
		
		try {
			if(search != null && !search.equals("")) {
				sql = "select * from qna where review='N' and "+field+" like '%"+search+"%' order by fid desc,thread asc limit ?,?";
			} else {
				sql = "select * from qna where review='N' order by fid desc,thread asc limit ?,?";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setItem_category(rs.getString("item_category"));
				q.setItem_name(rs.getString("item_name"));
				q.setSecret(rs.getString("secret"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				q.setRef(rs.getInt("ref"));
				q.setFid(rs.getInt("fid"));
				q.setThread(rs.getString("thread"));
				
				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Qna view
	public Qna viewqnaPost(String uid) {
		d.getCon();
		
		Qna q = new Qna();
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setRef(rs.getInt("ref"));
				q.setFid(rs.getInt("fid"));
				q.setThread(rs.getString("thread"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return q;
	}
	
	//Qna 조회수+1
	public void viewqnarefplus(String uid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("ref");
				num += 1;
			}
			
			String sql2 = "update qna set ref=? where uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, uid);
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 view
	public Qna viewreviewPost(String uid) {
		d.getCon();
		
		Qna q = new Qna();
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setRef(rs.getInt("ref"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return q;
	}
		
	//리뷰 조회수+1
	public void viewreviewrefplus(String uid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("ref");
				num += 1;
			}
			
			String sql2 = "update qna set ref=? where uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, uid);
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Qna-이전글
	public Qna viewqnaprePost(String uid) {
		d.getCon();
		
		int num = 0;
		
		Qna q = new Qna();
		
		try {
			String sql = "select max(uid) from qna where uid < ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from qna where uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				q.setUid(rs2.getInt("uid"));
				q.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return q;	
	}
	
	//Qna-다음글
	public Qna viewqnanextPost(String uid) {
		d.getCon();
		
		int num = 0;
		
		Qna q = new Qna();
		
		try {
			String sql = "select min(uid) from qna where uid > ?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			String sql2 = "select * from qna where uid=?";
			
			pstmt2 = d.conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				q.setUid(rs2.getInt("uid"));
				q.setSubject(rs2.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return q;
	}
	
	//Qna 답변 페이지
	public Qna qnareply(String uid) {
		d.getCon();
		
		Qna q = new Qna();
		
		try {
			String sql = "select * from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setRef(rs.getInt("ref"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return q;
	}
	
	//글 삭제
	public void boardDelete(String post_uid) {
		d.getCon();
		
		try {
			String sql = "delete from board where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, post_uid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//글 수정
	public void modifyPost(Board b) {
		d.getCon();
		
		try {
			String sql = "update board set category=?,notice=?,subject=?,contents=? where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, b.getCategory());
			pstmt.setString(2, b.getNotice());
			pstmt.setString(3, b.getSubject());
			pstmt.setString(4, b.getContents());
			pstmt.setInt(5, b.getUid());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Qna 수정
	public void qnaModify(Qna q) {
		d.getCon();
		
		try {
			String sql = "update qna set secret=?,subject=?,contents=? where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, q.getSecret());
			pstmt.setString(2, q.getSubject());
			pstmt.setString(3, q.getContents());
			pstmt.setInt(4, q.getUid());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Qna 삭제
	public void qnaDelete(String uid) {
		d.getCon();
		
		try {
			String sql = "delete from qna where uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 작성
	public void reviewWrite(Qna q) {
		d.getCon();
		
		try {
			String sql = "insert into qna values (null,'',?,?,?,?,?,?,?,?,?,?,0,'','Y')";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setString(1, q.getUserid());
			pstmt.setInt(2, q.getItem_uid());
			pstmt.setString(3, q.getItem_category());
			pstmt.setString(4, q.getItem_name());
			pstmt.setString(5, q.getSubject());
			pstmt.setString(6, q.getContents());
			pstmt.setString(7, q.getName());
			pstmt.setString(8, q.getSigndate());
			pstmt.setString(9, q.getSigndate2());
			pstmt.setInt(10, q.getRef());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 갯수
	public int reviewCount(String field,String search) {
		d.getCon();
		
		int num = 0;
		
		String sql = "";
		
		try {
			if(search != null && !search.equals("")) {
				sql = "select count(*) from qna where review='Y' and "+field+" like '%"+search+"%'";
			} else {
				sql = "select count(*) from qna where review='Y'";
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
	
	//상품 view 페이지에서의 리뷰 갯수
	public int reviewCount2(int item_uid) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from qna where review='Y' and item_uid=?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//리뷰 리스트
	public ArrayList<Qna> reviewList(int startRow,int endRow,String field,String search) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		String sql = "";
		
		try {
			if(search != null && !search.equals("")) {
				sql = "select * from qna where review='Y' and "+field+" like '%"+search+"%' order by uid desc limit ?,?";
			} else {
				sql = "select * from qna where review='Y' order by uid desc limit ?,?";
			}
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setItem_uid(rs.getInt("item_uid"));
				q.setItem_category(rs.getString("item_category"));
				q.setItem_name(rs.getString("item_name"));
				q.setSecret(rs.getString("secret"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				q.setRef(rs.getInt("ref"));
				
				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 view 페이지에서의 리뷰 리스트
	public ArrayList<Qna> viewPageReviewList(int startRow2,int endRow2,int item_uid) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		try {
			String sql = "select * from qna where item_uid=? and review='Y' order by uid desc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			pstmt.setInt(2, startRow2);
			pstmt.setInt(3, endRow2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setUserid(rs.getString("userid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				
				list.add(q);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 view 페이지 Qna 리스트 ajax
	public ArrayList<Qna> qnaajaxList(int item_uid,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		try {
			String sql = "select * from qna where item_uid=? and review='N' order by fid desc,thread asc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				q.setThread(rs.getString("thread"));
				
				list.add(q);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 view 페이지 Review 리스트 ajax
	public ArrayList<Qna> reviewajaxList(int item_uid,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		try {
			String sql = "select * from qna where item_uid=? and review='Y' order by uid desc limit ?,?";
			
			pstmt = d.conn.prepareStatement(sql);
			pstmt.setInt(1, item_uid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				q.setUid(rs.getInt("uid"));
				q.setSecret(rs.getString("secret"));
				q.setUserid(rs.getString("userid"));
				q.setSubject(rs.getString("subject"));
				q.setContents(rs.getString("contents"));
				q.setName(rs.getString("name"));
				q.setSigndate(rs.getString("signdate"));
				q.setSigndate2(rs.getString("signdate2"));
				
				list.add(q);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

















