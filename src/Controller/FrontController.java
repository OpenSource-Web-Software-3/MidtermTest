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

		if (com.equals("/index.do")) {
			viewPage = "index.jsp";
		} else if (com.equals("/resister1.do")) {
			viewPage = "resister1.jsp";
		} else if (com.equals("/resister2.do")) {
			viewPage = "resister2.jsp";
		} else if (com.equals("/resisterAction.do")) {
			viewPage = "resisterAction";
		} else if (com.equals("/login.do")) {
			viewPage = "login.jsp";
		} else if (com.equals("/loginAction.do")) {
			viewPage = "loginAction";
		} else if (com.equals("/find/findID.do")) {
			viewPage = "findID.jsp";
		} else if (com.equals("/find/findPassword.do")) {
			viewPage = "findPassword.jsp";
		} else if (com.equals("/findInfoAction.do")) {
			viewPage = "findInfoAction";
		} 

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response); // RequestDispatcher 현재 req와 res객체를 공유한다.
	}
}