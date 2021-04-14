<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String url4 = request.getContextPath()+"/Web-source"; %>
<!DOCTYPE html>
<html>
	<head>
	    <%@include file="../head-file.jsp" %>
		<link rel="stylesheet" href="<%=url4 %>/css/find-style.css" />
		<title>ID/비밀번호 찾기</title>
	</head>
	<body>
		<section class="find">
			<!-- ID / 비밀번호 찾기 버튼 -->
			<div class="buttons">
				<a href="findID.do" class="find-id">ID 찾기</a>
				<span>&nbsp|&nbsp</span>
				<a href="findPassword.do" class="find-password">비밀번호 찾기</a>
			</div>
			<div class="find-id-text">
				<span class="title">ID 찾기</span>
				<span class="content">
					회원가입 시 등록하신 E-mail을 입력해주세요.</br>
					해당 E-mail로 생성된 ID를 보내드립니다.			
				</span>
			</div>
			<form action="findInfoAction.do" method="POST">
			     <fieldset>
			         <input type="text" class="e-mail" placeholder="E-mail" name="email" />
			         <input type="hidden" name="formType" value="ID">
                     <button class="sendBtn">입력 완료</button>
			     </fieldset>
			</form>
			<a href="login.do" class="login-link">로그인</a>
		</section>
	</body>
</html>

<!-- 

	<link rel="stylesheet" href="<%=request.getContextPath()+"/Web-source" %>/css/find-style.css" />
	
	../css/find-style.css : do로 요청을 받아올때 적용 안됨 .  직접실행할 때 적용 됨.
	./css/find-style.css : do로 요청을 받아올때 적용됨 .  직접실행할 때 적용 안됨.
	
	절대경로로
	<link rel="stylesheet" href="<%=request.getContextPath()+"/Web-source" %>/css/find-style.css" />
	do요청과 직접실행 모두 적용 됨
	
	그래서 절대경로로 바꿨습니다!
	
 -->