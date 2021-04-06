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
    <title>Shop Cart</title>
    </head>
    <body>
        <!-- insert header 및 navbar file -->
        <%@include file="../header-navbar.jsp" %>
        <%@include file="../aside.jsp" %>
        
        <!-- 본문 시작하는 부분 -->
       <section class="shop-cart set-margin">
           <span class="page-title">Shop Cart</span>
           <div class="cart-list">
               <div class="item-list main-cate-name sub-cate-name">
                  <a href="" class="link">
                     <img src="" alt="" class="img" />
                     <div class="info">
                         <span class="name">item1 name</span>
                         <span class="size-color">색상 : gray / 사이즈 : sizeString</span>
                         <span class="price">100,000</span>
                     </div>
                  </a>
                </div>
                <div class="item-list main-cate-name sub-cate-name">
                  <a href="" class="link">
                     <img src="" alt="" class="img" />
                     <div class="info">
                         <span class="name">item1 name</span>
                         <span class="size-color">색상 : gray / 사이즈 : sizeString</span>
                         <span class="price">100,000</span>
                     </div>
                  </a>
                </div>
                <div class="item-list main-cate-name sub-cate-name">
                  <a href="" class="link">
                     <img src="" alt="" class="img" />
                     <div class="info">
                         <span class="name">item1 name</span>
                         <span class="size-color">색상 : gray / 사이즈 : sizeString</span>
                         <span class="price">100,000</span>
                     </div>
                  </a>
                </div>
           </div>
       </section>
       <%@include file="../footer.jsp" %>
    </body>
</html>