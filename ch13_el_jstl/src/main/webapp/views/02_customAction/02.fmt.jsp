<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1. formatNumber</h1>
	<p>
	* 숫자 데이터의 포맷(형식) 지정<br>
	  - 표현하고자하는 숫자 데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그<br>
	  (fmt:formatNumber value="출력할 값" [groupingUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])
	    => groupingUsed : 세자리마다 구분자(,) 표시 여부 (기본값 true = 세자리마다 구분자 표시)
		=> type : percent = %로 출력
		          currency = 현재 local지역의 화폐 표시 여부
		=> currencySymbol : 화폐단위를 넣어 줄 때          	    	
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000" />
	
	그냥 출력 : ${num1}<br>
	세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1}" /><br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/><br><br>
	
	percent : <fmt:formatNumber value="${num2}" type="percent" /><br>
	currency : <fmt:formatNumber value="${num3}" type="currency" groupingUsed="false"/><br>
	currency $ : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$" /><br><br>
	
	<hr>
	
	<h3>2. formatDate</h3>
	<p>날짜와 시간 데이터의 포맷 지정(java.util.Date 객체 사용)</p>
	
	<c:set var="cDate" value="<%= new java.util.Date() %>" />
	그냥 출력 : ${ cDate }<br>
	
	<ul>
		<li>현재 날짜 : <fmt:formatDate value="${cDate}" /></li><!-- type 생략시 기본값 : date -->
		<li>현재 시간 : <fmt:formatDate value="${cDate}" type="time" /></li>
		<li>현재 날짜와 시간 : <fmt:formatDate value="${cDate}" type="both" /></li>
		<li>Medium : <fmt:formatDate value="${cDate}" type="both" dateStyle="medium" timeStyle="medium"/></li>
		<li>Long: <fmt:formatDate value="${cDate}" type="both" dateStyle="long" timeStyle="long"/></li>
		<li>Full: <fmt:formatDate value="${cDate}" type="both" dateStyle="full" timeStyle="full"/></li>
		<li>Short: <fmt:formatDate value="${cDate}" type="both" dateStyle="short" timeStyle="short"/></li>
		<li>내패턴 : <fmt:formatDate value="${cDate}" type="both" pattern="yyyy-MM-dd(E) hh:mm:ss(a)"/> </li>
	</ul>
</body>
</html>