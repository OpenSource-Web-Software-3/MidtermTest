<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a class="main-page" href="index.do">CROSS SHOPPING</a>
	    <form class="login-form" method="POST" action="loginAction.do">
			<fieldset>
				<span>회원로그인</span>
				<input type="text" name="ID" placeholder="아이디">
				<input type="password" name="password" placeholder="비밀번호">
				<button class="login-btn" type="submit">로그인</button>
			</fieldset>
		</form>
		<div class="btn-wrap">
			<button onclick="location.href='findID.do'">아이디 찾기</button>
			<span>|</span>
			<button onclick="location.href='findPassword.do'">비밀번호 찾기</button>
		</div>
		<a href="register1.do" class="register-link">회원가입</a>
    </section>
</body>
</html>