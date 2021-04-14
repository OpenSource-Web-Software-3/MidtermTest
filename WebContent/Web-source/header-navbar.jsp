<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- web-source까지의 절대 경로 --> 
<% String url2 = request.getContextPath()+"/Web-source"; %>
    
    <!-- 쇼핑페이지 header -->
    <header class="header">
      <div class="set-margin">
        <a class="page-title" href="<%=url2 %>/index.do">
          <span class="logo-name">CROSS SHOPPING</span>
        </a>
      </div>
    </header>

    <!-- navbar : 각 부류 & 로그인, 회원가입, 장바구니, 구매내역-->
    <navbar class="navbar">
      <div class="set-margin">
        <i class="fas fa-bars"></i>
        <ul class="item-ul">
          <li class="item-menu">
            <a href="<%=url2 %>/category_skinAction.do?main_cate=TOP">TOP</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category_skinAction.do?main_cate=Bottom">BOTTOM</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category_skinAction.do?main_cate=Shoes">SHOES</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category_skinAction.do?main_cate=Outer">OUTER</a>
          </li>
          <li class="item-menu">
            <a href="<%=url2 %>/category_skinAction.do?main_cate=Bag">BAG</a>
          </li>
        </ul>
        <ul class="user-ul">
        <!-- 사용자의 로그인 여부를 통해 로그인 / 로그아웃 text 결정 -->
        <% String userID = null;
           if (session.getAttribute("userID") != null) {
                userID = (String)session.getAttribute("userID");
           }%>
              <li class="user-menu">
                <!-- 사용자가 아직 로그인을 안했다면 -->
                <% if(userID == null) { %>
                    <a class="login" href="<%=url2 %>/login.do">로그인</a>
                <% } 
                // 사용자가 로그인을 했다면
                else { %>
                    <a class="log-out" href="logoutAction.do">로그아웃</a>
                <% } %>
              </li>
	          <li class="user-menu">
	            <a href="<%=url2 %>/register1.do">회원가입</a>
	          </li>
	          <li class="user-menu">
	            <!--  -->
	            <a href="<%=url2 %>/shopCartAction.do">장바구니</a>
	          </li>
	          <li class="user-menu">
	            <a href="<%=url2 %>/purchaseListAction.do">구매내역</a>
	          </li>
        </ul>
      </div>
    </navbar>
