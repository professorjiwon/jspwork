package com.tjoeun.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.tjoeun.vo.Person;

public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTwo", "");
		request.setAttribute("sThree", "안녕");
		
		request.setAttribute("pOne", new Person("", 20, ""));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<>();
		request.setAttribute("aOne", list1);  // 텅빈 리스트
		
		ArrayList<String> list2 = new ArrayList<>();
		list2.add("배열에 값 넣기");
		request.setAttribute("aTwo", list2);
		
		request.getRequestDispatcher("views/01_EL/02_operation.jsp").forward(request, response);
		
	}

}
