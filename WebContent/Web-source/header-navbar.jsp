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
                    <a class="log-out" href="<%=url2 %>/index.do">로그아웃</a>
                <% } %>
              </li>
	          <li class="user-menu">
	            <a href="<%=url2 %>/register1.do">회원가입</a>
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
    <script>
        var logout = document.querySelector('.log-out');
        
        // '로그아웃'을 클릭했을 때, 로그아웃 기능을 수행하도록 eventlistener 추가
        logout.addEventListener('click', () => {
        	if(<%= session.getAttribute("userID")%> != null) {
                <% session.setAttribute("userID", null); %>
            }
            else {
                alert('잘못된 접근입니다.\n먼저, 로그인을 진행해주세요.');
            }
        });
    </script>