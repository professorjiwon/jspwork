<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/index.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="resources/js/jQueryUser.js?v=1"></script>
</head>
<body>
	<header>
		<div class="logo">
			<img src="https://www.tjoeun.co.kr/images/logo.gif?v=20190918" alt="로고">
		</div>
		<nav>
			<ul class="nav">
				<li><a href="vote/voteList.jsp">투표프로그램</a></li>
				<li><a href="board/list.jsp">게시판</a></li>
				<c:choose>
					<c:when test="${ empty idKey }">
						<li><a href="member/login.jsp">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="member/logout.jsp">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<div id="login">
			<c:if test="${ !empty idKey }">
				<p>[${idKey}님 로그인 상태]</p>
			</c:if>
		</div>
	</header>
	<article>
		<section id="imgslide">
            <img src="resources/img/slide1.jpg" alt="여행사진1">
            <img src="resources/img/slide2.jpg" alt="여행사진2">
            <img src="resources/img/slide3.jpg" alt="여행사진3">
        </section>
	</article>
</body>
</html>