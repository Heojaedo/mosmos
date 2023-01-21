package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/regist_productdeliveryBlank")
public class ProductRegistDeliveryBlank extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductRegistDeliveryBlank() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delivery = request.getParameter("productDelivery");
		
		int num = 0;
		
		if(delivery == "") {
			num = 1;
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(num);
	}

}
