<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 산술 연산</h3>
	기존방식 : <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %><br><br>
	
	10 + 3 = ${big + small}<br>
	10 - 3 = ${big - small}<br>
	10 * 3 = ${big * small}<br>
	10 / 3 = ${big / small} 또는 ${big div small}<br>
	10 % 3 = ${big % small} 또는 ${big mod small}<br><br>
	
	<h3>2. 대소 비교 연산</h3>
	10 > 3 = ${big > small} 또는 ${big gt small}<br>
	10 < 3 = ${big < small} 또는 ${big lt small}<br>
	10 >= 3 = ${big >= small} 또는 ${big ge small}<br>
	10 <= 3 = ${big <= small} 또는 ${big le small}<br><br>
	
	
	<h3>3. 동등 비교 연산</h3>
	<!-- el에서는 ==비교는 자바에서 equals()와 같은 동작을 함 -->
	sOne과 sTwo는 일치합니까? ${sOne == sTwo} 또는 ${sOne eq sTwo}<br>
	sOne과 sTwo는 일치하지 않습니까? ${sOne != sTwo} 또는 ${sOne ne sTwo}<br>
	
	big에 담긴값은 10과 일치합니까? ${big == 10} 또는 ${big eq 10}<br>
	sThree에 담긴값은 '안녕'과 일치합니까? ${sThree == '안녕'} 또는 ${sThree eq "안녕"}<br><br>
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h3>
	pTwo가 null입니까? ${pTwo == null} 또는 ${pTwo eq null} 또는 ${empty pTwo}<br>
	pOne이 null입니까? ${pOne == null} 또는 ${pOne eq null} 또는 ${empty pOne}<br>
	pOne이 null이 아닙니까? ${pOne != null} 또는 ${pOne ne null} 또는 ${not empty pOne}<br>	

	aOne이 비어있습니까? ${empty aOne}<br> <!-- ${aOne == null}는 안됨 -->
	aTwo이 비어있습니까? ${empty aTwo}<br>
	
	<h3>5. 논리연산자</h3>
	${ true && true } 또는 ${true and true}<br>
	${ true || false } 또는 ${true or true}<br>
	
	big이 small보다 크고 aOne이 비어있습니까? ${big > small and empty aOne}
</body>
</html>