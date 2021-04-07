package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shopCart.ShopCartDAO;

/**
 * Servlet implementation class addToCartAction
 */
@WebServlet("/addToCartAction")
public class addToCartAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(true);

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("history.back()");
			script.println("</script>");
			return;
		} else {
			int itemCode = 0;
			if (request.getParameter("itemCode") != null) {
				itemCode = Integer.parseInt(request.getParameter("itemCode"));
				if (itemCode <= 0) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('허용 되지 않은 접근입니다.')");
					script.println("history.back()");
					script.println("</script>");
					return;
				} else {
					ShopCartDAO shopCartDao = new ShopCartDAO();
					int result = shopCartDao.addShopCart(itemCode, userID, "folderName");
					if (result == -1) {// 장바구니에 중복된 경우
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('이미 추가한 상품입니다.')");
						script.println("history.back()");
						script.println("</script>");
						return;

					} else if (result == -2) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('DB오류')");
						script.println("history.back()");
						script.println("</script>");
						return;
					} else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('해당 상품을 장바구니에 담았습니다.')");
						script.println("location.href='./category/item-info.jsp?itemCode=" + itemCode + "';");
						script.println("</script>");
						return;
					}
				}
			}

		}

	}

}
