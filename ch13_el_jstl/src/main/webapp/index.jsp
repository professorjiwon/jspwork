<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL_JSTL</title>
</head>
<body>
	<h1>* EL(Expression Language)</h1>
	<p>
		기존에 사용했던 표현식(출력문) &lt;%=변수명 %&gt;<br>
		jsp상에서 표현하고자 하는 값을 \${변수명}의 형식으로 표현하여 작성하는 것
	</p>
	
	<h3><a href="el.do">01_EL 구문</a></h3><br>
	<!-- 
		1. src에 패키지 만들기
		   com.tjoeun.controller
		   com.tjoeun.vo
		2. com.tjoeun.vo 패키지 안에 Person 의 bean파일 만들기
		3. com.tjoeun.controller / Elservlet 만들기 : /el.do, doGet()
		4. views/01_EL/01_el.jsp 파일 만들기
	 -->
	 
	 <h3><a href="operation.do">02_EL의 연산자</a></h3>
	 <!--
	 	1. com.tjoeun.controller / OperationServlet 만들기 : /operation.do, doGet()
		2. views/01_EL/02_operation.jsp 파일 만들기
	 -->
	 
	 <h1>* JSP Action Tag</h1>
	 <p>xml 기술을 이용하여 기존의 jsp문법을 확장시키는 기술을 제공하는 태그들</p>
	 <p>표준 액션 태그 : include와 forward</p>
	 
	 <h3>- 커스텀 액션태그</h3>
	 <a href="views/02_customAction/jstl.jsp">JSTL</a>
</body>
</html>




