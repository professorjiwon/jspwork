package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String nowPage = request.getParameter("nowPage");
		
		Board upBean = new Board();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));  // read.jsp에서 사용자가 넣은 pass
		
		HttpSession session = request.getSession();
		Board inBean = (Board)session.getAttribute("bean");  // DB에 저장되어있는 pass
		
		if(inBean.getPass().equals(upBean.getPass())) {
			new BoardDao().updateBoard(upBean);
			String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("		alert('비밀번호가 맞지 않습니다.')");
			out.println("		history.back()");
			out.println("</script>");
		}
	}
}