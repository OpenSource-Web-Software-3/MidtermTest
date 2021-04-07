package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import file.FileDAO;
import item.ItemDAO;
import item.ItemDTO;
import shopCart.ShopCartDAO;
import shopCart.ShopCartDTO;


/**
 * Servlet implementation class purchaseListAction
 */
@WebServlet("/shopCartAction")
public class shopCartAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ServletContext context = this.getServletContext();
		RequestDispatcher dispatcher = null;

		HttpSession session = request.getSession(true);

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.do'");
			script.println("</script>");
			return;
		}
		
		//이미 장바구니 목록에 담았는지 체크
		
		ShopCartDAO shopCartDao = new ShopCartDAO();
		ItemDAO itemDao = new ItemDAO();
		FileDAO fileDao = new FileDAO();
		
		
		ArrayList<String> addDateList = shopCartDao.getAddDate(userID); // 1.Date 가져오기
		ArrayList<ShopCartDTO> shopCartList = shopCartDao.getShopCartItem(userID); // 2.purchaseList 가져오기
		
		
		ArrayList<ItemDTO> itemList = new ArrayList<ItemDTO>(); 
		
		for (int i = 0; i < shopCartList.size(); i++) {
			itemList.add(itemDao.getItem(shopCartList.get(i).getItemCode()));
		}
		
		// 4.해당 이미지 파일들 가져오기
		ArrayList<String> itemImageList = new ArrayList<String>();
		for (int i = 0; i < shopCartList.size(); i++) {
			itemImageList.add(fileDao.getFilePath(shopCartList.get(i).getItemCode()));
		}

		request.setAttribute("addDateList", addDateList);
		request.setAttribute("shopCartList", shopCartList);
		request.setAttribute("itemList", itemList);
		request.setAttribute("itemImageList", itemImageList);
		
		dispatcher = context.getRequestDispatcher("/Web-source/purchase/shop-cart.jsp");
		dispatcher.forward(request, response);

		
	}

}
