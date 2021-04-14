<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
	    <%@include file="./head-file.jsp" %>
	    <link rel="stylesheet" href="./css/login-reg.css" />
	    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<title>Register</title>
	</head>
	
	<body>
	    <!-- register 부분 -->
	    <section class="register1">
	        <!-- 사용자 ID를 통해 올바른 접근인지 확인 (종종 꼬여서 잘못 link타는 경우도 존재하기 때문에) -->
	        <%
			    String userID = null;
			    if(session.getAttribute("userID")!=null){
			        userID = (String) session.getAttribute("userID");
			    }
			    
			    if(userID != null){
			        PrintWriter script = response.getWriter();
			        script.println("<script>");
			        script.println("alert('현재 로그인 되어 있습니다.')");
			        script.println("location.href = 'index.do'");
			        script.println("</script>");
			    }
			%>
	    
	        <a class="main-page" href="index.do">CROSS SHOPPING</a>
	        <span class="register-descript">회원가입약관 및 개인정보처리방침 안내에 동의하셔야 회원가입을 하실 수 있습니다.
	        </span>
	        <!-- 회원가입약관 동의 -->
	        <div class="button-label-wrap">
		        <input type="checkbox" id="first-check" />
	            <label for="first-check">회원가입약관 동의 <span class="accent">(필수)</span> </label>
	        </div>
	        
	        <span class="agree1">
	           <!-- 약관 내용을 jsp로 만들어서 include -->
	           <%@include file="./register-terms/terms1.jsp"%>
	        </span>
	        
	        <!-- 개인정보처리방침안내 동의 -->
	        <div class="button-label-wrap">
		        <input type="checkbox" id="second-check"/>
		        <label for="second-check">개인정보처리방침안내 동의 <span class="accent">(필수)</span></label>
	        </div>
	        <table class="agree2">
	           <tr class="first-row">
	               <td>목적</td>
	               <td>항목</td>
	               <td>보유기간</td>
	           </tr>
	           <tr class="second-row">
	               <td>이용자 식별 및 본인여부 확인</td>
	               <td>아이디, 이름, 비밀번호</td>
	               <td>회원탈퇴 시까지</td>
	           </tr>
	           <tr class="third-row">
	               <td>고객서비스 이용에 관한 통지</td>
	               <td>이메일</td>
	               <td>회원탈퇴 시까지</td>
	           </tr>
	        </table>
	        <div class="button-label-wrap">
		        <input type="checkbox" id="all-check" />
		        <label for="all-check">전체동의</label>
	        </div>
	        
	        <a href="" class="next">다음</a>
	    </section>
	</body>
</html>

<script type="text/javascript">
    var countCheck;
    $(document).ready(function(){
        //checkbox select all 
        $('input:checkbox[id=all-check]').change(function(){
            if($('input:checkbox[id=all-check]').is(':checked') == true){
                $('input[id=first-check]:checkbox').prop('checked', true);
                $('input[id=second-check]:checkbox').prop('checked', true);
            }else{
                $('input[id=first-check]:checkbox').prop('checked', false);
                $('input[id=second-check]:checkbox').prop('checked', false);
            }
        });     
        
        //체크여부(3개 모두 체크시 resister2.jsp로 이동)
        $('.next').click(function(){
        	// all-check가 체크 여부를 판단 => input[type="checkbox"]개수 count
        	if($('input:checkbox[id=all-check]').is(':checked') == true){
                countCheck = $('input[type=checkbox]:checked').length-1;
            }
        	else {
        		countCheck = $('input[type=checkbox]:checked').length;
        	}
        	
        	//마지막 all-check를 제외한 input[type='checkbox']의 개수와 같을 경우로 조건식 수정함
            if (countCheck == $('input[type=checkbox]').length-1) {
                 $('.next').attr('href', 'register2.do?agreeCheck=true');
            }
            else{
                alert('개인정보제공동의란을 모두 체크해주세요.');
            }
        });
    });
</script>

