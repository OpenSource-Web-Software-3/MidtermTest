<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="item.ItemDAO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.ArrayList"%>  
<% String url5 = request.getContextPath()+"/Web-source"; %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="<%= url5 %>/css/item-info.css" />
    <%@include file="../head-file.jsp" %>
 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <title>Item Info</title>
  </head>
  <body>
  
	<%
   		int itemCode = 0;
   		if(request.getParameter("itemCode") != null){
    		itemCode = Integer.parseInt(request.getParameter("itemCode"));
   		}
   		else{} //url로 itemCode를 보내지 않을경우 허용되지 않는 접근(인위적으로 url수정했을 때)
   		ItemDTO itemDto = new ItemDAO().getItem(itemCode); //item정보가져오기
   		String itemImageFile = new FileDAO().getFilePath(itemCode);
   	%>
  
    <!-- navbar 삽입 -->
    <%@include file = "../header-navbar.jsp" %>
    <section class="item-info set-margin">
        <span class="title">Item Description</span>      
        <div class="wrap">
	        <img src="${pageContext.request.contextPath}/itemFile/<%=itemImageFile %>" alt="" class="item-image" />
	        <!-- 각 상품의 data는 나중에 DB에서 값을 가져오기 -->
	        <form method="POST" action="<%=url5 %>/purchase/purchase.jsp">
	            <div class="info">
	                <span class="item-name"><%=itemDto.getItemName() %></span>
	                <ul class="character">
	                    <li class="column-special">
	                       <span>제품 설명</span>
	                       <div class="content"><%=itemDto.getItemContent() %></div>
	                    </li>
	                    <li>
	                        <span>가격</span>
	                        <span class="value"><%=itemDto.getItemPrice() %></span>
	                    </li>
	                    <li>
	                       <!-- 여기 색상도 value에 itemColor를 가져다 쓸 수 있으면 좋겠어요😊 -->
	                        <label for="color">색상</label>
	                        <input type="color" id="color" value="<%=itemDto.getItemColor() %>" disabled />
	                    </li>
	                    <li>
	                        <span>사이즈</span>
	                        <span class="value"><%=itemDto.getItemSize() %></span>
	                    </li>
	                    <li>
	                        <label for="count">수량</label>
	                        <input id="count" name="count" type="number" min="1", max="99", value="1"/>
	                    </li>
	                    <li>
	                        <span>배송비</span>
	                        <span class="value">2,500</span>
	                    </li>
	                    <input type="hidden" name="itemCode" value="<%=itemDto.getItemCode() %>"/> <!-- itemCode랑 같이 form으로 보내야 할 것 같습니다. -->
	                </ul>
	                <!-- shopping cart 정상 수행 - 해당 상품을 장바구니에 담았습니다.
	                     shopping cart 정상 수행X - 잘못된 접근입니다. -->
	                <div class="btns-wrap">
	                    <button class="cartBtn" type="submit" onclick="javascript: form.action='<%=url5%>/addToCartAction.do?itemCode=<%=itemDto.getItemCode()%>';">Shopping Cart</button>
	                    <button type="submit" class="buyBtn"> Buy Now</a>
	                </div>
	            </div>
	        </form>
	        
        </div>
               
    </section>
    
    <a class="right-banner active" href="<%= url5 %>/insert-item.jsp">
        <img src="<%=url5 %>/image/banner/right-banner.png" alt=""  />
    </a>
    <button class="more-right-btn">
        <i class="fas fa-chevron-left"></i>
    </button>
    <%@include file="../footer.jsp" %>
  </body>
</html>
