package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import file.FileDAO;
import item.ItemDAO;
import item.ItemDTO;

/**
 * Servlet implementation class SubAction
 */
@WebServlet("/subAction")
public class subAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		ServletContext context = this.getServletContext();
		RequestDispatcher dispatcher = null;

		ItemDAO itemDao = new ItemDAO();
		FileDAO fileDao = new FileDAO();

		String main_cate = null;
		if (request.getParameter("main_cate") != null) {
			main_cate = request.getParameter("main_cate");
		}

		ArrayList<ItemDTO> itemList = new ArrayList<>();
		itemList = itemDao.getItemList(main_cate);

		// 아이템 이미지를 file DB에서 가져오는 과정
		ArrayList<String> itemImageList = new ArrayList<String>();
		for (int i = 0; i < itemList.size(); i++) {
			String itemImagePath = fileDao.getFilePath(itemList.get(i).getItemCode()); //있으면 경로 return 없으면 "" return
			itemImageList.add(itemImagePath);
		}

		request.setAttribute("itemList", itemList);
		request.setAttribute("itemImageList", itemImageList);
		request.setAttribute("main_cate", main_cate);

		dispatcher = context.getRequestDispatcher("/Web-source/category/bag.jsp");
		dispatcher.forward(request, response);

	}

}
