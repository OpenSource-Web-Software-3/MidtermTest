<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="./head-file.jsp" %>
    <title>Main</title>
  </head>
  <body>
    <%@include file="./header-navbar.jsp" %>

    <!-- main-section 시작-->
    <section class="main-section set-margin">
      <img class="banner" src="./image/banner1.jpg" alt="" />
      <span class="new-items-text">New Items</span>
      <!-- 추후에 DB에 있는 item 정보를 가져와서 사용 
            필요 정보 : 해당 items의 URL, 사진
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
    <%@include file ="./footer.jsp" %>
  </body>
</html>
