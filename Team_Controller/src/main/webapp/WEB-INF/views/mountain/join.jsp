<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<style type="text/css">
		@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		
		body{font-family: 'Pretendard-Regular';}
		
        form > hr{
            width: 600px;
        }

        .join_box {
            width: 1000px;
            margin: 0 auto;
            text-align: center;
            margin-top: 150px;
            margin-bottom: 299px;
        }

        .join_logo {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 60px;
            display: inline-block;
            margin-top: -20px;
        }

        .input_span {
            text-align: center;
            width: 100px;
            display: inline-block;
            margin-right: 50px;
        }

        .join_input {
            width: 200px;
            height: 20px;
        }

        .join_submit {
            width: 170px;
            height: 45px;
            background: white;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 20px;
        }

        .join_reset {
            width: 170px;
            height: 45px;
            background: white;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>

<body>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
    <div class="join_box">

        <span class="join_logo">회원가입</span>
        
        <form name="join_form" action="join_result" method="post">
        	
            <span class="input_span">ID</span> <span class="userId_input_join"><input class="join_input" type="text" name="userId"></input></span><br>
            <hr>
            <span class="input_span">비밀번호</span> <span class="password_input_join"><input class="join_input" type="password" name="password"></span><br>
            <hr>
            <span class="input_span">비밀번호확인</span> <span class="password_check_input_join"><input class="join_input" type="password" name="password_check"></span><br>
            <hr>
            <span class="input_span">이름</span> <span class="name_input_join"><input class="join_input" type="text" name="name"></span><br>
            <hr>
            <span class="input_span">이메일</span> <span class="email_input_join"><input class="join_input" type="text" name="email"></span><br>
            <hr>

            <input class="join_submit" type="submit" value="회원가입"> <input type="reset" class="join_reset">
            
        </form>

    </div>
</body>
<script type="text/javascript">
    var join_form = document.join_form;
    var err = document.createElement("span");

    var userId_input_join = document.querySelector(".userId_input_join");
    var password_input_join = document.querySelector(".password_input_join")
    var password_check_input_join = document.querySelector(".password_check_input_join")
    var name_input_join = document.querySelector(".name_input_join")
    var email_input_join = document.querySelector(".email_input_join")

    join_form.onsubmit = function(){
        var userId = join_form.userId;
        var password = join_form.password;
        var password_check = join_form.password_check;
        var name = join_form.name;
        var email = join_form.email;

        var userIdValue = userId.value.trim();
        var passwordValue = password.value.trim();
        var password_checkValue = password_check.value.trim();
        var nameValue = name.value.trim();
        var emailValue = email.value.trim();

        var userIdPattern = /^[a-zA-Z가-힣0-9]{5,}$/;
        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$/;
        var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if(userIdValue == ""){
            err.innerHTML = "id를 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            userId_input_join.insertBefore(err, userId.nextElementSibling);
            userId.focus();
            return false;
        }
        if(!userIdPattern.test(userIdValue)){
            err.innerHTML = "5자 이상 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            userId_input_join.insertBefore(err, userId.nextElementSibling);
            userId.focus();
            return false;
        }
        if(passwordValue == ""){
            err.innerHTML = "비밀번호를 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            password_input_join.insertBefore(err, password.nextElementSibling);
            password.focus();
            return false;
        }
        if(!passwordPattern.test(passwordValue)){
            err.innerHTML = "비밀번호를 확인해주세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            password_input_join.insertBefore(err, password.nextElementSibling);
            password.focus();
            return false;
        }
        if(password_checkValue == ""){
            err.innerHTML = "비밀번호 확인을 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            password_check_input_join.insertBefore(err, password_check.nextElementSibling);
            password_check.focus();
            return false;
        }
        if(passwordValue != password_checkValue){
            err.innerHTML = "비밀번호와 일치하지 않습니다";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            password_check_input_join.insertBefore(err, password_check.nextElementSibling);
            password_check.focus();
            return false;
        }
        if(nameValue == ""){
            err.innerHTML = "이름을 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            name_input_join.insertBefore(err, name.nextElementSibling);
            name.focus();
            return false;
        }
        if(emailValue == ""){
            err.innerHTML = "이메일을 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            email_input_join.insertBefore(err, email.nextElementSibling);
            email.focus();
            return false;
        }
        if(!emailPattern.test(emailValue)){
            err.innerHTML = "이메일 형식에 맞게 입력해주세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            email_input_join.insertBefore(err, email.nextElementSibling);
            email.focus();
            return false;
        }
    }
</script>
</html>