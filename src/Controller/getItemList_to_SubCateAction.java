package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import file.FileDAO;
import item.ItemDAO;
import item.ItemDTO;

/**
 * Servlet implementation class getItemList_to_SubCateAction
 */
@WebServlet("/getItemList_to_SubCateAction")
public class getItemList_to_SubCateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String main_cate = "";
		if (request.getParameter("main_cate") != null) {
			main_cate = request.getParameter("main_cate");
		}

		String[] sub_cate = {};
		if (request.getParameterValues("sub_cate") != null) {
			sub_cate = request.getParameterValues("sub_cate");
		}
		
		response.getWriter().write(getJSON(sub_cate, main_cate));
	}

	public String getJSON(String[] sub_cate, String main_cate) {

		ArrayList<ItemDTO> itemList = new ArrayList<>();
		ItemDAO itemDao = new ItemDAO();
		
		if (sub_cate.length == 0) { // 체크를 모두 해제했을 경우 모든 리스트 보여주기 main_cate 가져와야함 
			itemList = itemDao.getItemList(main_cate);
		}else {
			itemList = itemDao.getItemList(sub_cate);
		}

		// JSON formating
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		if (itemList.size() == 0) { // sub_cate에 해당하는 item이 하나도 없는 경우
			return "";
		}

		for (int i = 0; i < itemList.size(); i++) {
			String itemImagePathList = new FileDAO().getFilePath(itemList.get(i).getItemCode());

			result.append("[{\"value\": \"" + itemList.get(i).getItemCode() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getItemName() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getItemPrice() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getItemColor() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getItemSize() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getMain_cate() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getSub_cate() + "\"},");
			result.append("{\"value\": \"" + itemList.get(i).getItemContent() + "\"},");
			result.append("{\"value\": \"" + itemImagePathList + "\"}]");
			if (i != itemList.size() - 1) {
				result.append(",");
			}
		}
		result.append("]}");

		return result.toString();

	}

}
