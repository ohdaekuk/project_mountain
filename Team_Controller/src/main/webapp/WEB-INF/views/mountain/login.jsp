<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style type="text/css">
.login_box {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
	margin-top: 250px;
	margin-bottom: 343px;
	font-family: 'Pretendard-Regular';
}

.login_logo {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 20px;
	display: inline-block;
}

.login_kakao {
	width: 220px;
}

.join_text {
	margin: 0 auto;
	margin-left: 100px;
	display: inline-block;
	height: 40px;
}

.login_id {
	width: 350px;
	height: 35px;
	text-align: center;
	font-size: 16px;
}

.login_password {
	width: 350px;
	height: 35px;
	text-align: center;
	margin-top: -1px;
	font-size: 16px;
}

.login_button {
	width: 370px;
	height: 40px;
	border-radius: 10px;
	background: white;
	font-size: 19px;
	margin-top: 15px;
	margin-bottom: -20px;
}

.find_box {
	margin-top: 20px;
}

.find>a, .join_text>a {
	text-decoration: none;
	color: black;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
		
		
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
	<jsp:include page="head_ver2.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	<div class="login_box">

		<span class="login_logo">로그인</span>

		<form name="login_form" class="login_form" action="userLogin" method="post" modelAttribute="user">

			<span class="userId_input_login"><input class="login_id" type="text" name="userId" placeholder="아이디를 입력하세요"></span><br>

			<span class="password_input_login"><input class="login_password" type="password" name="password" placeholder="비밀번호를 입력하세요"></span><br><br> 
				
			<input class="login_button" type="submit" value="로그인">

		</form>
		<div class="find_box">
			<span class="find"><a href="find"><b> 아이디 / 비밀번호 찾기 </b></a></span> <span class="join_text"><a href="join"><b>회원가입</b></a><br></span>
		</div>



		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
        Kakao.init('cfcf064a528e0234692010e114be9bba'); // SDK를 초기화. 사용할 앱의 JavaScript 키를 설정

        console.log(Kakao.isInitialized()); // SDK 초기화 여부를 판단
        
   </script>

		<a id="login_kakao" href="javascript:loginWithKakao()"> <img
			src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
			width="222" />
		</a>


		<script type="text/javascript">
        // 카카오로그인 코드 확인.
        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj); // access토큰 값
                    Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장
                    getInfo();
                    
                    alert("카카오 로그인 성공");
                    window.location = 'http://localhost:8090/main/main';
                },
                fail: function (err) {
                    console.log(err);
                    alert('로그인 실패.' + JSON.stringify(error));
                }
            });
        }

        //엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
        function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res);
                    
                    var email = res.kakao_account.email;
                    console.log(email);
                    
                },
                fail: function (error) {
                	console.log(err);
                    
                }
            });
        }
	</script>

		<script type="text/javascript">
    //ajax로 데이터를 보냄
    function kakaoLoginDb(response){
    	var data = {id:response.id,email:response.kakao_account.email}
    	$.ajax({
    		type : 'POST',
    		url : '/main/login',
    		data : JSON.stringify(data),
    		success : function(data){
    			console.log(data)
    			if(data.JavaData == "YES"){
    				alert("로그인되었습니다.");
    				location.href = '/main/main'
    			}else if(data.JavaData == "register"){
    				$("#kakaoEmail").val(response.kakao_account.email);
    				$("#kakaoId").val(response.id);
    			}else{
    				alert("로그인에 실패했습니다");
    			}
    			
    		},
    		error: function(xhr, status, error){
    			alert("로그인에 실패했습니다."+error);
    		}
    	});
    	
    }
    </script>

		<script>    
        // 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                alert('로그인이 되어있지 않습니다.');
                return;
            }
            Kakao.Auth.logout(function() {
                alert('로그아웃 되었습니다.');
                //alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
            });
        }
    </script>

	</div>
</body>
<script>

    var login_form = document.login_form;
    var err = document.createElement("span");

    var userId_input_login = document.querySelector(".userId_input_login");
    var password_input_login = document.querySelector(".password_input_login");

    login_form.onsubmit = function () {
        var userId = login_form.userId;
        var password = login_form.password;

        var userIdValue = userId.value.trim();
        var passwordValue = password.value.trim();

        if (userIdValue == "") {
            err.innerHTML = "id를 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            userId_input_login.insertBefore(err, userId.nextElementSibling);
            userId.focus();
            return false;
        }
        if (passwordValue == "") {
            err.innerHTML = "비밀번호를 입력하세요";
            err.style.color = "red";
            err.style.marginLeft = "20px";
            password_input_login.insertBefore(err, password.nextElementSibling);
            password.focus();
            return false;
        }
    }
</script>
<c:if test="${!empty result}">
<script type="text/javascript">
	alert("${result}")
</script>
</c:if>
</html>