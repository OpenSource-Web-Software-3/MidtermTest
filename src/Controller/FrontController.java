package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
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
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		String URI = request.getRequestURI(); // /MidtermTest/view.do
		String contextPath = request.getContextPath(); // /MidtermTest
		String com = URI.substring(contextPath.length()); // /view.do

		System.out.println(URI);
		System.out.println(contextPath);

		if (com.contains("/index.do")) {
			viewPage = "index.jsp";
		} else if (com.contains("/register1.do")) {
			viewPage = "register1.jsp";
		} else if (com.contains("/register2.do")) {
			viewPage = "register2.jsp";
		} else if (com.contains("/registerAction.do")) {
			viewPage = "../registerAction";
		} else if (com.contains("/login.do")) {
			viewPage = "login.jsp";
		} else if (com.contains("/loginAction.do")) {
			viewPage = "../loginAction";
		} else if (com.contains("/Web-source/logoutAction.do")) {
			viewPage = "../logoutAction";
		} else if (com.contains("/findID.do")) {
			viewPage = "find/findID.jsp";
		} else if (com.contains("/findPassword.do")) {
			viewPage = "find/findPassword.jsp";
		} else if (com.contains("/findInfoAction.do")) { // ID or ???????????? ?????? ?????? ?????? ???
			viewPage = "../findInfoAction";
		} else if (com.contains("/category_skinAction.do")) {
			viewPage = "../category_skinAction";
		} else if (com.contains("/purchaseAction.do")) { // ???????????? ??????
			viewPage = "../purchaseAction";
		} else if (com.contains("/purchaseListAction.do")) { // ???????????? ?????? ?????? ???
			viewPage = "../purchaseListAction";
		} else if (com.contains("/shopCartAction.do")) { // ???????????? ?????? ????????????
			viewPage = "../shopCartAction";
		} else if (com.contains("/addToCartAction.do")) { // ???????????? ?????? ?????? ?????????
			viewPage = "../addToCartAction";
		} else if (com.contains("/insertItemAction.do")) { // ?????? ?????? ???
			viewPage = "../insertItemAction";
		} else if (com.contains("/getItemList_to_SubCateAction.do")) { 
			viewPage = "../getItemList_to_SubCateAction";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response); // RequestDispatcher ?????? req??? res????????? ????????????.
	}
}
