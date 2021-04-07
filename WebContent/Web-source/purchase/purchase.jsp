<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="item.ItemDAO"%>
<%@ page import="item.ItemDTO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList"%>  
<%@ page import="java.io.PrintWriter"%> 
<% String url6 = request.getContextPath()+"/Web-source"; %>
<!DOCTYPE html>
<html>
	<head>
        <%@include file="../head-file.jsp" %>
        <link rel="stylesheet" href="../css/aside-style.css" />
        <link rel="stylesheet" href="../css/pur-list-style.css" />
    <title>Purchase List</title>
    </head>
    <body>
    
    	<%
    		//로그인 체크(로그인이 안되어 있다면 구매진행 불가)
    		String userID = null;
		    if(session.getAttribute("userID")!=null){
		        userID = (String) session.getAttribute("userID");
		    }
		    
		    if(userID == null){
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('로그인을 해주세요')");
		        script.println("history.back();");
		        script.println("</script>");
		    }
    		
    		int itemCode = 0;
    		if(request.getParameter("itemCode") != null){
	    		itemCode = Integer.parseInt(request.getParameter("itemCode"));
    		}
    		else{} //url로 itemCode를 보내지 않을경우 허용되지 않는 접근(인위적으로 url수정했을 때)
    		
    		int count = 0; //수량
    		if(request.getParameter("count") != null){
				count = Integer.parseInt(request.getParameter("count"));    			
    		}
    		
    		ItemDTO itemDto = new ItemDAO().getItem(itemCode); //item정보가져오기
    		String itemImageFile = new FileDAO().getFilePath(itemCode);
    		
    		UserDAO userDao = new UserDAO();
    		String userName = userDao.getUser(userID).getUserName();
    	%>
    	
        <!-- pur-list-style.css에다 삽입하면 오류가 발생할까봐 따로 style tag 안에 작성-->
        <style>
        html, body {
		    width: 100%;
		    height: 100%;
		    margin: 0px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    background-color: var(--header-back);
		}
        </style>
        <!-- 본문 시작하는 부분 -->
	   <section class="purchase">
	       <!-- 주문/결제 부분 -->
	       <div class="first-part">
	           <span class="title">주문 / 결제</span>
	           <table class="item-info">
	               <tbody>
	                   <tr class="row1">
	                       <td class="col1">이미지</td>
	                       <td class="col2">상품 정보</td>
	                       <td class="col3">수량</td>
	                       <td class="col4">배송비</td>
	                       <td class="col5">금액</td>
	                   </tr>
	                   <tr>
	                       <!-- 해당 부분도 추후에 DB값 불러와서 사용 -->
	                       <td><img src="" alt="" class="item-img" /></td>
	                       <!-- DB에서 가져온 이미지 경로 인데 이미지 사이즈가 커서 다 깨져버리네요! 주석처리 해놓겠습니다.------------------------------- 
	                       		<td><img src="${pageContext.request.contextPath}/itemFile/<%=itemImageFile %>" alt="" class="item-img" /></td>
	                        -->
	                       <td><span><%=itemDto.getItemName() %></br><%=itemDto.getItemColor() %> / <%=itemDto.getItemSize() %></span></td>
	                       <td><%=count %>개</td>
	                       <td>2,500</td>
	                       <td><%=itemDto.getItemPrice() %></td>   
	                   </tr>
	               </tbody>
	           </table>
	       </div>

	       <!-- 구매와 관련된 정보를 입력하는 부분 -->
	       <form action="<%=url6%>/purchaseAction.do" method="POST">
	           <!-- 배송지 정보 입력 part -->
	           <div class="second-part">
	               <span class="title">배송지 정보</span>
	               <div class="user-info-part">
	                   <span>수령인 : <%=userName %></span>
	                   <span>주소</span>
	                   <fieldset class="address-form">
                               <input id="postal-code" name="postal_code" type="text" placeholder="우편주소"/>
                               <input id="user-address" name="user_address" type="text" placeholder="상세주소"/>
                       </fieldset>
	               </div>
	           </div>
	           <!-- 결제 수단을 입력하는 part -->
	           <div class="third-part">
	               <span class="title">결재수단</span>
	                <fieldset class="card-form">
                           <label for="card-company">카드 회사</label>
                           <input id="card-company" name="card_company" type="text" />
                           
                           <label for="card-number">카드 번호</label>
                           <input id="card-number" name="card_number" type="text" />
                           <input type="hidden" name="itemCode" value="<%=itemCode %>" />
                    </fieldset>
	           </div>
	           <!-- 구매 버튼 -->
	           <button class="purchaseBtn">구매하기</button>
	       </form>
	   </section>
	</body>
</html>