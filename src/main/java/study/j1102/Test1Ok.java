package study.j1102;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/j1102/test1Ok")
public class Test1Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("utf-8");
		
		String content=request.getParameter("content")==null?"":request.getParameter("content");
		String introduce=request.getParameter("introduce")==null?"":request.getParameter("introduce");
		
		
		System.out.println("==========================================");
		System.out.println(" /j1102/Test1Ok.java 입니다.");
		System.out.println("content : " +content);
		System.out.println("introduce : " +introduce);
		
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 Test1Ok 컨트롤러입니다.");
		
		request.setAttribute("msg", "test1Ok.java에서 보낸 메세지입니다.");
		String viewPage="/study/1102_web_xml/test1Res.jsp";
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
