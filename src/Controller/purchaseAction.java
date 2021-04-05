package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import purchaseList.PurchaseListDAO;
import user.UserDAO;
import user.UserDTO;

/**
 * Servlet implementation class purchaseAction
 */
@WebServlet("/purchaseAction")
public class purchaseAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(true);
		String userID = null;

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		int itemCode = 0;
		if (request.getParameter("itemCode") != null) {
			itemCode = Integer.parseInt(request.getParameter("itemCode"));
		}

		// 배송지 정보 & 카드 정보 가져오기
		String postal_code = request.getParameter("postal_code");
		String user_address = request.getParameter("user_address");
		String card_company = request.getParameter("card_company");
		String card_number = request.getParameter("card_number");

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요')");
			script.println("history.back()");
			script.println("</script>");
			return;
		} else if (postal_code == null || postal_code.equals("") || user_address == null || user_address.equals("")
				|| card_company == null || card_company.equals("") || card_number == null || card_number.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			return;
		} else if (request.getParameter("itemCode") == null || request.getParameter("itemCode").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다.(itemCode)')");
			script.println("history.back()");
			script.println("</script>");
			return;
		} else {

			PurchaseListDAO purchaseListDao = new PurchaseListDAO();
			int result = purchaseListDao.addPurchase(itemCode, userID, postal_code, user_address, card_company,
					card_number);

			if (result == 1) { // 구매하기 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('구매하였습니다.')");
				script.println("location.href = 'index.do'");
				script.println("</script>");
				return;
			} else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류')");
				script.println("history.back();");
				script.println("</script>");
				return;
			}
		}
	}
}
