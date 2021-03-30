<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String url4 = request.getContextPath()+"/Web-source"; %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../head-file.jsp" %>
		<link rel="stylesheet" href="../css/find-style.css" />
		<title>ID/비밀번호 찾기</title>
	</head>
	<body>
		<section class="find">
			<!-- ID / 비밀번호 찾기 버튼 -->
			<div class="buttons">
				<a href="../find/findID.jsp" class="find-id">ID 찾기</a>
				<span>&nbsp|&nbsp</span>
				<a href="../find/findPassword.jsp" class="find-password">비밀번호 찾기</a>
			</div>
			<div class="find-password-text">
				<span class="title">Password 찾기</span>
				<span class="content">
					회원가입 시 등록하신 ID를 입력해주세요.</br>
					해당 ID를 생성할 때 작성하신 E-mail로 비밀번호를 보내드립니다.			
				</span>
			</div>
			<form action="">
			     <fieldset>
			         <input type="text" class="e-mail" placeholder="E-mail"/>
                     <button class="sendBtn">입력 완료</button>
			     </fieldset>
			</form>
			<a href="<%=url4 %>/login.jsp" class="login-link">로그인</a>
		</section>
	</body>
</html>
