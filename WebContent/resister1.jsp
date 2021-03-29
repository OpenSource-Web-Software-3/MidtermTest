<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register1 page</title>
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
<form>
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
<input type="checkbox" name="agree" value="total">사이트 이용을 위한 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.<br>

<button type="button"><img src="image/실명인증버튼.PNG"></button>
<button type="button"><img src="image/취소버튼.PNG"></button>

</form>
</body>
</html>