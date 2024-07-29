<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tjoeun.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL scope</title>
</head>
<body>
	<h3>1. 기존 방식대로 스크립트릿과 표현식을 이용하여 각 scope에 담겨있는 값을 화면에 출력</h3>
	<%
		//   .getAttribute는 Object타입으로 반환
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	<p>
		학원명 : <%=academy %><br>
		강의장 : <%=classRoom %><br>
		강사 : <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %><br><br>
		
		수강생 정보 :
		<ul>
			<li>이름 : <%=student.getName() %></li>
			<li>나이 : <%=student.getAge() %></li>
			<li>성별 : <%=student.getGender() %></li>			
		</ul>
	</p>
	
	<h3>2. EL을 이용하여 보다 쉽게 해당 scope에 저장된 값 출력하기</h3>
	<p>
		학원명 : ${academy}<br>
		강의장 : ${classRoom }<br>
		강사 : ${teacher.name}, ${teacher.age}, ${teacher.gender}<br><br>
		
		수강생 정보 :
		<ul>
			<li>이름 : ${student.name }</li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender }</li>			
		</ul>
	</p>
	
	<h3>3. EL 사용시 내장 객체들의 저자된 키값이 동일한 경우</h3>
	SCOPE값 : ${ scope }<br>
	<!-- 
		EL은 공유범위가 가장 작은 SCOPE부터 해당 키값을 검색함.
		page => request => session => application
		만약 모든 영역에서 못찾을 경우 => 아무것도 출력안됨(오류안남)
	 -->
	 test값 : ${ test }<br><br>
	 
	 <h3>4. 직접 scope를 지정하여 접근하기</h3>
	 <%
	 	// pageScope에 담기
	 	pageContext.setAttribute("scope","page");
	 %>
	 pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope }<br>
	 requestScope에 담긴 값 : ${ requestScope.scope }<br>
	 sessionScope에 담긴 값 : ${ sessionScope.scope }<br>
	 applicationScope에 담긴 값 : ${ application.Scope.scope }<br>
</body>
</html>