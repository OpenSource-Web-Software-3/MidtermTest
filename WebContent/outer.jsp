<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="./head-file.jsp" %>
    <link rel="stylesheet" href="./css/aside-style.css" />
    <title>Outer</title>
  </head>
  <body>
    <%@include file = "./header-navbar.jsp" %>
    <%@include file="./aside.jsp" %>
    <!-- sub-section 시작 : 
      main-section의 css속성을 그대로 가져오고, 
      sub-section으로 main-seciton selector 구분
    -->
    <section class="main-section sub-section set-margin">
      <div class="category-name">OUTER</div>
      <ul class="category-item-list outer">
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="./image/outer/outer1.jpg" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
        <li class="category-item outer">
          <a class="link" href="">
            <img class="item-img" src="" alt="" />
          </a>
          <div class="item-info outer">
            <span class="name">일반 outer - black</span>
            <span class="price">45,000</span>
          </div>
        </li>
      </ul>
    </section>
    <%@include file="./footer.jsp" %>
  </body>
</html>