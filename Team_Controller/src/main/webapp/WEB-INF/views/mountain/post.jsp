<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post.jsp</title>
<style type="text/css">
.title {
	text-align: center;
	margin-top: 130px;
}

.table1 {
	border: 1px solid black;
	text-align: center;
	width: 1000px;
	margin: auto;
}

.td1 {
	border-bottom: 1px solid black;
}

.td2 {
	width: 100px;
}

.td3 {
	width: 350px;
}

.td4 {
	width: 400px;
}

.td5 {
	width: 100px;
}

.td5>a {
	text-decoration: none;
	font-size: small;
}

.td6 {
	border-top: 1px solid black;
}

.contentsTitle {
	border: 1px solid black;
	height: 40px;
}

.contents {
	height: 500px;
}

.comment {
	margin-left: 24%;
	margin-top: 10px;
	font-weight: bold;
}

.table2 {
	margin: auto;
	border: 1px solid black;
	width: 1000px;
	border-collapse: collapse;
	text-align: center;
}

.ctd1 {
	width: 150px;
	border-bottom: 1px solid black;
}

.ctd2 {
	width: 550px;
	border-bottom: 1px solid black;
}

.ctd3 {
	width: 200px;
	text-align: right;
	border-bottom: 1px solid black;
}

.ctd4 {
	width: 100px;
	border-bottom: 1px solid black;
}

.ctd4>a {
	text-decoration: none;
	font-size: small;
}

.commentBox {
	width: 920px;
	height: 20px;
	margin-left: 23.7%;
	margin-top: 5px;
}

.go_a {
	text-decoration: none;
	color: black;
}

.post_form {
	margin-bottom: 70px;
}

.content_box01 {
	width: 90%;
	height: 450px;
	margin: 0 auto;
	text-align: left;
}
@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
body{font-family: 'Pretendard-Regular';}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<body>
	<jsp:include page="head_ver3.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	<div class="title">
		<h1>
			<a class="go_a" href="forum_list">자유게시판</a>
		</h1>
	</div>
	<table class="table1">
		<tr class="contentsTitle">
			<td class="td1" colspan="4"><b><h3>${forum.title}</h3></b></td>
		</tr>
		<tr>
			<td class="td2"><b>글 번호 : ${forum.id}</b></td>
			<td class="td3"><b>작성자 : ${forum.userId}</b></td>
			<td class="td4"><b>작성일 :
					${forum.writeDate.getYear()}-${forum.writeDate.getMonthValue()}-${forum.writeDate.getDayOfMonth()}</b></td>
			<td class="td5"><a
				href="forum_modify?forumId=${forum.id}&uId=${forum.uId}">수정 | </a> <a href="forum_delete?forumId=${forum.id}">삭제</a></td>
		</tr>
		<tr class="contents">
			<td class="td6" colspan="4">
				<div class="content_box01">
					<pre>${forum.content}</pre>
					<br>
					<c:if test="${!empty forum.img}">
						<img src="<spring:url value='/resources/forum_img/${forum.img}'/>">
					</c:if>
				</div>
			</td>
		</tr>
	</table>
	<div class="comment">댓글</div>
	<br>
	<table class="table2">
			<tr style="border-bottom: 1px solid black; background: #eee">
				<th>작성자</th>
				<th>내용</th>
				<th style="text-align: right;">작성일</th>
				<th rowspan="1"></th>
			</tr>
		<c:forEach var="reply" items="${replyList}">
			<tr class="test">
				<td class="ctd1">${reply.userId}</td>
				<td class="ctd2">${reply.content}</td>
				<td class="ctd3">${reply.writeDate.getYear()}-${reply.writeDate.getMonthValue()}-${reply.writeDate.getDayOfMonth()}</td>
				<td class="ctd4"><a class="update" href="form_reply_value?id=${reply.id}&forumId=${reply.forumId}">수정 |</a> <a 	href="forum_reply_delete_one?id=${reply.id}&forumId=${reply.forumId}"> 삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form class="post_form" action="forum_reply" method="get">
		<input name="forumId" value="${forum.id}" type="hidden"> <input
			name="content" type="text" class="commentBox" placeholder="댓글을 입력하세요">
		<input class="reply_update" name="reply" type="submit" value="댓글쓰기">
	</form>
</body>
<c:if test="${!empty result}">
	<script type="text/javascript">
	alert("${result}")
</script>
</c:if>
</html>