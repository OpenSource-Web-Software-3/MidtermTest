<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="purchaseList.PurchaseListDTO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.ArrayList"%>  
<% String url7 = request.getContextPath()+"/Web-source"; %>

<!DOCTYPE html>
<html>
	<head>
        <%@include file="../head-file.jsp" %>
        <link rel="stylesheet" href="<%=url7 %>/css/aside-style.css" />
        <link rel="stylesheet" href="<%=url7 %>/css/pur-list-style.css" />
        <script src="./js/aside-function.js" defer></script>
    <title>Purchase List</title>
    </head>
    <body>
	    <%
			ArrayList<String> purchaseDate = null;
		    if(request.getAttribute("purchaseDate") != null){
		    	purchaseDate = (ArrayList<String>) request.getAttribute("purchaseDate");
		    }
		    
			ArrayList<PurchaseListDTO> purchaseItemList = null;
		    if(request.getAttribute("purchaseItemList") != null){
		    	purchaseItemList = (ArrayList<PurchaseListDTO>) request.getAttribute("purchaseItemList");
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
	   <section class="purchase-list set-margin">
	       <span class="page-title">Purchase List</span>
	       
	       <!-- 구매이력 날짜를 기준으로 partition 생성 
	            - 추후에 DB에 있는 정보를 이용하여 반복 생성할 것 
	              + 나중에 class에 main-cate와 sub-cate를 작성해야 함-->
	       
	       	<%
		    	for(int i = 0; i < purchaseDate.size(); i++){
			%>
				 <div class="partition <%=i+1%>">
		           <!-- 사용자가 물건을 구입한 날짜 표시 -->
		           <div class="line-box"><%=purchaseDate.get(i) %></div>
			<%	
		    		for(int j = 0; j < purchaseItemList.size(); j++){
		    			if(!purchaseDate.get(i).equals(purchaseItemList.get(j).getPurchaseDate())) continue;
    		%>
			    		<div class="item-list">
			               <a href="<%=url7 %>/category/item-info.jsp?itemCode=<%=itemList.get(j).getItemCode() %>" class="link">
			                   <img src="${pageContext.request.contextPath}/itemFile/<%=itemImageList.get(j) %>" alt="" class="img" />
		                        <div class="info">
		                            <span class="name"><%=itemList.get(j).getItemName()%></span>
		                            <span class="size-color"><%=itemList.get(j).getItemColor() %> / <%=itemList.get(j).getItemSize() %></span>
		                            <span class="price"><%= itemList.get(j).getItemPrice() %></span>
		                        </div>
			               </a>
			           </div>
    		<%
		    		}
		    %>
		    		</div>
		    <% 		
		    	}
      		%>
	   </section>
	   <!-- right-banner -->
	    <a class="right-banner active" href="insert-item.jsp">
	        <img src="./image/banner/right-banner.png" alt=""  />
	    </a>
	    <button class="more-right-btn">
	        <i class="fas fa-chevron-left"></i>
	    </button>
	   <%@include file="../footer.jsp" %>
	</body>
</html>