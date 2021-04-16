package Controller;

import java.io.IOException;
import java.util.ArrayList;

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
import shopCart.ShopCartDAO;
import shopCart.ShopCartDTO;

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

		HttpSession session = request.getSession(true);

		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		String main_cateOfcategorySkin = null; // category-skin.jsp 에서 넘어오는 변수
		if (request.getParameter("main_cateOfcategorySkin") != null
				|| request.getParameter("main_cateOfcategorySkin").equals("")) {
			main_cateOfcategorySkin = request.getParameter("main_cateOfcategorySkin");
		}

		String pageTitle = null; // purchaseList or shopcart 에서 넘어오는 변수
		if (request.getParameter("pageTitle") != null) {
			pageTitle = request.getParameter("pageTitle");
		}

		String[] main_cate = {};
		if (request.getParameter("main_cate") != null) {
			main_cate = request.getParameterValues("main_cate");
		}

		String[] sub_cate = {};
		if (request.getParameterValues("sub_cate") != null) {
			sub_cate = request.getParameterValues("sub_cate");
		}
		response.getWriter().write(getJSON(sub_cate, main_cate, main_cateOfcategorySkin, pageTitle, userID));
	}

	public String getJSON(String[] sub_cate, String[] main_cate, String main_cateOfcategorySkin, String pageTitle,
			String userID) {

		ArrayList<ItemDTO> itemList = new ArrayList<>();
		ArrayList<PurchaseListDTO> purchaseList = new ArrayList<>();
		ArrayList<ShopCartDTO> shopCartList = new ArrayList<>();
		ArrayList<String> purchaseDateList = new ArrayList<>();

		ItemDAO itemDao = new ItemDAO();

		System.out.println("page Title : " + pageTitle);
		System.out.println("main_categorySkin : " + main_cateOfcategorySkin);

		if (sub_cate.length == 0) { // 체크를 모두 해제했을 경우 모든 리스트 보여주기 main_cate 가져와야함
			if (main_cateOfcategorySkin != null) { // category-skin.jsp에서의 호출일 경우
				itemList = itemDao.getItemList(main_cateOfcategorySkin);
			} else if (pageTitle != null && pageTitle.equals("Purchase List")) { // Purchase List에서의 호출일 경우
				purchaseList = new PurchaseListDAO().getPurchaseItem(userID);
				for (int i = 0; i < purchaseList.size(); i++)
					itemList.add(new ItemDAO().getItem(purchaseList.get(i).getItemCode()));
				purchaseDateList = new PurchaseListDAO().getPurchaseDate(userID, itemList);
			} else if (pageTitle != null && pageTitle.equals("Shop Cart")) { // Shop Cart에서의 호출일 경우
				shopCartList = new ShopCartDAO().getShopCartItem(userID);
				for (int i = 0; i < shopCartList.size(); i++)
					itemList.add(new ItemDAO().getItem(shopCartList.get(i).getItemCode()));
			} else {
				System.out.println("AJAX ERROR!");
			}
		} else { // chechbox가 하나라도 체크가 되어 있다면
			if (main_cateOfcategorySkin != null && !main_cateOfcategorySkin.equals("")) {
				itemList = itemDao.getItemList(sub_cate, main_cate);
			} else if (pageTitle != null && pageTitle.equals("Purchase List")) {
				purchaseList = new PurchaseListDAO().getPurchaseItem(userID); // 해당 아이디의 장바구니 목록을 모두 가져온다

				System.out.println("purchaseList iszeo : " + purchaseList.size()); //해당되지 않는 item remove
				for (int i = purchaseList.size() - 1; i >= 0 ; i--) {
					if (itemDao.getItem(sub_cate, main_cate, purchaseList.get(i).getItemCode()) == null) {
						purchaseList.remove(i);
					}
				}
				
				System.out.println("list Item : " + itemList.size());
				System.out.println("purchaseList iszeo (after) : " + purchaseList.size());
				
				for (int i = 0; i < purchaseList.size(); i++) { // 해당되는 item저장
					itemList.add(new ItemDAO().getItem(purchaseList.get(i).getItemCode()));
				}
				
				if (itemList.size() != 0) {
					purchaseDateList = new PurchaseListDAO().getPurchaseDate(userID, itemList);
				}

				

			} else if (pageTitle != null && pageTitle.equals("Shop Cart")) {
				shopCartList = new ShopCartDAO().getShopCartItem(userID); // 해당 아이디의 장바구니 목록을 모두 가져온다
				for (int i = 0; i < shopCartList.size(); i++) { // 그중에 sub,main cate에 해당하는 것만 가져온다
					if (new ItemDAO().getItem(sub_cate, main_cate, shopCartList.get(i).getItemCode()) != null) {
						itemList.add(new ItemDAO().getItem(sub_cate, main_cate, shopCartList.get(i).getItemCode()));
					}
				}
				shopCartList.clear();
				for (int i = 0; i < itemList.size(); i++) { // 해당하는 item에 해당하는 장바구니 목록을 가져온다
					shopCartList.add(new ShopCartDAO().getShopCartItem(itemList.get(i).getItemCode(), userID));
				}

			} else {
				System.out.println("AJAX ERROR!");
			}
		}

		// JSON formating
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		// 중요
		if (itemList.size() == 0) { // sub_cate에 해당하는 item이 하나도 없는 경우
			return "";
		}

		System.out.println("itemList size : " + itemList.size());
		System.out.println("shopcart List size : " + shopCartList.size());
		System.out.println("purchaseList size : " + purchaseList.size());

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
			result.append("{\"value\": \"" + itemImagePathList + "\"}");

			if (pageTitle.equals("Purchase List")) {
				result.append(",{\"value\": \"" + purchaseList.get(i).getID() + "\"},");
				result.append("{\"value\": \"" + purchaseList.get(i).getPurchaseDate() + "\"},");
				result.append("{\"value\": \"" + purchaseList.get(i).getFolderName() + "\"},");
				result.append("{\"value\": \"" + purchaseList.get(i).getUserAddress() + "\"},");
				result.append("{\"value\": \"" + purchaseList.get(i).getCardNumber() + "\"}]");
			} else if (pageTitle.equals("Shop Cart")) {
				result.append(",{\"value\": \"" + shopCartList.get(i).getID() + "\"},");
				result.append("{\"value\": \"" + shopCartList.get(i).getAddDate() + "\"},");
				result.append("{\"value\": \"" + shopCartList.get(i).getFolderName() + "\"}]");
			} else {
				result.append("]");
			}

			if (i != itemList.size() - 1) {
				result.append(",");
			}
		}

		if (pageTitle.equals("Purchase List")) {
			result.append("], \"date\":[");
			for (int i = 0; i < purchaseDateList.size(); i++) {
				result.append("{\"value\": \"" + purchaseDateList.get(i) + "\"}");
				if (i != purchaseDateList.size() - 1) {
					result.append(",");
				}
			}
		}

		if (pageTitle.equals("Purchase List"))
			result.append("], \"flag\":\"Purchase List\"}");
		else if (pageTitle.equals("Shop Cart"))
			result.append("], \"flag\":\"Shop Cart\"}");
		else
			result.append("], \"flag\":\"category-skin\"}"); // category-skin.jsp

		System.out.println(result);
		return result.toString();

	}

}
