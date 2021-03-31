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
		} else if (com.contains("/resister1.do")) {
			viewPage = "resister1.jsp";
		} else if (com.contains("/resister2.do")) {
			viewPage = "resister2.jsp";
		} else if (com.contains("/resisterAction.do")) {
			viewPage = "../resisterAction";
		} else if (com.contains("/login.do")) {
			viewPage = "login.jsp";
		} else if (com.contains("/loginAction.do")) {
			viewPage = "../loginAction";
		} else if (com.contains("/findID.do")) {
			viewPage = "find/findID.jsp";
		} else if (com.contains("/findPassword.do")) {
			viewPage = "find/findPassword.jsp";
		} else if (com.contains("/findInfoAction.do")) {
			viewPage = "../findInfoAction";
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response); // RequestDispatcher 현재 req와 res객체를 공유한다.
	}
}
