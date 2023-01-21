package controller.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Qna;

@WebServlet("/board/qnareply_insert")
public class QnaReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaReplyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String uid = request.getParameter("uid");
		int item_uid = 0;
		String item_name = "";
		System.out.println("상품번호:"+request.getParameter("item_uid"));
		System.out.println("상품이름:"+request.getParameter("item_name"));
		if(!request.getParameter("item_uid").equals("0")) {
			item_uid = Integer.parseInt(request.getParameter("item_uid"));
		}
		if(!request.getParameter("item_name").equals("")) {
			item_name = request.getParameter("item_name");
		}
		System.out.println("상품번호2:"+item_uid);
		System.out.println("상품이름2:"+item_name);
		String id = request.getParameter("reply_id");
		String name = request.getParameter("reply_name");
		int fid = Integer.parseInt(request.getParameter("fid"));
		String thread = request.getParameter("thread");
		//쓰레드 설정
		BoardDao dao = new BoardDao();
		String new_thread = dao.threadset(fid,thread);
		System.out.println("답변 쓰레드 설정:"+new_thread);
		
		String secret = "";
		if(request.getParameter("secretCheck") != null) {
			secret = request.getParameter("secretCheck");
		}
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		
		int ref = 1;
		
		//현재 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddkkmmss");
		String signdate2 = sdf2.format(today);
		
		Qna q = new Qna();
		q.setSecret(secret);
		q.setItem_uid(item_uid);
		q.setItem_name(item_name);
		q.setUserid(id);
		q.setSubject(subject);
		q.setContents(contents);
		q.setName(name);
		q.setSigndate(signdate);
		q.setSigndate2(signdate2);
		q.setRef(ref);
		q.setFid(fid);
		q.setThread(new_thread);
		
		dao.qnaReply(q);
		
		response.sendRedirect("/board/qna");
	}

}











