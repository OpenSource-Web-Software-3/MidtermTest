<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- web-source까지의 절대 경로 --> 
<% String url2 = request.getContextPath()+"/Web-source"; %>

    <!-- 쇼핑페이지 header -->
    <header class="header">
      <div class="set-margin">
        <a class="page-title" href="index.do">
          <span class="logo-name">CROSS SHOPPING</span>
        </a>
      </div>
    </header>

    <!-- navbar : 각 부류 & 로그인, 회원가입, 장바구니, 구매내역-->
    <navbar class="navbar">
      <div class="set-margin">
        <ul class="item-ul">
          <li class="item-menu">
            <a href="<%=url2 %>/category/top.jsp">TOP</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category/bottom.jsp">BOTTOM</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category/shoes.jsp">SHOES</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category/outer.jsp">OUTER</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category/bag.jsp">BAG</a>
          </li>
        </ul>
        <ul class="user-ul">
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