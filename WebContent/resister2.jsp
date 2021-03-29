<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register2 page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

//	$(document).ready(function(){
//		$('#email-option').change(function(){
//			if ($(this).val() == '직접입력') {
//				$('#EmailDomain').val('');
//			}
//			else{
//				$('#EmailDomain').val($(this).val());
//			}
//		});
//	});
</script>

</head>

<body>
<div id="header"><h1>GNCO STYLE</h1></div>
<h2>통합 회원가입</h2>
<ul>
<li>01.약관등의</li>
<li><strong>02.회원정보입력</strong></li>
<li>03.가입완료</li>
</ul>
<h5>√ 표시는 필수 입력 항목입니다.</h5>
<h4>회원정보는 개인정보 보호방침 ·취급방침에 따라 안전하게 보호됩니다.</h4>
 <form action="resisterAction.do" method="post">
   <fieldset>
       이름    <input type="text" name="user-name"/><br/>
   √  아이디    <input type="text" name="ID" /><br />    
   √  비밀번호    <input type="password" name="password1" /><br />
   √  비밀번호 확인    <input type="password" name="password2" /><br />
   √  이메일   <input type="email" name="e-mail" />
   <!-- 이부분 없어도 되지 않나요?? 
   
   √  마케팅정보 수신동의   <input type="checkbox" name="phone" value="휴대폰">휴대폰  
                    <input type="checkbox" name="e-mail" value="이메일">이메일<br> 
   
                    -->
   </fieldset>
      
        <button type="submit"><img src="image/가입완료.PNG"></button>
        <button type="reset"><img src="image/취소.PNG"></button>
    
    </form>
    
   <style type="text/css">
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
h5{
  text-align:right;
}
</style>
    
</body>
</html>