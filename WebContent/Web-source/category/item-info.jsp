<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String url5 = request.getContextPath()+"/Web-source"; %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="../head-file.jsp" %>
    <link rel="stylesheet" href="<%= url5 %>/css/item-info.css" />
    <title>Item Info</title>
  </head>
  <body>
    <!-- navbar 삽입 -->
    <%@include file = "../header-navbar.jsp" %>
    <section class="item-info set-margin">      
        <img src="#" alt="" class="item-image" />
        <!-- 각 상품의 data는 나중에 DB에서 값을 가져오기 -->
        <div class="info">
            <span class="item-name">item name</span>
            <ul class="character">
                <li>
                    <span>가격</span>
                    <span class="value">10,000</span>
                </li>
                <li>
                    <label for="color">색상</label>
                    <input type="color" id="color" disabled />
                </li>
                <li>
                    <span>사이즈</span>
                    <span class="value">large</span>
                </li>
                <li>
                    <label for="count">수량</label>
                    <input id="count" type="number" min="1", max="99", value="1"/>
                </li>
                <li>
                    <!-- 배송비는 고정으로 가죠..ㅎㅎ -->
                    <span>배송비</span>
                    <span class="value">2,500</span>
                </li>
            </ul>
            <!-- shopping cart 정상 수행 - 해당 상품을 장바구니에 담았습니다.
                 shopping cart 정상 수행X - 잘못된 접근입니다. -->
            <div class="btns-wrap">
	            <button class="cartBtn">Shopping Cart</button>
	            <a href="<%=url5 %>/purchase/purchase.jsp" class="buyBtn"> Buy Now</a>
            </div>
        </div>
    </section>
    <%@include file="../footer.jsp" %>
  </body>
</html>
