<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.tjoeun.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	
	<h4>1.1 변수 선언과 초기화</h4>
	
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
	  - 변수를 선언하고 초기값을 대입해두는 기능을 제공
	  - 해당 변수를 어떤 scope에 담아둘건지 지정가능(생략시 기본값은 pageScope에 담김)
	    => 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아 놓는것이라고 생각하면 됨
	    => c:set으로 선언된 변수는 EL로 접근하여 사용가능
	    
	  - 변수 타입을 별도로 지정하지 않음
	  - **초기값은 반드시 지정해줘야 함!!!!  
	</pre>

	<c:set var="num1" value="10" />					<!-- pageContext.setAttribute("num1","10") -->
	<c:set var="num2" value="20" scope="request" /> <!-- request.setAttribute("num2","20") -->
	
	num1 변수값 : ${ num1 }<br>
	num2 변수값 : ${ num2 }<br><br>
	
	<%-- <c:set var="result" value="num1+num2" />  String문자열이 됨 --%>
	<c:set var="result"  value="${num1 + num2}"  scope="session"/>
	result 변수값 : ${ result }<br><br>
	
	pageScope.num1 : ${pageScope.num1}<br>
	requestScope.num2 : ${requestScope.num2}<br>
	sessionScope.result : ${sessionScope.result}<br>
	requestScope.result : ${requestScope.result}<br><br>
	
	
	<!-- value속성 대신에 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">
		77777
	</c:set>
	
	requestScope.result : ${requestScope.result}<br><br>
	
	<hr>
	
	<h4>1.2 변수 삭제</h4>

	<pre>
	* 변수 삭제 : (c:remove var="삭제하고자하는 변수명" [scope=""])
	  - 해당 scope영역에서 해당 변수를 찾아서 제거하는 태그
	  - scope 지정 생략시 모든 scope에서 해당 변수를 다 찾아서 제거함	
	    => 해당 scope에 .removeAttribute를 통해 삭제와 동일
	</pre>
	
	삭제전 result : ${result}<br><br>
	 
	1) 특정 scope지정하여 삭제<br>
	<c:remove var="result" scope="request" />
	삭제후 result : ${result}<br><br>
	 
	2) 모든 scope에서 삭제<br>
	<c:remove var="result" />
	모두 삭제후 result : ${result}<br><br>
	
	<hr>
	
	<h4>1.3. 변수 출력</h4>
	
	<pre>
	* 데이터를 출력하고자 할 때 사용하는 태그
	  - (c:out value="출력하고자하는 값" [default="기본값"] [escapeXml="true|false"])
	</pre>
	
	<c:out value="${ num1 }" /><br>
	<c:out value="${ abcd }" default="없음" /><br><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<c:out value="${outTest}" /><br><!-- escapeXml생략시 기본값은 true == 태그로 해석하지 않음(문자열로 취금) -->
	<c:out value="${outTest}" escapeXml="false" /><br><br>

	<hr>
	
	<h3>2. 조건문 - if</h3>
	<pre>
	* (c:if test="조건식")
	  - java의 if문과 비슷한 역할을 하는 구문
	  - 조건식은 test속성에 작성(단, EL구문으로 기술해야 됨)
	</pre>
	
	<c:if test="${ num1 < num2 }" >
		<b>num1이 num2보다 작다</b>
	</c:if>
	
	<c:if test="${ num1 >= num2 }">
		<b>num1이 num2보다 크거나 같다</b>
	</c:if>
	<br>
	
	<c:set var="str" value="안녕하세요" />
	
	<c:if test="${ str eq '안녕하세요' }">
		<b>Hello 안녕</b>
	</c:if>
	
	<c:if test="${ str ne '안녕하세요' }">
		<b>Bye 안녕</b>
	</c:if>
	
	<hr>
	
	<h3>3. choose</h3>
	<pre>
	* (c:choose, c:when, c:otherwise)
	  - java의 if-else 와 비슷한 역할을 하는 태그
	  - 각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성(else문의 역할은 c:otherwise)
	</pre>
	
<%-- 
	<% if(num1 > 20) { %>
	
	<% } else if(num1 >= 10) { %>
	
	<% } else { %>
	
	<% } %>
--%>

	<c:choose>
		<c:when test="${ num1 gt 20 }">
			<b>20보다 큰값</b>
		</c:when>
		<c:when test="${ num1 ge 10 }">
			<b>10보다 크고 20보다 작은값</b>
		</c:when>
		<c:otherwise>
			<b>10보다 작은값</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문</h3>
	<pre>
	* for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="증가값"])
	* 향상된 for문 - (c:forEach var="변수명" items="순자적으로접근하고자하는객체(배열|컬렉션)" [varStatus="현재접근된요소의 상태값을 보관할 변수명"])
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red,yellow,green,pink
	</c:set>
	
	colors 변수값 : ${colors}<br>
	
	<ul>
		<c:forEach var="c" items="${colors}">
			<li style="color:${c}">${c}</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("이고잉",25,"여자"));
		list.add(new Person("이순재",35,"남자"));
		list.add(new Person("송미영",22,"여자"));
	%>
	
	<c:set var="plist" value="<%=list %>" scope="request" />
<%-- 	1. 기본 for문 사용
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty plist }">
					<tr>
						<td colspan="3">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${plist}">
						<tr>
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>			
--%>	

<%-- 2. 속성추가 forEach 사용  --%>
	<table border="1">
		<thead>
			<tr>
				<th>index번호</th>
				<th>count번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty plist }">
					<tr>
						<td colspan="5">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${plist}" varStatus="status">
						<tr>
							<td>${status.index}</td> <!-- index 속성 : 0부터 시작 -->
							<td>${status.count}</td> <!-- count 속성 : 1부터 시작 -->
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>			

	<hr>
	
	<h3>5. 반복문 : forTokens</h3>
	<pre>
	* (c:forTokens var="변수명" items="분리시키고자하는 문자열" delims="구분자")
	  - 구분자를 통해서 분리된 각각의 문자열을 순차적으로 접근하면서 반복 수행
	  - java의 split("구분자") 또는 StringTonkenizer와 비슷한 기능
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV,에어컨/냉장고.세탁기" />
	
	<ol>
		<c:forTokens var="d" items="${device}" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리스트링 관련</h3>
	<pre>
	* url 경로를 생성하고, 쿼리스트링을 정의 둘수 있는 태그
	
	&lt;c:url var="변수명" value="요청할 url"&gt;
		&lt;c:param name="키" value="전달할 값" /&gt;
		&lt;c:param name="키" value="전달할 값" /&gt;
	&lt;/c:url&gt;
	</pre>
	
	<a href="list.bo?nowpage=2&num=3">기존방식</a><br><br>
	
	<c:url var="u" value="list.bo">
		<c:param name="nowpage" value="2" />
		<c:param name="num" value="3" />
	</c:url>
	<a href="${u}">c:url을 이용한 방식</a>
	
</body>
</html>