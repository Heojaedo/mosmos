package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Qna;

@WebServlet("/board/viewQnaPaging")
public class ViewQnaPaging extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewQnaPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("==Qna==상품 번호는 : "+request.getParameter("item_uid"));
		System.out.println("==Qna==Qna 페이지는 : "+request.getParameter("pageNo"));
		
		int item_uid = Integer.parseInt(request.getParameter("item_uid"));
		String item_name = request.getParameter("item_name");
		String category = request.getParameter("category");
		int pageNo = Integer.parseInt(request.getParameter("pageNo")); //페이지 번호 받아온 값
		
		BoardDao dao2 = new BoardDao();
		
		//한 페이지 출력 게시물 수
		int pageSize = 5;
		
		Qna q = new Qna();
		
		//Qna 총 게시물 수
		int count = dao2.productqnaCount(item_uid);
		
		//Qna 넘버링
		int number = count - (pageNo - 1) * pageSize;
		
		//Qna limit 값 설정
		int startRow = (pageNo - 1) * pageSize;
		int endRow = pageSize;
		
		//받은 페이지 값과 한 페이지 당 출력 게시물 수로 리스트 불러오기
		ArrayList<Qna> list = dao2.qnaajaxList(item_uid,startRow,endRow);

		request.setAttribute("itemUid", item_uid);
		request.setAttribute("itemName", item_name);
		request.setAttribute("category", category);
		request.setAttribute("pageNum_1", pageNo); //현재 페이지 번호
		request.setAttribute("pageSize", pageSize); //한 페이지 당 글 수
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("viewQnaList.jsp");
		dis.forward(request, response);
	}

}
