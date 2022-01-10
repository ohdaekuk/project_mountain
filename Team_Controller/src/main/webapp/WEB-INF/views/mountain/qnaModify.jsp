<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
<jsp:include page="head_ver2.jsp"></jsp:include>
	 <title>글쓰기!!</title>
    <meta charset="UTF-8">
    <title>modify.jsp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <style>
        .modify_form_title{text-align: center; font-size: large; margin-top: 170px;}
        /* 
        폼태그를 display flex 형태로 지정, 
        방향을 컬럼 형식으로 해서 세로의 각 블록간에 정렬 형식을 만든다.
        justify-content: space-around를 통해 같은 간격으로 블록 배치
        이후 컨테이너 박스는 중앙 정렬하기 위해 margin-left, margin-right를 각 auto처리 해줌.
         */
        .modify_form{
            display: flex; flex-direction: column; justify-content:space-evenly; width: 600px;
            margin-left: auto; margin-right: auto;
        }
        /* 
        include를 통해 합쳤을때 css가 겹치지 않도록, 자식 선택자를 통해 선택함 
        각 블록은 flex-direction으로 세로 배치이후, 정렬 방향과 수직 방향으로 배치하는 속성인 align-items: stretch로 정렬한다.
        */
        .modify_form>.title_div, .modify_form>.main_text_div{display: flex; flex-direction: column; align-items: stretch;}
        /* 
        마지막 블록의 양끝은 좌우 양끝에 배치 되었으므로 dipsplay: flex, justify-content: space-between을 통해
        플렉스로 설정 양끝으로 배열함.
         */
        .modify_form>.button{display: flex; justify-content: space-between;}
        
        .go_a{
		text-decoration: none; color: black;
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
<body>
	<div class="modify_form_title"> <h1><a class="go_a " href="qnaBoard_list">수정하기</a></h1></div>
    <!--게시판으로 이동하는 jsp 파일 -->
    <form class="modify_form" action="qna_modify" method="POST" style="height: 500px;" enctype="multipart/form-data">
    	<input type="hidden" name="id" value="${qna.id}">
        <input type="hidden" name="name" value="${qna.userId}"> 
        <input type="hidden" name="write_date" value="${qna.writeDate}">
        <div class="title_div">
            <p>글쓰기</p>
            <input name="title" type="text" value="${qna.title}">
        </div>

        <div class="main_text_div">
            <p>내용</p>
            <textarea name="content" id="" cols="30" rows="10" style="resize: none; height: 250px;">${qna.content }</textarea>
        </div>

        <div class="button">
            <input name="image" type="file" value="" >
            <input type="submit" class="btn btn-secondary btn-sm" value="수정하기">
        </div>
    </form>
</body>

<jsp:include page="footer.jsp"></jsp:include>

</html> 