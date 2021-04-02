<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	   <%@include file="./head-file.jsp" %>
	   <title>Register</title>
	   <link rel="stylesheet" href="./css/login-reg.css" />
	   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	</head>
	
	<body>
		<section class="register2">
            <a class="main-page" href="index.do">CROSS SHOPPING</a>
	        <span class="register-title">회원정보 입력</span>
	        <form action="resisterAction.do" method="post">
	           <fieldset>
	               <!-- 이름 -->
	               <div class="input-label-wrap">
	                   <label for="user-name">이름 </label>
	                   <input type="text" name="user-name" id="user-name"/>
	               </div>
	               <!-- 이메일 -->
	               <div class="input-label-wrap">
		               <label for="e-mail">이메일</label>
		               <input type="email" name="e-mail" id="e-mail"/>
	               </div>
                   <!-- 아이디 -->
                   <div class="input-label-wrap">
		               <label for="id">아이디</label>  
		               <input type="text" name="ID" id="id"/>
                   </div>
	               <!-- 비밀번호 -->
	               <div class="input-label-wrap">
		               <label for="password1">비밀번호</label>
		               <input type="password" name="password1" id="password1"/>
	               </div>
	               <!-- 비밀번호 확인 -->
	               <div class="input-label-wrap">
		               <label for="password2">비밀번호 확인</label>
		               <input type="password" name="password2" id="password2"/>
	               </div>
		           <!-- 이부분 없어도 되지 않나요?? 
		                   RE. 저희가 마케팅 정보를 사용자에게 발송할 것이 아니니 해당 tag는 사용안해도 괜찮을 거 같아요!(yu-podong)
		               √  마케팅정보 수신동의   <input type="checkbox" name="phone" value="휴대폰">휴대폰  
		                                <input type="checkbox" name="e-mail" value="이메일">이메일<br> 
		           -->
	           </fieldset>
	           
	            <div class="button-wrap">
	                <button type="submit">가입완료</button>
	                <a href="./index.jsp" type="reset">취소</a>
	            </div>
	         </form>
		</section>
	</body>
</html>