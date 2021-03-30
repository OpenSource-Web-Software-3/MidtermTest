<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN page</title>
</head>
<style>
#header {
            background-color: #82b3c9;
            width: 100%;
            height: 80px;
            padding: 5px;
            clear: both;
        }
h1{
  text-align:center;
}
fieldset{
        border-style: solid;
        border-width: 3px;
        border-color: #b3e5fc;
}
</style>
<body>
<div id="header"><h2>GNCO STYLE</h2></div>
<h1>LOGIN</h1>
<hr>
<form method="POST" action="loginAction.do">
<fieldset>

<h2>회원로그인</h2>

<input type="text" name="ID"><br>
<input type="password" name="password"><br>
<button type="submit" style="width: 100px height:100px;">로그인</button><br>
</fieldset>
</form>
<div style="border: 3px solid #b3e5fc;">
<button onclick="location.href='find/findID.do'">아이디 찾기</button>
<button onclick="location.href='find/findPassword.do'">비밀번호 찾기</button>
</div>
</body>
</html>