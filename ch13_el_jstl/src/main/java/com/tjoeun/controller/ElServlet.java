package com.tjoeun.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tjoeun.vo.Person;

public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터를 담을 수 있는 jsp내장 객체의 종류
		 1. ServletContext(Application Scope)
		 	한 애플리케이션당 단 1개만 존재하는 객체
		 	이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
		 	공유범위가 가장 큼(jsp / servlet / java)
		 2. HttpSession(Session Scope)
		 	한 브라우저당 1개가 존재하는 객체
		 	이 영역에 데이터를 담으면 jsp / servlet단에서 가용가능
		 	공유범위가 2번째로 큼
		 3. HttpServletRequest(request Scope)
		 	요청 때마다 매번 생성되는 객체
		 	이 영역에 데이터를 담으면 request객체를 포워딩 받는 응답jsp에서만 사용가능
		 	공유범위는 응답jsp
		 4. PageContext(page Scope)
		 	jsp페이지마다 존재하는 객체
		 	공유범위가 가장 작음(해당 페이지 내에서만 사용가능)
		 	
		 위의 4개의 객체들을
		 데이터를 담을 때    .setAttribute("키", 담고자하는 데이터)
		 데이터를 꺼낼 때    .getAttribute("키") => 키에 담겨있는 데이터 반환
		 데이터를 삭제 할 때  .removeAttribute("키")		 
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "801호");
		request.setAttribute("student", new Person("홍길동", 23, "남자"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "tjoeun");
		session.setAttribute("teacher", new Person("김지원", 35, "여자"));
		
		// requestScope와 sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// 응답페이지를 지정하여 포워딩 되도록 설정
		request.getRequestDispatcher("views/01_EL/01_el.jsp").forward(request, response);
	}

}
