package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;


@WebServlet("/admin/itemDelete")
public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("location.href='/'");
		out.print("</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_uid = request.getParameter("item_uid");
		
		AdminDao dao = new AdminDao();
		dao.itemDelete(item_uid);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('삭제 완료');");
		out.print("location.href='/admin/itemList';");
		out.print("</script>");
	}

}











