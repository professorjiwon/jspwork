package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AjaxServletController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		System.out.println("요청시 전달한 값 : " + str);
		
		// DB에서 요청처리를 다 했다는 가정하에 응답할 데이터
		String responseDate = "입력한 값 : " + str + ", 길이 : " + str.length();
		
		// 응답데이터 돌려주기
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(responseDate);
	}
}
