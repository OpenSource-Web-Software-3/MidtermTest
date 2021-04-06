<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- 기본적으로 head안에 들어갈 것들을 작성한 jsp include -->
    <script type="text/javascript" src="./js/main.js" defer></script>
    <%@include file="./head-file.jsp" %>
    <title>Cross shopping</title>
  </head>
  <body>
    <!-- 홈페이지에서 header, navbar tag를 생성한 jsp file include -->
    <%@include file="./header-navbar.jsp" %>
    
    <!-- main-section 시작-->
    <section class="main-section set-margin">
      <!-- banner가 보여지는 곳 -->
      <div class="banner-slide">
        <ul class="list">
            <!-- 일부로 순서를 바꿨습니다. -->
            <li class="active"><img class="banner 1 " src="./image/banner/banner1.png" alt="" /></li>
            <li><img class="banner 2 " src="./image/banner/banner2.png" alt="" /></li>
            <li><img class="banner 3 " src="./image/banner/banner3.png" alt="" /></li>            
        </ul>
        <div class="btn-wrap">
            <button class="left"><i class="fas fa-chevron-left"></i></button>
            <button class="right"><i class="fas fa-chevron-right"></i></button>
        </div>
        <ul class="indicate">
            <li class="active"></li>
            <li></li>
            <li></li>
        </ul>
      </div>
      
      
      <span class="new-items-text">New Items</span>
      <!-- 추후에 DB에 있는 마지막 4개의 item 정보를 가져와서 사용 
            필요 정보 : 해당 items의 URL, 사진,
      -->
      <ul class="new-item-list">
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
        <li>
          <a href="">
            <img src="" alt="" class="items" />
          </a>
        </li>
      </ul>
    </section>
    <!-- footer tag를 생성할 jsp file include -->
    <%@include file ="./footer.jsp" %>
  </body>
</html>

