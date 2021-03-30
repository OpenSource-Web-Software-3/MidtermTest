<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register1 page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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

	<script type="text/javascript">
		$(document).ready(function(){
			//checkbox select all 
			$('input:checkbox[name=agreeAll]').change(function(){
		        if($('input:checkbox[name=agreeAll]').is(':checked') == true){
		        	$('input[name=agree]:checkbox').prop('checked', true);
		        }else{
		        	$('input[name=agree]:checkbox').prop('checked', false);
		        }
		    });		
			
			
			//체크여부(3개 모두 체크시 resister2.jsp로 이동)
			$('#nextPage').click(function(){
				
				if ($('input[name=agree]:checked').length == $('input[name=agree]:checkbox').length) {
					 location.href = 'resister2.do?agreeCheck=true';
				}
				else{
					alert('개인정보제공동의란을 모두 체크해주세요');
				}
				
				
			});
		});
		
	</script>
	
</head>
<style>
#header {
            background-color: #82b3c9;
            width: 100%;
            height: 80px;
            padding: 5px;
            clear: both;
        }
h2{
text-align: center;
}
 ul {
            list-style: none;
            text-align: center;
            border-top:1px solid black; border-bottom:1px solid black; padding:10px 0;
            padding: 10px 0px;
            font-size: 10px;
        }

            ul li {
                display: inline;
                padding: 0px 10px;
                letter-spacing: 10px;
            }

                ul li a {
                    text-decoration: none;
                    color: black;
                }

                    ul li a:hover {
                        text-decoration: underline;
                        color: aqua;
                    }
</style>
<body>
<div id="header"><h1>GNCO STYLE</h1></div>
<h2>통합 회원가입</h2>
<ul>
<li><strong>01.약관동의</strong></li>
<li>02.회원정보입력</li>
<li>03.가입완료</li>
</ul>

<input type="checkbox" name="agree" value="service">서비스 이용약관(필수)<br>
<textarea name="agree" rows="5" cols="50">
</textarea>

<br>
<input type="checkbox" name="agree" value="deal">전자금융거래 이용약관(필수)<br>
<textarea name="agree" rows="5" cols="50">
</textarea>

<br>
<input type="checkbox" name="agree" value="private">개인정보 수집/이용에 대한 동의(필수)<br>
<textarea name="agree" rows="5" cols="50">
</textarea>

<br>
<input type="checkbox" name="agreeAll" value="total">사이트 이용을 위한 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.<br>

<a type="button" id = "nextPage"><img src="image/실명인증버튼.PNG"></button>
<a href = "index.jsp" type="button" ><img src="image/취소버튼.PNG"></a></button>

</form>

</body>
</html>