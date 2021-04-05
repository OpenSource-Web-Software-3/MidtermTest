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
import purchaseList.PurchaseListDAO;
import purchaseList.PurchaseListDTO;


/**
 * Servlet implementation class purchaseListAction
 */
@WebServlet("/purchaseListAction")
public class purchaseListAction extends HttpServlet {
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
		
		/////////////이미 구매한 상품인지 체크?///////////
		
		/* -- 가져 올 데이터들 --
		 * 1. Date 가져오기
		 * 2. purchaseList 가져오기
		 * 3. 구매목록 item에 해당하는 item정보 가져오기
		 * 4. 해당 이미지 파일들 가져오기
		 */
		
		PurchaseListDAO purchaseListDao = new PurchaseListDAO();
		ItemDAO itemDao = new ItemDAO();
		FileDAO fileDao = new FileDAO();
		
		
		ArrayList<String> purchaseDate = purchaseListDao.getPurchaseDate(userID); // 1.Date 가져오기
		ArrayList<PurchaseListDTO> purchaseItemList = purchaseListDao.getPurchaseItem(userID); // 2.purchaseList 가져오기
		
		
		// ----- 3.현재 구매목록 item에 해당하는 item정보 가져오기 -----
		// purchaseList는 item테이블의 컬럼 + purchaseList의 컬럼으로 만들어짐(purchaseList속성에 없는 item의 정보가 있기 때문에)
		//(SQL join연산을 해도 마땅히 받아올 변수가 없음)
		ArrayList<ItemDTO> itemList = new ArrayList<ItemDTO>(); 
		
		for (int i = 0; i < purchaseItemList.size(); i++) {
			itemList.add(itemDao.getItem(purchaseItemList.get(i).getItemCode()));
			itemList.get(i).getItemCode();
		}
		
		// 4.해당 이미지 파일들 가져오기
		ArrayList<String> itemImageList = new ArrayList<String>();
		for (int i = 0; i < purchaseItemList.size(); i++) {
			itemImageList.add(fileDao.getFilePath(purchaseItemList.get(i).getItemCode()));
		}

		request.setAttribute("purchaseDate", purchaseDate);
		request.setAttribute("purchaseItemList", purchaseItemList);
		request.setAttribute("itemList", itemList);
		request.setAttribute("itemImageList", itemImageList);

		dispatcher = context.getRequestDispatcher("/Web-source/purchase/purchase-list.jsp");
		dispatcher.forward(request, response);

		
	}

}
