<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/find-style.css" />
		<title>ID/비밀번호 찾기</title>
	</head>
	<body>
		<section class="find">
			<!-- ID / 비밀번호 찾기 버튼 -->
			<form method="POST" action="../findInfoAction.do">
				<div class="buttons">
					<a href="findID.do" class="find-id">ID 찾기</a>
					<a href="findPassword.do" class="find-password">비밀번호 찾기</a>
				</div>
				<div class="find-id-text">
					<span class="title">ID 찾기</span>
					<span>
						회원가입 시 등록하신 E-mail을 입력해주세요.</br>
						해당 E-mail로 생성된 ID를 보내드립니다.			
					</span>
				</div>
				<input type="email" name="email" class="e-mail" placeholder="E-mail" />
				<input type="hidden" name="formType" value="ID">
				<button class="sendBtn" type="submit">입력 완료</button>
			</form>
			<a href="../login.do" class="login-link">로그인</a>
		</section>
	</body>
</html>