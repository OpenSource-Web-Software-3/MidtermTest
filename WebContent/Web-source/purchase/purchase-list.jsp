<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <%@include file="../head-file.jsp" %>
        <link rel="stylesheet" href="../css/aside-style.css" />
        <link rel="stylesheet" href="../css/pur-list-style.css" />
    <title>Purchase List</title>
    </head>
    <body>
        <!-- insert header 및 navbar file -->
        <%@include file="../header-navbar.jsp" %>
        <%@include file="../aside.jsp" %>
        <!-- 본문 시작하는 부분 -->
	   <section class="purchase-list set-margin">
	       <span class="page-title">Purchase List</span>
	       
	       <!-- 구매이력 날짜를 기준으로 partition 생성 
	            - 추후에 DB에 있는 정보를 이용하여 반복 생성할 것 
	              + 나중에 class에 main-cate와 sub-cate를 작성해야 함-->
	       <div class="partition 1">
	           <!-- 사용자가 물건을 구입한 날짜 표시 -->
	           <div class="line-box">2021.04.01</div>
	           <!-- item의 사진과 정보가 표시되는 부분 -->
	           <div class="item-list">
	               <a href="" class="link">
	                   <img src="" alt="" class="img" />
                        <div class="info">
                            <span class="name">Item1</span>
                            <span class="size-color">gray / Large</span>
                            <span class="price">10,000</span>
                        </div>
	               </a>
	           </div>
	           <div class="item-list">
                   <a href="" class="link">
                       <img src="" alt="" class="img" />
                        <div class="info">
                            <span class="name">Item1</span>
                            <span class="size-color">gray / Large</span>
                            <span class="price">10,000</span>
                        </div>
                   </a>
               </div>
	       </div>
	       <!-- 추후 jsp를 이용하여 반복 생성 -->
	       <div class="partition 2">
	           <div class="line-box">2021.03.31</div>
               <div class="item-list">
                   <a href="" class="link">
                       <img src="" alt="" class="img" />
                        <div class="info">
                            <span class="name">Item2</span>
                            <span class="size-color">yellow / XXL</span>
                            <span class="price">20,000</span>
                        </div>
                   </a>
               </div>
	       </div>
	   </section>
	   <%@include file="../footer.jsp" %>
	</body>
</html>