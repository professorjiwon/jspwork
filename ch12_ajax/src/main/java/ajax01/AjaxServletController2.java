package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.json.simple.*;

public class AjaxServletController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// v1. 응답데이터가 하나의 문자열일 때
		/*
		String responseData = "이름 : " + name + ", 나이 : " + age;
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(responseData);
		*/
		
		// v2. 응답데이터가 여러개 일 때
		/*
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		// v3. 응답데이터가 여러개 일 때 json이나 배열로 반환
		/*
		 JSON(JavaScript Object notation : 자바스크립트 객체 표기법)
		 - ajax 통신시 데이터를 전송에 자주 사용되는 포맷형식중 하나
		 
		 	> [value, value, value] => 자바스크립에서의 배열 객체 => JSONArray
		 	> {key:value, key:value} => 자바스크립에서의 일반 객체 => JSONObject
		 */
		
		// v3.1  JSONArray 배열로 반환
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		// response.setContentType("text/html; charset=utf-8");  => jArr을 반환해 주어도 문자열로 들어감
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr);
		*/
		
		// v3.2  JSONObject 객체로 반환
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
	}
}