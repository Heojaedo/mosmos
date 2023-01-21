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

@WebServlet("/article/review")
public class ReviewView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("no");	
		
		BoardDao dao = new BoardDao();
		Qna q = dao.viewqnaPost(uid);
		dao.viewqnarefplus(uid);
		
		int item_uid = q.getItem_uid(); //상품 uid로 상품 바로가기 출력
		ProductDao p = new ProductDao();
		Item i = p.productView(item_uid);
		
		request.setAttribute("uid", uid);
		request.setAttribute("userid", q.getUserid());
		request.setAttribute("subject", q.getSubject());
		request.setAttribute("name", q.getName());
		request.setAttribute("signdate", q.getSigndate());
		request.setAttribute("contents", q.getContents());
		request.setAttribute("ref", q.getRef()); //조회수

		request.setAttribute("itemName", i.getName()); //상품명
		request.setAttribute("itemPrice", i.getPrice()); //상품가격
		request.setAttribute("itemImg", i.getFile1()); //상품이미지
		request.setAttribute("itemFile_s", i.getFile1_s()); //썸네일
		request.setAttribute("category", i.getCategory1()); //상품카테고리
		request.setAttribute("itemUid", i.getUid()); //상품번호
		RequestDispatcher dis = request.getRequestDispatcher("reviewView.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
