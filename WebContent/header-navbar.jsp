<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 쇼핑페이지 header : 로고 -->
    <header class="header">
      <div class="set-margin">
        <a class="page-title" href="./index.jsp">
          <i class="fas fa-barcode"></i>
          <span class="logo-name">Cross Shopping mall</span>
        </a>
      </div>
    </header>

    <!-- navbar : 각 부류 & 로그인, 회원가입, 장바구니, 구매내역-->
    <navbar class="navbar">
      <div class="set-margin">
        <ul>
          <li class="item-menu">
            <a href="">TOP</a>
          </li>
          <li class="item-menu">
            <a href="">BOTTOM</a>
          </li>
          <li class="item-menu">
            <a href="./shoes.jsp">SHOES</a>
          </li>
          <li class="item-menu">
            <a href="./outer.jsp">OUTER</a>
          </li>
          <li class="item-menu">
            <a href="./bag.jsp">BAG</a>
          </li>
          <li class="user-menu">
            <a href="login.do">로그인</a>
          </li>
          <li class="user-menu">
            <a href="resister1.do">회원가입</a>
          </li>
          <li class="user-menu">
            <a href="">장바구니</a>
          </li>
          <li class="user-menu">
            <a href="">구매내역</a>
          </li>
        </ul>
      </div>
    </navbar>