package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Item;

@WebServlet("")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Index() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao = new ProductDao();
		ArrayList<Item> list = dao.mainpageItemList();
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("/mainpage/mainpage.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
