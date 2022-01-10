<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post.jsp</title>
</head>
<style>
    .modify_div{
        width: 500px; margin: 0 auto; margin-top: 100px;
    }

    .modify_content{
        width: 300px; 
        height: 50px;
    }

    .modify_button{
        border-radius: 10px; background: white;
    }
    @font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
	body{font-family: 'Pretendard-Regular';}
</style>
<body>
	<div class="modify_div"> 
        <form action="forum_relpy_modify" method="get">
            <input name="id" value="${reply.id}" type="hidden">
            <input name="forumId" value="${reply.id}" type="hidden">
            <input name="userId" value="${reply.userId}" type="hidden">
            <input class="modify_content" name="content" value="${reply.content}" type="text">
            <input class="modify_button" value="수정하기" type="submit">
        </form>
    </div>
</body>
<c:if test="${empty reply}">
<script type="text/javascript">
	alert("${result}")
</script>
<c:redirect url="post"/>
</c:if>
</html>