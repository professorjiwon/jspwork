<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for</title>
</head>
<body>
<%-- <%
	int sum = 0;
	for (int i=1; i<=10; i++) {
		if(i < 10)
			out.print(i + " + ");
		else
			out.print(i + " = ");
		
		sum += i;
	}
%> --%>

<%
	int sum = 0;
	for (int i=1; i<=10; i++) {
		if(i < 10) {  // jsp를 끊었다가 쓸때는 반드시 중괄호를 해준다
%>
			<%=(i + " + ") %>
<%
		} else {
%>
			<%=(i + " = ") %>
<%
		}
		sum += i;
	}
%>
<%=sum %><br><br>

<%
	int arr[] = new int[10];
	for(int i=0; i<arr.length; i++) {
		arr[i] = i+1;
		//out.print(arr[i] + "<br>");
%>
	<%=arr[i] + "<br>" %>
<%
	}
%>

</body>
</html>