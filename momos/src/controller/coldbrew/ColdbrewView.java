package controller.coldbrew;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/product/coldbrew")
public class ColdbrewView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ColdbrewView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int item_uid = Integer.parseInt(request.getParameter("no"));
		String category = "coldbrew";
		
		ProductDao dao = new ProductDao();
		Item i = dao.productView(item_uid);

		BoardDao dao2 = new BoardDao();
		
		//한 페이지 출력 게시물 수
		int pageSize = 5;
		
		//Qna 현재 페이지 수
		int pageNum_1 = 1;
		if(request.getParameter("pageNum_1") != null) { //get 방식으로 값이 넘어 왔다면
			pageNum_1 = Integer.parseInt(request.getParameter("pageNum_1"));
		}
		
		//리뷰 현재 페이지 수
		int pageNum_2 = 1;
		if(request.getParameter("pageNum_2") != null) { //get 방식으로 값이 넘어 왔다면
			pageNum_2 = Integer.parseInt(request.getParameter("pageNum_2"));
		}
		
		Qna q = new Qna();
		
		//Qna 총 게시물 수
		int count = dao2.productqnaCount(item_uid);
		
		//Qna 넘버링
		int number = count - (pageNum_1 - 1) * pageSize;
		
		//리뷰 총 게시물 수
		int count_re = dao2.reviewCount2(item_uid);
		
		//리뷰 넘버링
		int number_re = count_re - (pageNum_2 - 1) * pageSize;
		
		//Qna limit 값 설정
		int startRow = (pageNum_1 - 1) * pageSize;
		int endRow = pageSize;
		
		//리뷰 limit 값 설정
		int startRow2 = (pageNum_2 - 1) * pageSize;
		int endRow2 = pageSize;
		
		ArrayList<Qna> list = dao2.productqnaView(startRow,endRow,item_uid);
		ArrayList<Qna> list_re = dao2.viewPageReviewList(startRow2,endRow2,item_uid);
		
		request.setAttribute("category", category);
		request.setAttribute("itemUid", i.getUid());
		request.setAttribute("itemName", i.getName());
		request.setAttribute("itemPrice", i.getPrice());
		request.setAttribute("itemDelivery", i.getDelivery());
		request.setAttribute("itemImg", i.getFile1());
		request.setAttribute("pageSize", pageSize); //한 페이지 출력 - 5
		request.setAttribute("count", count); //Qna 수
		request.setAttribute("list", list); //Qna 리스트
		request.setAttribute("pageNum_1", pageNum_1); //Qna 초기 페이지 번호
		request.setAttribute("number", number); //Qna 넘버링
		request.setAttribute("count_re", count_re); //상품 리뷰 수
		request.setAttribute("list_re", list_re); //리뷰 리스트
		request.setAttribute("pageNum_2", pageNum_2); //리뷰 페이지 번호
		request.setAttribute("number_re", number_re); //리뷰 넘버링
		RequestDispatcher dis = request.getRequestDispatcher("View.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
