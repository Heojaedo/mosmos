package controller.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ProductDao;
import model.Item;
import model.Qna;

@WebServlet("/board/qnamodify")
public class QnaModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String userid = request.getParameter("userid");
		int item_uid = Integer.parseInt(request.getParameter("item_uid"));
		
		BoardDao dao = new BoardDao();
		ProductDao dao2 = new ProductDao();
		Item i = dao2.productView(item_uid);
		Qna q = dao.viewqnaPost(uid);
		
		request.setAttribute("uid", uid);
		request.setAttribute("secret", q.getSecret());
		request.setAttribute("subject", q.getSubject());
		request.setAttribute("contents", q.getContents());
		request.setAttribute("itemPrice", i.getPrice());
		request.setAttribute("item_name", i.getName());
		request.setAttribute("itemFile_s", i.getFile1_s());
		request.setAttribute("category", i.getCategory1());
		request.setAttribute("itemUid", item_uid);
		RequestDispatcher dis = request.getRequestDispatcher("qnaModify.jsp");
		dis.forward(request, response);
	}

}
