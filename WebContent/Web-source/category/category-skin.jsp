<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="item.ItemDAO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="java.util.ArrayList"%>    
<% String url4 = request.getContextPath()+"/Web-source"; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@include file="../head-file.jsp" %>
    <link rel="stylesheet" href="<%=url4 %>/css/aside-style.css" /> 
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
      <ul class="category-item-list bag">
       
       <%
       		for(int i = 0; i < itemList.size(); i++){
       %>	
		        <li class="category-item bag">
		          <a class="link" href="<%=url4%>/category/item-info.jsp?itemCode=<%=itemList.get(i).getItemCode()%>">
		            <img class="item-img" src="${pageContext.request.contextPath}/itemFile/<%=itemImageList.get(i) %>" alt="" />
		          </a>
		          <div class="item-info bag">
		            <span class="name"><%=itemList.get(i).getItemName() %></span>
		            <span class="price"><%=itemList.get(i).getItemPrice() %></span>
		          </div>
		        </li>
       <%
       		}
       %>

      </ul>
    </section>
    <%@include file="../footer.jsp" %>
  </body>
</html>