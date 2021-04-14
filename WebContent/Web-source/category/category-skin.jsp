<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="item.ItemDAO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="java.util.ArrayList"%>    
<% String url3 = request.getContextPath(); %>
<% String url4 = request.getContextPath()+"/Web-source"; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="../head-file.jsp" %>
    <link rel="stylesheet" href="<%=url4 %>/css/aside-style.css" /> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="./js/aside-function.js" defer></script>
    <title>Bag</title>
  </head> 
  <body>
    <%@include file="../header-navbar.jsp" %>
    <%@include file="../aside.jsp" %>
    <!-- sub-section 시작 : 
      main-section의 css속성을 그대로 가져오고, 
      sub-section으로 main-seciton selector 구분
    -->
    
    <%
		String main_cate = null;
		if(request.getParameter("main_cate") != null){
			main_cate = request.getParameter("main_cate");
		}
    
	    ArrayList<ItemDTO> itemList = new ArrayList<>();
		if(request.getAttribute("itemList") != null){
			itemList = (ArrayList<ItemDTO>) request.getAttribute("itemList");
		}
		
		ArrayList<String> itemImageList = new ArrayList<>();
		if(request.getAttribute("itemImageList") != null){
			itemImageList = (ArrayList<String>) request.getAttribute("itemImageList");
		}
    %>
    
    
    <section class="main-section sub-section set-margin">
      <div class="category-name"><%= main_cate %></div>
      <ul class="category-item-list <%=main_cate%>" id="category-item-list">
       
       <%
       		for(int i = 0; i < itemList.size(); i++){
       %>
                <!-- 여기에 sub_cate를 붙여서 체크된 sub_cate의 이름과 비교해서, 일치하는 sub_cate를 class이름으로 가지고 있는 li만 보이게 하고 싶었습니다. -->	
		        <li class="category-item <%=main_cate%> <%=itemList.get(i).getSub_cate() %> active">
		          <a class="link" href="<%=url4%>/category/item-info.jsp?itemCode=<%=itemList.get(i).getItemCode()%>">
		            <img class="item-img" src="${pageContext.request.contextPath}/itemFile/<%=itemImageList.get(i) %>" alt="" />
		          </a>
		          <div class="item-info <%=main_cate%>">
		            <span class="name"><%=itemList.get(i).getItemName() %></span>
		            <span class="price"><%=itemList.get(i).getItemPrice() %></span>
		          </div>
		        </li>
       <%
       		}
       %>

      </ul>
    </section>
    <!-- right-banner -->
    <a class="right-banner active" href="insert-item.jsp">
        <img src="./image/banner/right-banner.png" alt=""  />
    </a>
    <button class="more-right-btn">
        <i class="fas fa-chevron-left"></i>
    </button>
    <%@include file="../footer.jsp" %>
  </body>
</html>
