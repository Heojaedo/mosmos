package controller.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Item;

@WebServlet("/board/qnaviewwrite")
public class QnaViewWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnaViewWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int item_uid = Integer.parseInt(request.getParameter("item_uid"));
		ProductDao dao = new ProductDao();
		Item i = dao.productView(item_uid);
		
		String item_name = request.getParameter("itemName");
		String category = request.getParameter("category");
		String id = "";
		String name = "";
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("session_id") == "") {
			out.print("<script>");
			out.print("alert('회원에게만 글쓰기 권한이 있습니다.');");
			out.print("history.back();");
			out.print("</script>");
		} else {
			id = request.getParameter("session_id");
			name = request.getParameter("session_name");
			
			request.setAttribute("item_uid", item_uid);
			request.setAttribute("item_name", i.getName());
			request.setAttribute("itemPrice", i.getPrice());
			request.setAttribute("itemFile_s", i.getFile1_s());
			request.setAttribute("category", category);
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			RequestDispatcher dis = request.getRequestDispatcher("qnaviewwrite.jsp");
			dis.forward(request, response);
		}
		
	}

}
