package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/regist_productpriceBlank")
public class ProductRegistPriceBlank extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductRegistPriceBlank() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String price = request.getParameter("productPrice");
		
		int num = 0;
		
		if(price == "") {
			num = 1;
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(num);
	}

}
