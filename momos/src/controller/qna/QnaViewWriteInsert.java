package controller.qna;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Qna;

@WebServlet("/board/qnaviewwrite_insert")
public class QnaViewWriteInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaViewWriteInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Qna q = new Qna();
		BoardDao dao = new BoardDao();
		
		int item_uid = Integer.parseInt(request.getParameter("item_uid"));
		String item_name = request.getParameter("item_name");
		String category = request.getParameter("category");
		System.out.println("카테고리:"+category);
		String id = request.getParameter("session_id");
		String name = request.getParameter("session_name");
		String secret = "";
		if(request.getParameter("secretCheck") != null) {
			secret = request.getParameter("secretCheck");
		}
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");

		//현재 날짜
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddkkmmss");
		String signdate2 = sdf2.format(today);
		
		int ref = 1;
		int fid = 1;
		
		//fid값 설정
		int maxfid = dao.fidSet(); //fid 최댓값
		if(maxfid > 0) {
			fid = maxfid + 1;
		} else {
			fid = 1;
		}
		
		String thread = "A";
		
		q.setSecret(secret);
		q.setUserid(id);
		q.setItem_uid(item_uid);
		q.setItem_category(category);
		q.setItem_name(item_name);
		q.setSubject(subject);
		q.setContents(contents);
		q.setName(name);
		q.setSigndate(signdate);
		q.setSigndate2(signdate2);
		q.setRef(ref);
		q.setFid(fid);
		q.setThread(thread);
		
		dao.qnaviewWrite(q);
		
		response.sendRedirect("/product/"+category+"?no="+item_uid);
	}

}
