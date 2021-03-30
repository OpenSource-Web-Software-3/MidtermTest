<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String url3 = request.getContextPath(); 
    url3 += "/Web-source";%>
<!DOCTYPE html>
<html>
	<head>
	   <%@include file="./head-file.jsp" %>
	   <link rel="stylesheet" href="./css/login-reg.css" />
	   <title>LOGIN page</title>
	</head>
<style>

</style>
<body>
    <!-- login 부분 -->
    <section class="login">
        <a class="main-page" href="./index.jsp">CROSS SHOPPING</a>
	    <form class="login-form" method="POST" action="loginAction.do">
			<fieldset>
				<span>회원로그인</span>
				<input type="text" name="ID" placeholder="아이디">
				<input type="password" name="password" placeholder="비밀번호">
				<button class="login-btn" type="submit">로그인</button>
			</fieldset>
		</form>
		<div class="btn-wrap">
			<button onclick="location.href='<%=url3 %>/find/findID.jsp'">아이디 찾기</button>
			<span>|</span>
			<button onclick="location.href='<%=url3 %>/find/findPassword.jsp'">비밀번호 찾기</button>
		</div>
    </section>
</body>
</html>