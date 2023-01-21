package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Item;

@WebServlet("/product/wishlist")
public class Wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Wishlist() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int item_uid = Integer.parseInt(request.getParameter("item_uid"));
		//썸네일 불러오기
		ProductDao dao2 = new ProductDao();
		String file_s = dao2.thumbnail(item_uid);
		String userid = request.getParameter("item_user");
		String itemName = request.getParameter("item_name");
		String price = request.getParameter("item_price");
		String delivery = request.getParameter("item_delivery");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(userid.equals("")) {
			out.print("<script>");
			out.print("alert('로그인 후 관심상품 등록을 해주세요.');");
			out.print("location.href='/member/login';");
			out.print("</script>");
		}
		else {
			Item i = new Item();
			i.setUid(item_uid);
			
			ProductDao dao = new ProductDao();
			int num = dao.wishCheck(item_uid,userid);
			
			if(num == 0) {
				dao.wishInsert(item_uid,userid,file_s);
				
				out.print("<script>");
				out.print("alert('관심상품으로 등록되었습니다.');");
				out.print("history.back();");
				out.print("</script>");
			} else {
				out.print("<script>");
				out.print("alert('이미 관심상품으로 등록된 상품입니다.');");
				out.print("history.back();");
				out.print("</script>");
			}

		}
		
	}

}
