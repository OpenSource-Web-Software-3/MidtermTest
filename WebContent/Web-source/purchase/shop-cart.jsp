<%@page import="shopCart.ShopCartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="purchaseList.PurchaseListDTO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.ArrayList"%>  
<% String url8 = request.getContextPath()+"/Web-source"; %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../head-file.jsp" %>
        <link rel="stylesheet" href="<%=url8 %>/css/aside-style.css" />
        <link rel="stylesheet" href="<%=url8 %>/css/pur-list-style.css" />
        <script src="<%=url8 %>/js/aside-function.js" defer></script>
    <title>Shop Cart</title>
    </head>
    <body>
      <%
			//ArrayList<String> addDateList = null;
		    //if(request.getAttribute("addDateList") != null){
		    //	addDateList = (ArrayList<String>) request.getAttribute("addDateList");
		    //}
		    
			ArrayList<ShopCartDTO> shopCartList = null;
		    if(request.getAttribute("shopCartList") != null){
		    	shopCartList = (ArrayList<ShopCartDTO>) request.getAttribute("shopCartList");
		    }
		    
			ArrayList<ItemDTO> itemList = null;
		    if(request.getAttribute("itemList") != null){
		    	itemList = (ArrayList<ItemDTO>) request.getAttribute("itemList");
		    }
		    
			ArrayList<String> itemImageList = null;
		    if(request.getAttribute("itemImageList") != null){
		    	itemImageList = (ArrayList<String>) request.getAttribute("itemImageList");
		    }
		    
	    %>
	    
        <!-- insert header 및 navbar file -->
        <%@include file="../header-navbar.jsp" %>
        <%@include file="../aside.jsp" %>
        
        <!-- 본문 시작하는 부분 -->
       <section class="shop-cart set-margin">
           <span class="page-title">Shop Cart</span>
           
           <%
           		for(int i = 0; i < shopCartList.size(); i++){
           %>
		           <div class="cart-list">
		               <div class="item-list main-cate-name sub-cate-name">
		                  <a href="<%=url8 %>/category/item-info.jsp?itemCode=<%=itemList.get(i).getItemCode() %>" class="link">
		                     <img src="${pageContext.request.contextPath}/itemFile/<%=itemImageList.get(i) %>" alt="" class="img" />
		                     <div class="info">
		                         <span class="date"><%=shopCartList.get(i).getAddDate() %></span>
		                         <span class="name"><%=itemList.get(i).getItemName() %></span>
		                         <span class="size-color">색상 : <%=itemList.get(i).getItemColor() %> / 사이즈 : <%=itemList.get(i).getItemSize() %></span>
		                         <span class="price">가격 : <%=itemList.get(i).getItemPrice() %></span>
		                     </div>
		                  </a>
		                </div>
		           </div>
           <%
           		}	
           %>
           
       </section>
       <%@include file="../footer.jsp" %>
    </body>
</html>